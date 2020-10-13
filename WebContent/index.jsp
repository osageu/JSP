<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.model.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxProject</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
		body{
			padding:30px;
		}
	</style>
</head>
<body>
	<h1>AJAX 개요</h1>
	<p>
		Asynchronous JavaScript And Xml <br>
		서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고 일부만 로드할 수 있게 하는 기법! <br>
		우리가 기존에 a로 요청 및 form의 submit을 통해 요청했던 방식은 동기식 요청이였음 <br>
	</p>
	<h2>기존의 동기식 요청방식</h2>
	<form action="test1.do">
		<input type="text" name="input">
		<input type="submit" value="검색">
	</form>
	<br>
	<input type="text" id="test">
	<button onclick="requestTest();">제출</button>

	<script>
		function requestTest(){
			location.href = "test2.do?input=" + $("#test").val();
		}
	</script>

	<hr>

	<h2>jQuery방식에섯의 ajax통신으로 비동기식 요청</h2>
	<h3>1. 버튼 클릭 시 GET방식으로 서버에 데이터 전송 및 응답</h3>

	입력 :
	<input type="text" id="input1">
	<button id="btn1">전송</button>
	<br>
	응답 : <label id="output1"></label>

	<script>
		$("#btn1").click(function(){
			$.ajax({
				url:"jqAjax1.do",					// url : 요청할 url (필수!)
				data:{input:$("#input1").val()},	// data : 요청 시 전달할 데이터(key:value)
				type:"get",							// type : 전송방식 (get/post)
				success:function(result){			// success : 전송 성공 시 호출
													// result 매개변수 : 서버에서 응답이 왔을 때 그 응답데이터가 저장될 변수
					console.log("ajax 성공");
					$("#output1").text(result);
				},
				error:function(){					// error : 전송 실패 시 호출
					console.log("ajax 실패");
				},
				complete:function(){				// complete : 무조건 호출
					console.log("무조건 호출");
				}

			});
		});
	</script>

	<br><br><br>
	<h3>2. 버튼 클릭 시 post방식으로 여러 개의 데이터 전송 및 응답</h3>
	이름 : <input type="text" id="input2_1"> <br>
    나이 : <input type="number" id="input2_2"> <br>
    <button onclick="test2();">전송</button>

    <br>
    응답 : <label id="output2">현재 응답결과 없음</label>

    <script>
        function test2(){
            $.ajax({
            	url:"jqAjax2.do",
            	data:{
            		name:$("#input2_1").val(),	// key:value
            		age:$("#input2_2").val()	// key:value
            	},
            	type:"post",
            	success:function(data){
            		$("#output2").text(data);
            	},
            	error:function(){
            		console.log("ajax 실패..");
            	}
            });
        };
    </script>

	<br><br><br>

    <h3>3. 서버로 데이터 전송 후, 응답데이터를 vo객체로 받아보고자할 때</h3>
    <p>
        회원번호를 입력하여 조회하고자 하는 사용자 번호를 전달한 후 그에 대한 응답결과(vo) 받기<br>
        조회된 사용자가 없을 경우 "사용자 정보가 없습니다." 출력
    </p>

    검색할 회원번호 입력 :
    <input type="number" id="userNo">
    <button onclick="test3();">조회</button>

    <div id="output3"></div>

    <script>
        function test3(){
            $.ajax({
                url:"jqAjax3.do",
                data:{userNo:$("#userNo").val()},
                type:"get",
                success:function(obj){
					/* console.log(obj) ;
					console.log(obj.userName); */
					var result = "회원번호 : " + obj.userNo + "<br>"
							   + "회원명 : " + obj.userName + "<br>"
							   + "나이 : " + obj.age + "<br>"
							   + "성별 : " + obj.gender;
					$("#output3").html(result);
                },
                error:function(){
                    console.log("ajax 통신 실패!");
                }
            });
        }
    </script>

	<br>

    <h3>4. 응답 데이터로 여러 개의 객체들이 담겨있는 ArrayList로 응답</h3>

    <button onclick="test4();">전체 회원조회</button>

    <br><br>

    <table id="memberList" border="1" style="text-align:center;">
        <thead>
            <th>번호</th>
            <th>이름</th>
            <th>나이</th>
            <th>성별</th>
        </thead>
        <tbody>

        </tbody>
    </table>

    <script>
        function test4(){
            $.ajax({
            	url:"jqAjax4.do",
            	type:"get",
            	success:function(jArr){
            		console.log(jArr);
            		var result = "";
            		for(var i = 0 ; i < jArr.length ; i++){
            			result += "<tr>" +
            						"<td>" + jArr[i].userNo + "</td>"+
            						"<td>" + jArr[i].userName + "</td>"+
            						"<td>" + jArr[i].age + "</td>"+
            						"<td>" + jArr[i].gender + "</td>"+
            					  "</tr>";
            		}
            		$("#memberList tbody").html(result);
            	},
            	error:function(){
            		console.log("fail");
            	}
            });
        };
    </script>

	<h3>5. Gson을 이용한 ArrayList 가져와보기</h3>

	<button onclick = "test5();">전체 회원조회</button>

	<br><br>

	<table id="memberList2" border="1" style="text-align:center;">
        <thead>
            <th>번호</th>
            <th>이름</th>
            <th>나이</th>
            <th>성별</th>
        </thead>
        <tbody>

        </tbody>
    </table>

	<script>
		function test5(){

			$.ajax({
				url:"jqAjax5.do",
				type:"get",
				success:function(list){
					console.log(list);
					var result = "";
					for(var i in list){
						result += "<tr>" +
										"<td>" + list[i].userNo + "</td>" +
										"<td>" + list[i].userName + "</td>" +
										"<td>" + list[i].age + "</td>" +
										"<td>" + list[i].gender + "</td>" +
						          "</tr>";
					}
					$("#memberList2 tbody").html(result);

				},
				error:function(){
					console.log("fail");
				}
			});

		}
	</script>


</body>
</html>
