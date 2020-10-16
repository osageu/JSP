package com.kh.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.model.vo.Person;

@WebServlet("/operation.do")
public class OperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OperationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("sOne", "안녕");
		request.setAttribute("sTwo", new String("안녕"));
		
		request.setAttribute("pOne", new Person("홍길동",20,'남'));
		request.setAttribute("pTwo", new Person("홍길동",20,'남'));
		
		request.setAttribute("p", null);
		
		ArrayList<String> list = new ArrayList<>();
		list.add("test");
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/1_EL/03_elOperation.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
