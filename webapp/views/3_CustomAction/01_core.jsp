<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.model.vo.Person, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Core Library Test Page</h1>
	<h3>1. 변수 설정 </h3>
	<c:set var = "num1" value = "10"/>
	<c:set var = "num2" value = "20" scope="request"/> <!-- == request.setAttribute("num2",20); -->
	
	num1 변수값 : ${ num1 } <br>
	num2 변수값 : ${ num2 } <br>
	
	<c:set var="result" value="${ num1 + num2 }" scope = "session"/>
	${num1 } + ${num2 } = ${result }<br><br>
	${ pageScope.num1 } <br>
	${ requestScope.num2 } <br>
	${ requestScope.result } <br>
	${ sessionScope.result } <br>
	
	<c:set var="colors" scope="request">
		red,blue,yellow,pink,green
	</c:set>
	
	colors변수값 : ${ colors } <br>
	
	<hr>
	
	<c:set var="result" value="9999" scope="request"/>
	삭제전 result = ${ result }<br><br>
	1) 특정 scope 지정해서 삭제 <br>
	<c:remove var="result" scope="request"/>
	request에 삭제 후 result : ${result } <br><br>
	
	2)모든 scope에 삭제 <br>
	<c:remove var="result"/>
	모두 삭제 후 result = ${ result }<br><br>
	
	<hr>
	
	<c:set var="outTest" value="<b>출력테스트</b>"/> <br>
	<c:out value="${outTest }" escapeXml="false"/> <br>
	<c:out value="${outTest }" escapeXml="true"/> <br>
	
	<br>
	
	result : ${ result } <br>
	result : <c:out value="${result }" default="없음"/><br>
	
	<h3>2. 조건문 - 단일 IF문 (c:if test="\${ 조건식 }")</h3>
	
	<c:if test="${ num1 gt num2 }">
		<b>num1이 더 큽니다.</b>
	</c:if>
	<c:if test="${ num1 lt num2 }">
		<b>num2이 더 큽니다.</b>
	</c:if>
	
	<br>
	
	<c:set var="str" value="안녕"/>
	<c:if test="${ str eq '안녕' }">
		<b>Hello World</b>
	</c:if>
	<c:if test="${ str ne '안녕' }">
		<b>Bye World</b>
	</c:if>
	
	<br>
	
	<h3>3. 조건문 - IF/ELSE, switch</h3>
	<c:choose>
		<c:when test="${ num1 eq 20 }">
			<b>처음 뵙겠습니다.</b>
		</c:when>
		<c:when test="${ num1 eq 10 }">
			<b>다시 뵙게 되어 반갑습니다.</b>
		</c:when>
		<c:otherwise>
			<b>안녕하세요</b>
		</c:otherwise>
	</c:choose>
	
	<br><br>
	
	<h3>4. 반복문 - For</h3>
	<c:forEach var="i" begin="1" end="10" step="2">
		<b>반복확인 : ${ i }</b> <br>		
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6" >
		<h${ i }>태그 안에서도 el 적용 가능 </h${i }>	
	</c:forEach>
	
	<c:forEach var="c" items="${colors }">
		<font color="${c }">${c }</font> <br>
	</c:forEach>
	
	<ul>
		<c:forEach var="c" items="${ colors }" varStatus="status">
			<li style="background:${c}">목록${status.index }</li>
		</c:forEach>
	</ul>
	
	<%
		ArrayList<Person> list = new ArrayList<>();
		list.add(new Person("홍길동",20,'남'));
		list.add(new Person("김말똥",40,'여'));
		list.add(new Person("김개똥",30,'남'));
		
		request.setAttribute("list", list);
	%>
	
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${list }">
				<tr>
					<td>${ p.name }</td>
					<td>${ p.age }</td>
					<td>${ p.gender }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<h3>5. 반복문 - forTokens</h3>
	<c:set var="device" value="컴퓨터,핸드폰.TV/에어컨.냉장고,세탁기"/>
	<ul>
		<c:forTokens var="d" items="${device }" delims=",./">
			<li>${d }</li>		
		</c:forTokens>
	</ul>
	<hr>
	
	<h3>6. 쿼리스트링 </h3>
	<c:url var="url" value="list.do">
		<c:param name="cPage" value="2"/>
		<c:param name="num" value="10"/>
	</c:url>
	<a href="${ url }">c:url 사용한 방식</a>
</body>
</html>