<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style>
        .outer{
            background:black;
            color: white;
            width: 600px;
            margin:auto;
            margin-top:50px;
        }
        #myPageForm table{
            margin:auto;
        }
        #myPageForm input{
            margin:5px;
        }
    </style>
<link href="<%=request.getContextPath()%>/resources/css/sample.css" rel="stylesheet">
<script src="<%= request.getContextPath()%>/resources/js/sample.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<% 
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone();
		String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
		String address = (loginUser.getAddress() == null) ? "" : loginUser.getAddress();
		String interest = (loginUser.getInterest() == null) ? "" : loginUser.getInterest();
	%>
	
	<div class="outer">
        <br>

        <h2 align="center">마이페이지</h2>

        <form action="<%= contextPath %>/update.me" id="myPageForm" method="POST">
            <table>
                <tr>
                    <td>* 아이디 </td>
                    <td><input type="text" name="userId" value="<%= userId %>" readonly></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" value="<%= userName %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;전화번호</td>
                    <td><input type="tel" name="phone" placeholder="(-포함)" value="<%= phone %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email" value="<%= email %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;주소</td>
                    <td><input type="text" name="address" value="<%= address %>"></td>
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
            <script>
            	$(function(){
            		var interest = "<%=interest%>";
            		$("input[type=checkbox]").each(function(){
            			if(interest.search($(this).val()) != -1){
            				$(this).attr("checked",true);
            			}
            		});
            	});
            </script>
            
            <br><br>
            <div align="center">
                <button type="submit">정보 변경</button>
                <button type="button" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
                <button type="button" data-toggle="modal" data-target="#deleteForm">회원 탈퇴</button>
            </div>
        </form>
        <br><br>
        
    </div>
    <!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">회원탈퇴</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <b>
                        탈퇴 후 복구가 불가능합니다. <br>
                        정말로 탈퇴하시겠습니까?
                    </b>

                    <form action="<%=contextPath%>/delete.me" method="POST">
                        비밀번호 : 
                        <input type="password" name="userPwd" required>
                        <input type="hidden" name="userId" value="<%=userId%>">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 비밀번호변경 버튼 클릭 시 보여질 Modal -->
    <div class="modal" id="updatePwdForm">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">비밀번호변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" align="center">

                    <form action="<%=contextPath%>/updatePwd.me" method="POST">
                    	<input type="hidden" name="userId" value="<%=userId%>">
                        <table>
                            <tr>
                                <th>현재 비밀번호</th>
                                <td>&nbsp;&nbsp;&nbsp;<input type="password" name="userPwd" required></td>
                            </tr>
                            <tr>
                                <th>변경할 비밀번호</th>
                                <td>&nbsp;&nbsp;&nbsp;<input type="password" name="updatePwd" required></td>
                            </tr>
                            <tr>
                                <th>비밀번호 확인</th>
                                <td>&nbsp;&nbsp;&nbsp;<input type="password" name="checkPwd" required></td>
                            </tr>
                        </table>
                        <br>
                        <button type="submit" class="btn btn-secondary" onclick="return validatePwd();">비밀번호 변경</button>
                    </form>
                    
                    <script>
                    	function validatePwd(){
                    		if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                    			alert("비밀번호가 일치하지 않습니다.");
                    			return false;
                    		}
                    	}
                    </script>
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>