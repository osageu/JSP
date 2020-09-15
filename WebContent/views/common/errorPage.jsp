<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg"); // request가 jsp 내장 객체라 바로 접근가능
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage</title>
</head>
<body>
	<h1 align="center" style="color:red"><%=errorMsg%></h1>

    <div align="center">
        <button onclick="history.back();">이전 페이지로</button>
        <button onclick="location.href='<%=request.getContextPath()%>';">메인 페이지로</button>
    </div>
</body>
</html>