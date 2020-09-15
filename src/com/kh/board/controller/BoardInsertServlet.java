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

@WebServlet("/insert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 우선 enctype이 multipart/form-data로 잘 전송되었을 경우 전반적인 내용들이 수행되게끔 검사!
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 파일업로드를 위한 외부 라이브러리 : cos.jar (com.oreilly.servlet의 약자)
			// --> http://www.servlets.com
			
			// 1. 전송되는 파일을 처리할 작업 내용 (전송되는 파일의 용량제한, 전달된 파일을 저장할 폴더 경로)
			// 1-1. 전송파일 용량 제한 (int maxSize --> byte 단위) : 10Mbyte로 제한
			// byte --> kbyte --> mbyte --> gbyte --> tbyte
			// 1kbyte = 1024byte
			// 1mbyte = 1024kbyte = 1024*1024byte
			int maxSize = 10 * 1024 * 1024; // byte단위로 해야 함
			// 1-2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles");
			
			// 2. 전달된 파일명 수정 및 서버에 업로드 작업
			// HttpServletRequest request --> MultipartRequest multiRequest 변환
			// MultipartRequest multiRequest = new MultipartRequest(request객체, 저장할 폴더경로, 용량제한, 인코딩값, 파일명 수정시켜주는 객체);
			// MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			// 위 구문 즉, 위의 MultipartRequest 객체 생성과 동시에 넘어온 첨부파일들이 해당 폴더에 무조건 업로드됨!!
			// --> 즉 문제가 있든 없든 간에 무조건 서버에 업로드 우선시키게 됨
			// --> 그말인 즉슨, 혹시나 문제가 생겼을 경우 업로드된 파일을 찾아서 삭제 시켜야 메모리 관리에 좋음
			// 그리고 사용자가 올린 파일명 그대로 해당 폴더에 업로드하지 않는 게 일반적임
			// --> 같은 파일명이 있을 경우 덮어씌워질 수도 있고, 한글/특수문자/띄어쓰기가 포함된 파일명일 경우 서버에 따라 문제 발생..
			// 기본적인 수정명 작업을 해주는 객체 : DefaultFileRenamePolicy 객체 (cos.jar에서 제공하는 객체)
			// --> 내부적으로 rename() method가 실행되면서 파일명 수정진행됨!!
			// --> 기존에 동일한 파일명이 있을 경우 뒤에 카운팅된 순자를 붙여줌
			//
			// 절대 안겹치게끔 rename 해볼거임
			// DefaultFileRenamePolicy 클래스 사용 x --> 나만의 com.kh.common.MyFileRenamePolicy 클래스 만들어서 rename메소드 재정의할꺼임
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3.DB에 기록할 데이터를 뽑아서 vo에 주섬주섬 담기
			// --> 우선 글제목이나 내용, 작성자 번호를 뽑아서 Board 테이블 Insert
			// --> 넘어온 첨부파일이 있다면 첨부파일의 원본명, 수정명, 폴더 경로를 뽑아서 Attachment 테이블에 Insert
			// 3-1. Board 테이블에 Insert할 게시판 제목, 내용, 작성자 회원번호를 Board객체 담기
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String boardWriter = multiRequest.getParameter("userNo");
			
			Board b = new Board();
			b.setCategory(category);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardWriter(boardWriter);
			
			// 3-2. 첨부파일이 있다면 Attachment 테이블에 Insert할 원본명, 수정명, 저장폴더경로를 Attachment 객체 담기
			Attachment at = null;
			// System.out.println(multiRequest.getOriginalFileName("upfile"));
			if(multiRequest.getOriginalFileName("upfile") != null) {
				String originName = multiRequest.getOriginalFileName("upfile");
				String changeName = multiRequest.getFilesystemName("upfile");
				
				at = new Attachment();
				at.setOriginName(originName);
				at.setChangeName(changeName);
				at.setFilePath("resources/board_upfiles/");
			}
			
			// 4. 일반게시판 작성용 서비스 요청 (Board객체, Attachment객체)
			int result = new BoardService().insertBoard(b, at);
			// case1 : 첨부파일o --> insertBoard(생성된 Board객체, 생성된 Attachment객체)
			// case2 : 첨부파일x --> insertBoard(생성된 Board객체, null)
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 등록 성공!");
				response.sendRedirect(request.getContextPath() + "/list.bo?currentPage=1");
			}else {
				if(at != null) {
					File failedFile = new File(savePath + at.getChangeName());
					failedFile.delete();
				}
				request.getSession().setAttribute("errorMsg", "일반 게시판 등록 실패!!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
