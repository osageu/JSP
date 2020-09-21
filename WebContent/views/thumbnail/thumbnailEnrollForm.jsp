<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        .outer{
            background: black;
            color: white;
            margin: auto;
            margin-top: 50px;
            width: 900px;
            height: 700px;
        }
        #insertForm>table{
        border: 1px solid white; 
        }
        #insertForm input, #insertForm textarea{
            width: 100%;
            box-sizing: border-box;
        }
        #fileArea{
            /* display:none; */
        }
	</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
        <br>
        <h2 align="center">사진게시판 작성하기</h2>
        <br>

        <form action="<%= contextPath %>/insert.th" id="insertForm" method="POST" enctype="multipart/form-data">
        	<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
            <table align="center">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3"><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th width="100">내용</th>
                    <td colspan="3">
                        <textarea name="content" rows="5" style="resize: none;" required></textarea>
                    </td>
                </tr>
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3" align="center">
                        <img src="" id="titleImg" width="250" height="170">
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td><img src="" id="contentImg1" width="150" height="120"></td>
                    <td><img src="" id="contentImg2" width="150" height="120"></td>
                    <td><img src="" id="contentImg3" width="150" height="120"></td>
                </tr>
            </table>

            <div id="fileArea">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>
                <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
                <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
            </div>

            <script>
                $(function(){
                    $("#fileArea").hide();
                    $("#titleImg").click(function(){
                        $("#file1").click();
                    });
                    $("#contentImg1").click(function(){
                        $("#file2").click();
                    });
                    $("#contentImg2").click(function(){
                        $("#file3").click();
                    });
                    $("#contentImg3").click(function(){
                        $("#file4").click();
                    });
                });

                function loadImg(inputFile, num){
                    // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                    // num : 몇 번째 input요소인지 확인
                    // console.log(inputFile.files.length);
                    if(inputFile.files.length == 1){
                        var reader = new FileReader();              // 파일을 읽어들일 FileReader객체
                        reader.readAsDataURL(inputFile.files[0])    // 파일을 읽어들일 Method
                        reader.onload = function(e){                 // 파일 읽기가 다 완료되었을 때 실행할 함수
                            // console.log(e.target.result);
                            switch(num){
                                case 1 : $("#titleImg").attr("src", e.target.result); break;
                                case 2 : $("#contentImg1").attr("src", e.target.result); break;
                                case 3 : $("#contentImg2").attr("src", e.target.result); break;
                                case 4 : $("#contentImg3").attr("src", e.target.result); break;
                            }
                        }
                    }else{
                            switch(num){
                                case 1 : $("#titleImg").attr("src", null); break;
                                case 2 : $("#contentImg1").attr("src", null); break;
                                case 3 : $("#contentImg2").attr("src", null); break;
                                case 4 : $("#contentImg3").attr("src", null); break;
                            }
                    }
                    
                }
            </script>
            
            <br>
            <div align="center">
                <button type="submit">등록하기</button>
            </div>
        </form>
	</div>
</body>
</html>