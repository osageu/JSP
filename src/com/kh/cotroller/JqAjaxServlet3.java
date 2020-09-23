package com.kh.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.model.vo.User;

@WebServlet("/jqAjax3.do")
public class JqAjaxServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JqAjaxServlet3() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		User findUser = new User(userNo, "박철수", 30, '남');
		
		response.setCharacterEncoding("UTF-8");
		JSONObject jsonUser = new JSONObject();
		jsonUser.put("userNo", findUser.getUserNo());
		jsonUser.put("userName", findUser.getUserName());
		jsonUser.put("age", findUser.getAge());
		jsonUser.put("gender", findUser.getGender()+"");
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jsonUser);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
