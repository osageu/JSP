<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_include</title>
</head>
<body>
	<h3>Include</h3>
	<p>또다른 jsp를 포함하고자 할 때 쓰이는 방식</p>
	
	<h4>1. 기존의 include 지시어(정적 include방식 == 컴파일시 포함되는 형태)</h4>
	<%-- 
	<%@ include file="footer.jsp" %>
	
	특징 : 포함한 저 페이지에서 선언된 변수를 현재 이 페이지에서도 사용가능 <br>
	include한 페이지의 year변수값 : <%= year %>

	단, 문제점 : 현재 페이지에서 동일한 이름의 변수로 선언 불가<br>
	 --%>
	
	<h4>2. JSP 표준 액션 태그를 이용한 방식 (동적 include방식 == 런타임 시 포함되는 형태)</h4>
	<jsp:include page="footer.jsp"/> <br><br>
	
	특징1 : 포함한 저 페이지에서 선언된 변수를 공유하지 않음!! --> 현재 페이지에서 쓸 수 없음 --> 동일한 이름의 변수로 선언 가능 <br>
	<% int year = 1900; %> <br>
	<jsp:include page="footer.jsp">
		<jsp:param name="test" value="Hello World"/>
	</jsp:include> 
	
	<br><br>
	
	<jsp:include page="footer.jsp">
		<jsp:param name="test" value="Bye World"/>
	</jsp:include> 
	
</body>
</html>