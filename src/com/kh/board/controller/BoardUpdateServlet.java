package com.kh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/update.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			int bno = Integer.parseInt(multiRequest.getParameter("bno"));
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			
			Board b = new Board();
			b.setBoardNo(bno);
			b.setCategory(category);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			
			Attachment at = null;
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				at = new Attachment();
				
				// 아래 3개의 정보는 기존의 첨부파일 유무에 상관없는 공통항목들
				at.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				at.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				at.setFilePath("resources/board_upfiles");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					// 새 첨부파일 + 기존의 파일o
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					// 기존 파일 삭제
					File deleteFile = new File(savePath + multiRequest.getParameter("originFileName"));
					deleteFile.delete();
				}else {
					// 새 첨부파일 + 기존의 파일x
					at.setRefBoradNo(bno);
				}
			}
			int result = new BoardService().updateBoard(b, at);
			// case 1 : 새로운 첨부파일x 				--> updateBoard(b, null); 				--> Board Update
			// case 2 : 새로운 첨부파일o, 기존의 첨부파일o 	--> updateBoard(b, fileNo담긴 at); 		--> Board Update, Attachment Update
			// case 3 : 새로운 첨부파일o, 기존의 첨부파일x	--> updateBoard(b, refBoardNo담긴 at); 	--> Board테이블에만 Update
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 수정 성공!!");
				response.sendRedirect(request.getContextPath() + "/detail.bo?bno=" + bno);
			}else {
				request.getSession().setAttribute("errorMsg", "게시글 수정 실패!!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
