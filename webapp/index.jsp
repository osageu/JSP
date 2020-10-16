<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>EL(Expression Language 표현 언어)</h1>
	
	<h3>1.기본EL</h3>
	<a href="el.do">01_EL</a>
	
	<br>
	
	<h3>2.EL에서의 Param을 배워보자</h3>
	<form action="views/1_EL/02_elParam.jsp">
		<input type="text" name="pname" placeholder="제품명을 입력하세요"> <br>
		<input type="number" name="pcount" placeholder="수량을 입력하세요"><br>
		<input type="text" name="option" placeholder="옵션1"><br>
		<input type="text" name="option" placeholder="옵션1"><br>
		<button type="submit">02_EL(Param)</button>
	</form>
	
	<br>
	
	<h3>3. EL에서의 연산자에 대해서 배워보자</h3>
	<a href="operation.do">03_EL(연산자)</a>
	
	<br><br>
	<br><br>
	<hr>
	<br><br>
	<h1>JSP Action Tag</h1>
	<p>
		JSP Action Tag는 XML기술을 이용하여 기존의 JSP 문법을 확장하는 기술을 제공하는 태그
	</p>
	
	<h3>1. 표준 액션 태그 (Standard Action)</h3>
	<p>JSP페이지에서 별도의 연동없이 사용 가능 / 태그 앞에 jsp:</p>
	<a href="views/2_StandardAction/01_include.jsp">01_jsp:include</a><br>
	<a href="forward.do">02_jsp:forward</a>
	<hr>
	<h3>2. 커스텀 액션 태그 (Custom Action)</h3>
	<p>JSP페이지에서 별도의 라이브러리(JSTL) 연동해야만 사용 가능 / 태그 앞에 jsp:외의 다른 접두어</p>
	<a href="views/3_CustomAction/jstl.jsp">JSTL</a>
			
</body>
</html>