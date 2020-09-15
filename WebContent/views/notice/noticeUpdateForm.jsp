<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeUpdateForm</title>
 <style>
        .outer{
            background: black;
            color: white;
            width: 800px;
            height: 500px;
            margin: auto;
            margin-top: 50px;
        }
        #updateForm>table{
            border: 1px solid white;
        }
        #updateForm input, #updateForm textarea{
            width: 100%;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
	<!-- 메뉴바 추가 -->
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">공지사항 수정하기</h2>
        <br>

        <form id="updateForm" action="<%=contextPath%>/update.no" method="POST">
        	<input type="hidden" name="nno" value="<%=n.getNoticeNo()%>"> 
            <table align="center">
                <tr>
                    <th>제목</th>
                    <td colspan="3" width="300"><input type="text" name="title" value="<%=n.getNoticeTitle()%>"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <textarea name="content" rows="13" style="resize: none;"><%=n.getNoticeContent()%></textarea>
                    </td>
                </tr>
            </table>
            <br><br>
            <div align="center">
                <button type="submit">수정하기</button>
                <button type="button" onclick="history.back();"></button>
            </div>
        </form>
    </div>
</body>
</html>