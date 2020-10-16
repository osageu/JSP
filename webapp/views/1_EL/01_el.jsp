<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.model.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_el</title>
</head>
<body>
	<h3>
		1. 기존에 하던 방식대로 스크립틀릿과 표현식을 이용해서 각 영역에 담겨있는 값 뽑아서 화면에 출력
	</h3>
	
	<%-- 
	<%
		// requesetScope
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
		
		// sessionScope
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
		
		
		
		
	%>
	<p>
		학원명 : <%=academy %> <br>
		강의장 : <%=classRoom %> <br>
		강사 : <%=teacher.getName() %>,<%=teacher.getAge() %>,<%=teacher.getGender() %> <br>
		
		수강생 정보
		<ul>
			<li>이름 : <%= student.getName() %></li>
			<li>나이 : <%= student.getAge() %></li>
			<li>성별 : <%= student.getGender() %></li>
		</ul>
	</p>
	--%>
	
	<h3>
		2. EL을 이용해서 보다 쉽게 request, session 객체에 저장된 값들 출력하기
	</h3>
	<p>
		EL을 이용하게 되면 get method를 통해서 값을 가져올 필요 없이 key로 value에 접근 가능
		내부적으로 해당 객체들의 getAttribute를 자동적으로 활용하여 해당 키에 저장된 value 읽음
	</p>
	<p>
		학원명 : ${ academy } <br> <!-- page -> request -> session -> application 순으로 탐색함 -->
		강의장 : ${ classRoom } <br>
		강사 : ${teacher.name }, ${teacher.age }, ${teacher.gender }<br><br>
		
		수강생 정보
		<ul>
			<li>이름 : ${student.name }</li>
			<li>나이 : ${student.age }</li>
			<li>성별 : ${student.gender }</li>
		</ul>
	</p>
	
	<h3>3. 단, EL사용 시 key값이 동일한 경우</h3>
	<p>
		scope 값 : ${scope }
	</p>
	
	<h3>4. 특정 내장 객체를 지정하면서 키값을 제시</h3>	
	<%
		// pageScope에 담기
		pageContext.setAttribute("scope", "page");
	%>
	<p>
		pageScope에 담긴 값 : ${scope } 또는 ${pageScope.scope } <br>
		sessionScope에 담긴 값 : ${sessionScope.scope }<br>
		requestScope에 담긴 값 : ${requestScope.scope }<br>
	</p>
</body>
</html>