package com.kh.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.model.vo.User;

@WebServlet("/jqAjax4.do")
public class JqAjaxServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JqAjaxServlet4() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> list = new ArrayList<>();
		list.add(new User(1, "박철수", 34, 'M'));
		list.add(new User(2, "김영희", 23, 'F'));
		list.add(new User(3, "오영심", 53, 'F'));
		list.add(new User(4, "이민기", 24, 'M'));
		list.add(new User(5, "홍길동", 21, 'F'));
		
		JSONArray jArr = new JSONArray();
		
		for(User u : list) {
			JSONObject jsonUser = new JSONObject();
			jsonUser.put("userNo", u.getUserNo());
			jsonUser.put("userName", u.getUserName());
			jsonUser.put("age", u.getAge());
			jsonUser.put("gender", u.getGender()+"");
			
			jArr.add(jsonUser);
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jArr);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
