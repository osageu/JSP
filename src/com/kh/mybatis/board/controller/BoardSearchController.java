package com.kh.mybatis.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mybatis.board.model.service.BoardService;
import com.kh.mybatis.board.model.service.BoardServiceImpl;
import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.board.model.vo.SearchCondition;
import com.kh.mybatis.common.Pagination;
import com.kh.mybatis.common.vo.PageInfo;

@WebServlet("/search.bo")
public class BoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardSearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		
		SearchCondition sc = new SearchCondition();
		
		switch(condition) {
			case "writer" : sc.setWriter(keyword); break;
			case "title" : sc.setTitle(keyword); break;
			case "content" : sc.setContent(keyword); break;
		}
		
		
		BoardService bService = new BoardServiceImpl();
		int listCount = bService.selectSearchListCount(sc);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = bService.selectSearchList(sc, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sc", sc);
		request.getRequestDispatcher("WEB-INF/views/board/boardListView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
