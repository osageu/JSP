<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
	<%
		String year = new SimpleDateFormat("yyyy").format(new Date());
	%>
	Copyright @ 1998-<%= year %> 이 웹페이지의 저작권은 KH정보교육원에 있습니다. <br>
</body>
</html>