<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<style>
    .outer{
        background:black;
        color:white;
        margin: auto;
        width: 900px;
        height: 500px;
        margin-top: 50px;
    }
    #insertForm>table{
        border:1px solid white;
    }
    #insertForm>table textarea, #insertForm>table input{
        width: 100%;
        box-sizing: border-box;
    }
    #insertForm>table th{
    	text-align:center;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
        <br>
        <h2 align="center">게시판 작성하기</h2>
        <br>

        <form action="<%= contextPath %>/insert.bo" id="insertForm" method="POST" enctype="multipart/form-data">
            <!-- 카테고리, 제목, 내용, 첨부파일 -->
            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
            <table align="center">
                <tr>
                    <th width="70">분야</th>
                    <td width="500">
                        <select name="category">
                            <option value="10">공통</option>
                            <option value="20">운동</option>
                            <option value="30">등산</option>
                            <option value="40">게임</option>
                            <option value="50">낚시</option>
                            <option value="60">요리</option>
                            <option value="70">기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" rows="10" style="resize: none;"></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="upfile"></td>
                </tr>
            </table>

            <br>
            <div align="center">
                <button type="submit">작성하기</button>
                <button type="reset">취소하기</button>
            </div>

        </form>
    </div>
</body>
</html>