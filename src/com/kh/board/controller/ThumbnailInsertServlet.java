package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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

@WebServlet("/insert.th")
public class ThumbnailInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThumbnailInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_files/");
			int maxSize = 10 * 1024 * 1024;
			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, new MyFileRenamePolicy());
			String userNo = mr.getParameter("userNo");
			String boardTitle = mr.getParameter("title");
			String boardContent = mr.getParameter("content");
			
			Board b = new Board();
			b.setBoardWriter(userNo);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			
			ArrayList<Attachment> list = new ArrayList<>();
			for(int i = 1 ; i <= 4 ; i++) {
				String key = "file" + i;
				if(mr.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(mr.getOriginalFileName(key));
					at.setChangeName(mr.getFilesystemName(key));
					at.setFilePath("resources/thumbnail_files/");
					
					if(i == 1) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
					
					list.add(at);
				}
			}
			
			int result = new BoardService().insertThumbnailBoard(b, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "사진 게시판 등록 성공!!");
				response.sendRedirect(request.getContextPath()+"/list.th");
			}else {
				for(int i = 0 ; i < list.size() ; i++) {
					File failedFile = new File(savePath + list.get(i).getChangeName());
					failedFile.delete();
				}
				request.setAttribute("errorMsg", "사진 게시판 등록 실패..");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
