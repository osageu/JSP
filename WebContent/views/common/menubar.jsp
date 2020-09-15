<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.*" %>
<%	
	String contextPath = request.getContextPath();
	
	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 전 : null
	// 로그인 후 : Member
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 : null
	// 서비스 요청 후 : alert
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menubar</title>
	<style>
        #loginForm, #userInfo{
            float:right;
        }
        #loginForm button{
            border: none;
            padding: 5px;
            border-radius: 5px;
        }
        #loginForm [type=submit]{
            background: yellowgreen;
        }
        #loginForm [type=button]{
            background: orangered;
        }
        #userInfo a{
            color:black;
            text-decoration: none;
            font-size: 12px;
        }
        
        .navWrap{
            background:black;
        }
        .menu{
            display:table-cell;
            height: 50px;
            width: 150px;
        }
        .menu:hover{
            background:darkgrey;
        }
        .menu>a{
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 20px;
            display: block;
            width: 100%;
            height: 100%;
            line-height: 2.5em;
        }
        .menu a:hover{
        	text-decoration:none;
        	color:white;
        }
        h1>a{
        	text-decoration:none;
        }
    </style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
    	$(function(){
    		var msg = "<%= alertMsg %>";
    		
    		if(msg != "null"){
    			alert(msg);
    			<% session.removeAttribute("alertMsg"); %>
    		}
    		
    	});
    </script>
</head>
<body>
	<h1 align="center"><a href="<%=contextPath%>">Welcome JSP World!!</a></h1>
	<% if(loginUser == null) { %>
    <!-- 로그인 전 보이는 화면 -->
	    <div class="loginArea">
	        <form action="<%=contextPath%>/login.me" method="POST" id="loginForm">
	            <table>
	                <tr>
	                    <th><label for="userId">아이디 : </label></th>
	                    <td><input type="text" id="userId" name="userId" required></td>
	                </tr>
	                <tr>
	                    <th><label for="userPwd">비밀번호 : </label></th>
	                    <td><input type="password" id="userPwd" name="userPwd"></td>
	                </tr>
	                <tr>
	                    <th colspan="2" style="text-align:center;">
	                        <button type="submit">로그인</button>
	                        <button type="button" onclick="enrollPage();">회원가입</button>
	                    </th>
	                </tr>
	            </table>
	        </form>
	        <script>
	        	function enrollPage(){
	        		// location.href="/jsp/views/member/memberEnrollForm.jsp";	
	        		location.href="<%= request.getContextPath() %>/enrollForm.me";
	        	};
	        </script>
	    </div>
	<% }else{ %>
	    <!-- 로그인 후 보이는 화면 -->
	    <div id="userInfo">
	        <b><%=loginUser.getUserName() %>님</b>의 방문을 환영합니다. <br><br>
	        <div align="center">
	            <a href="<%=contextPath%>/myPage.me">마이페이지</a>
	            <a href="<%=contextPath%>/logout.me">로그아웃</a>
	        </div>
	    </div>
	<% } %>

    <br clear="both">
    <br>
    <div class="navWrap" align="center">
        <div class="menu"><a href="<%=contextPath%>">HOME</a></div>
        <div class="menu"><a href="<%=contextPath%>/list.no">공지사항</a></div>
        <div class="menu"><a href="<%=contextPath%>/list.bo?currentPage=1">일반게시판</a></div>
        <div class="menu"><a href="">사진게시판</a></div>
    </div>
</body>
</html>