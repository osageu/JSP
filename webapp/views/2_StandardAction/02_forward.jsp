<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_forward</title>
</head>
<body>
	<h1>Forward</h1>
	<p>jsp에서 또다른 jsp로 바로 포워딩 가능하게 하는 표준액션 태그가 있음</p>
	<%if(request.getAttribute("status").equals("success")){ %>
		<jsp:forward page="successPage.jsp">
			<jsp:param name="message" value="${status }"/>
		</jsp:forward>
	<%}else{ %>
		<jsp:forward page="failPage.jsp">
			<jsp:param name="message" value="실패했습니다.. 분발하세요 !" />
		</jsp:forward>
	<%} %>
</body>
</html>