package com.kh.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.model.vo.User;

@WebServlet("/jqAjax5.do")
public class JqAjaxServlet5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JqAjaxServlet5() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> list = new ArrayList<>();
		list.add(new User(1, "박철수", 34, 'M'));
		list.add(new User(2, "김영희", 23, 'F'));
		list.add(new User(3, "오영심", 53, 'F'));
		list.add(new User(4, "이민기", 24, 'M'));
		list.add(new User(5, "홍길동", 21, 'F'));
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8");
		gson.toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
