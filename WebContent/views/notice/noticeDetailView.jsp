<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice"%>
<!DOCTYPE html>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDetailView</title>
<style>
        .outer{
            background: black;
            color: white;
            margin:auto;
            margin-top: 50px;
        }
        #detailArea{
            border: 1px solid white;
            border-collapse: collapse;
        }
        #detailArea p{
            height: 150px;
        }
        #detailArea th{
        	text-align: center;
        }
    </style>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">공지사항 상세보기</h2>
        <br>
        <table id="detailArea" align="center" border="1">
            <tr>
                <th width="70">제목</th>
                <td colspan="3" width="300"><%=n.getNoticeTitle()%></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= n.getNoticeWriter() %></td>
                <th>작성일</th>
                <td><%= n.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p><%= n.getNoticeContent() %></p>
                </td>
            </tr>
        </table>
        <br><br>
        <div align="center">
            <a href="<%=contextPath%>/list.no" class="btn btn-secondary">목록가기</a>

            <!-- 현재 로그인한 사용자가 해당 글 주인일 경우 -->
            <% if(loginUser != null && loginUser.getUserId().equals(n.getNoticeWriter())) { %>
            <a href="<%=contextPath%>/updateForm.no?nno=<%=n.getNoticeNo()%>" class="btn btn-info">수정하기</a>
            <a href="<%=contextPath%>/delete.no?nno=<%=n.getNoticeNo()%>" class="btn btn-warning">삭제하기</a>
            <% } %>
        </div>
        <br>
    </div>
</body>
</html>