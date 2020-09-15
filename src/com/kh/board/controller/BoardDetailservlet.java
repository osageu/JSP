package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;

@WebServlet("/detail.bo")
public class BoardDetailservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDetailservlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int result = new BoardService().increaseCount(bno);
		if(result > 0) {
			Board b = new BoardService().selectBoard(bno);
			Attachment at = new BoardService().selectAttachment(bno);
			
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request,response);
			
		}else {
			request.getSession().setAttribute("errorMsg", "Wrong!");
			request.getRequestDispatcher("views/common/errorPage").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
