package com.kh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.model.vo.Person;

@WebServlet("/el.do")
public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ElServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 *  데이터들을 담을 수 있는 JSP 내장 객체 종류
		 *  1. application
		 *  	> 1개의 aplication(project)당 1개만 존재함
		 *  	> application 전역에서 사용 가능 
		 *  	> jsp / servlet / java
		 *  	> ServletContext 타입 
		 *  2. session
		 *  	> 1개의 browser당 1개만 존재함
		 *  	> jsp/servlet에서 사용 가능
		 *  	> HttpSession 타입
		 *  3. request
		 *  	> 사용자가 요청할때마다 생성되는 객체
		 *  	> 해당 request 객체를 forwarding 받는 응답페이지에서만 사용 가능
		 *  	> HttpServletReqest 타입
		 *  4. page
		 *  	> 해당 그 페이지에서만 사용 가능
		 *  
		 *  위의 객체들에 데이터를 담을 때
		 *  	> .setAttribute("key",value)
		 *  위의 객체들의 데이터를 불러올 때
		 *  	> .getAttribute("key",value)
		 *  위의 객체들의 데이터를 삭제할 때
		 *  	> .removeAttribute("key")
		 *  
		 */
		
		// requestScope에 담기
		request.setAttribute("classRoom", "I강의장");
		request.setAttribute("student", new Person("홍길동",23,'남'));
		
		// requestScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "KH정보교육원");
		session.setAttribute("teacher", new Person("강보람",20,'여'));
		
		// applicationScope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		// requestScope와 sessionScope에 동일한 키값으로 담아보기
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		// 응답페이지를 만드는 역할을 JSP에게 위임할 때 필요한 객체(class) : RequestDispatcher
		RequestDispatcher view = request.getRequestDispatcher("views/1_EL/01_el.jsp");
		view.forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
