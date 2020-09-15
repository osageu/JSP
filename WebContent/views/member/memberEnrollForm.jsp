<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberEnrollForm</title>
<style>
        .outer{
            background:black;
            color: white;
            width: 600px;
            margin:auto;
            margin-top:50px;
        }
        #enrollForm table{
            margin:auto;
        }
        #enrollForm input{
            margin:5px;
        }
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

	<div class="outer">
        <br>

        <h2 align="center">회원가입</h2>

        <form action="<%= request.getContextPath() %>/insert.me" id="enrollForm" method="POST">
            <table>
                <tr>
                    <td>* 아이디 </td>
                    <td><input type="text" name="userId" maxlength="12" required></td>
                    <td><button type="button">중복확인</button></td>
                </tr>
                <tr>
                    <td>* 비밀번호 </td>
                    <td><input type="password" name="userPwd" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 비밀번호 확인</td>
                    <td><input type="password" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" maxlength="5" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;전화번호</td>
                    <td><input type="tel" name="phone" placeholder="(-포함)"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;주소</td>
                    <td><input type="text" name="address"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;관심분야</td>
                    <td colspan="2">
                        <input type="checkbox" id="운동" name="interest" value="운동">
                        <label for="운동">운동</label>
                        <input type="checkbox" id="등산" name="interest" value="등산">
                        <label for="등산">등산</label>
                        <input type="checkbox" id="낚시" name="interest" value="낚시">
                        <label for="낚시">낚시</label> <br>
                        <input type="checkbox" id="요리" name="interest" value="요리">
                        <label for="요리">요리</label>
                        <input type="checkbox" id="게임" name="interest" value="게임">
                        <label for="게임">게임</label>
                        <input type="checkbox" id="기타" name="interest" value="기타">
                        <label for="기타">기타</label>
                    </td>
                </tr>
            </table>
            <br><br>
            <div align="center">
                <button type="submit">회원가입</button>
                <button type="reset">초기화</button>
            </div>
        </form>
        <br><br>
        
    </div>
</body>
</html>