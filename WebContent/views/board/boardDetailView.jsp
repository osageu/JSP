<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*"%>
<%
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
        .outer{
            background: black;
            color: white;
            width: 900px;
            height: auto;
            margin: auto;
            margin-top: 50px;
        }
        .outer table{
            border-color: white;
            border-collapse: collapse;
        }
        #detailArea p{
            height: 200px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">

        <br>
        <h2 align="center">게시판 상세보기</h2>
        <br>
        
        <table id="detailArea" align="center" border="1">
            <tr>
                <th width="70">분야</th>
                <td width="70"><%= b.getCategory() %></td>
                <th width="70">제목</th>
                <td width="350"><%= b.getBoardTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= b.getBoardWriter() %></td>
                <th>작성일</th>
                <td><%= b.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>                
                <td colspan="3">
                    <p><%= b.getBoardContent() %></p>
                </td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="3">
                	<% if(at == null){ %>
                		첨부파일이 없습니다.
                	<% }else{ %>
	                    <a download="<%=at.getOriginName()%>" href="<%=contextPath%>/<%=at.getFilePath()%>/<%=at.getChangeName()%>"><%= at.getOriginName() %></a>
                	<% } %>
                </td>
            </tr>
        </table>
        <br>
        <%if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())){ %>
	        <div align="center">
	            <button onclick="location.href='<%=contextPath%>/updateForm.bo?bno=<%=b.getBoardNo()%>';">수정하기</button>
	            <button>삭제하기</button>
	        </div>
        <% } %>
        <% %>
        <% %>
        <% %>
        <br>
        <div id="replyArea">
            <table border="1" align="center">
                <thead>
                    <tr>
                        <th>댓글작성</th>
                        <td>
                            <textarea cols="50" rows="3" style="resize: none;"></textarea>
                        </td>
                        <td><button>댓글등록</button></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>admin</td>
                        <td>댓글내용</td>
                        <td>2020년 9월 15일</td>
                    </tr>
                    <tr>
                        <td>user01</td>
                        <td>댓글내용</td>
                        <td>2020년 9월 15일</td>
                    </tr>
                    <tr>
                        <td>user02</td>
                        <td>댓글내용</td>
                        <td>2020년 9월 15일</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>