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
                        <% if(loginUser == null){ %>
	                        <td colspan=2>
	                            <textarea cols="60" rows="3" style="resize: none; readonly;" >로그인 후 이용 가능~</textarea>
	                        </td>
                        <% }else{ %>
	                        <td>
	                            <textarea id="replyContent" cols="50" rows="3" style="resize: none;"></textarea>
	                        </td>
	                        <td><button onclick="addReply();">댓글등록</button></td>
                        <% } %>
                    </tr>
                </thead>
                <tbody id="eee">
                </tbody>
            </table>
        </div>
            <br><br><br>
            
            <script>
            	$(function(){
            		
            		selectReplyList(); // 로딩된 직후에 이 게시글에 달려있는 댓글 리스트 조회 
            		setInterval(selectReplyList, 1000);
            		
            	});
            	
            	function addReply(){
            		$.ajax({
            			url:"<%=contextPath%>/rinsert.bo",
            			type:"post",
            			data:{
            				content:$("#replyContent").val(),
            				bno:<%=b.getBoardNo()%>
            			},
            			success:function(result){
            				if(result>0){
            					console.log("댓글 작성 성공");
            					$("#replyContent").val("");
            					selectReplyList();
            				}else{
            					console.log("댓글 작성 실패");
            				}
            			},
            			error:function(){
            				console.log("fail");
            			}
            		});
            	}
            	
            	function selectReplyList(){
            		$.ajax({
            			url:"<%=contextPath%>/rlist.bo",
            			type:"get",
            			data:{bno:<%=b.getBoardNo()%>},
            			success:function(list){
            				
            				var result ="";
            				for(var i in list){
            					result += "<tr>" + 
            							   	  "<td>" + list[i].replyWriter + "</td>" + 
            							   	  "<td>" + list[i].replyContent + "</td>" + 
            							   	  "<td>" + list[i].createDate + "</td>" + 
            					           "</tr>";
            				}
            				$("#eee").html(result);
            				
            			},
            			error:function(){
            				console.log("fail");
            			}
            		});
            	}
            </script>
            
    </div>
</body>
</html>