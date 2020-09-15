<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int pageLimit = pi.getPageLimit();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int boardLimit = pi.getBoardLimit();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListView</title>
<style>
        .outer{
            width: 1000px;
            height: 550px;
            background: black;
            color: white;
            margin: auto;
            margin-top: 50px;
        }
        .listArea{
            border: 1px solid white;
            text-align: center;
        }
        .listArea>tbody>tr:hover{
            cursor: pointer;
            background: grey;
        }
        button[disabled]{
        	background:black;
        	color:white;
        }
    </style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
<div class="outer">
        <br>
        <h2 align="center">게시판</h2>
        <br>
        
		<% if(loginUser != null){ %>
	        <div align="right" style="width:860px;">
	            <a href="<%=contextPath%>/enrollForm.bo"  class="btn btn-secondary">글작성</a>
	            <br><br>
	        </div>
        <% } %>
        
        <table align="center" class="listArea">
            <thead>
                <tr>
                    <th width="70">글번호</th>
                    <th width="70">카테고리</th>
                    <th width="300">제목</th>
                    <th width="100">작성자</th>
                    <th width="50">조회수</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
            	<% if(list.isEmpty()){ %>
	            	<tr>
	            		<td colspan="6">조회된 리스트가 없습니다.</td>
	            	</tr>
            	<% } else {%>
            		<% for(Board b : list){ %>
		                <tr>
		                    <td><%= b.getBoardNo() %></td>
		                    <td><%= b.getCategory() %></td>
		                    <td><%= b.getBoardTitle() %></td>
		                    <td><%= b.getBoardWriter() %></td>
		                    <td><%= b.getCount() %></td>
		                    <td><%= b.getCreateDate() %></td>
		                </tr>
	                <% } %>
            	<% } %>
            </tbody>
        </table>
        <br><br>
        <div class="pagingArea" align="center">
            <button onclick="location.href='<%=contextPath%>/list.bo?currentPage=1';">&lt;&lt;</button>
            <%if(currentPage == 1){ %>
            	<button>&lt;</button>
            <% } else { %>
           		<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage-1%>';">&lt;</button>
            <% } %>
            
            <% for(int p = startPage; p <= endPage ; p++){ %>
            	<% if(p != currentPage){ %>
            	<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=p%>';"><%= p %></button>
            	<% } else { %>
            	<button disabled><%= p %></button>
            	<% } %>
            <% } %>
            
            <%if(currentPage == maxPage){ %>
            	<button>&gt;</button>
            <% } else {%>
            	<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage+1%>';">&gt;</button>
            <% } %>
            <button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=maxPage%>';">&gt;&gt;</button>
        </div>
    </div>
    <div id="test1"></div>
    <div id="test2"></div>
</body>
</html>