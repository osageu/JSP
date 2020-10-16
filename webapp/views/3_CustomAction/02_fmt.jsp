<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1. fmt:formatNumber</h1>
	<c:set var="num1" value="100000000"/>
	그냥 출력 : ${ num1 }<br>
	세 자리마다 구분해서 출력 : <fmt:formatNumber value="${ num1 }" groupingUsed="true"/><br>
	
	<c:set var="num2" value="0.75"/>
	precent : <fmt:formatNumber value="${num2 }" type="percent"/><br>
	currency : <fmt:formatNumber value="${num1 }" type="currency"/><br>
	currency : <fmt:formatNumber value="${num1 }" type="currency" currencySymbol="..!"/><br>
	currency : <fmt:formatNumber value="${num1 }" type="currency" currencySymbol="..!" groupingUsed="false"/><br>
	
	<h1>2. fmt:formatDate</h1>
	<c:set var="current" value="<%= new java.util.Date() %>"/>
	
	그냥출력 : ${ current } <br>
	<ul>
		<li>현재 날짜 : <fmt:formatDate value="${ current }" type="date"/></li>
		<li>현재 시간 : <fmt:formatDate value="${ current }" type="time"/></li>
		<li>날짜 & 시간 : <fmt:formatDate value="${ current }" type="both"/></li>
		<li>full : <fmt:formatDate value="${ current }" type="both" dateStyle="full" timeStyle="full"/></li>
		<li>long : <fmt:formatDate value="${ current }" type="both" dateStyle="long" timeStyle="long"/></li>
		<li>medium : <fmt:formatDate value="${ current }" type="both" dateStyle="medium" timeStyle="medium"/></li>
		<li>short : <fmt:formatDate value="${ current }" type="both" dateStyle="short" timeStyle="short"/></li>
		<li>내 스타일 : <fmt:formatDate value="${ current }" type="both" pattern="YYYY-MM-dd(E) hh:mm:ss(a)"/></li>
	</ul>
	
	
	
	
</body>
</html>