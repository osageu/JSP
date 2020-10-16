<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Functions Library Test Page</h1>
	<c:set var="str" value="How are you?"/>
	str : ${ str } <br>
	문자열의 길이 : ${ str.length() } <br>
	문자열의 길이 : ${ fn:length(str) } <br>
	
	대문자로 변경 : ${ str.toUpperCase() } <br>
	대문자로 변경 : ${ fn:toUpperCase(str) } <br>
	소문자로 변경 : ${ fn:toLowerCase(str) } <br>
	
	are의 시작위치 : ${ fn:indexOf(str, "are") } <br>
	are -> were 변경 후 : ${ fn:replace(str, 'are', 'were') }<br>
	변경 후 str : ${ str } <br>
	
	<c:if test="${ fn:contains(str, 'are') }">
		포함되어 있음
	</c:if>
		
</body>
</html>