<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		회원서비스 - 로그인 (R), 로그아웃, 회원가입(C), 정보변경(U), 회원탈퇴(U), 아이디 중복 체크(R)
		게시판서비스 - 게시판리스트(R), 페이징처리, 게시판 작성하기(C), 첨부파일 업로드, 게시판 상세조회(R),
					게시판 수정(U), 게시판 삭제(U), 댓글리스트 조회(R), 댓글 작성(C)
		1. jstl libraries 4개 직접 lib폴더에 추가
		2. views 폴더 안에 필요한 폴더들 (common, member, board)
		3. 웹문서에서 필요로하는 외부문서들을 관리하는 폴더인 webapp/resources 폴더 안에 필요한 폴더들 (css, js, images, uploadFiles)
		4. 패키지 만들기
		5. resources 폴더 안에 mybatis와 관련된 mapper, config xml 문서 만들기
			>> DTD : xml 문서의 구조 및 해당 문서에서 사용할 수 있는 적합한 요소와 속성들을 정의
					 이 문서가 유효한지 유효성 검사도 됨
			>> DTD 설정해두기 : 
	 -->
	 
	 <jsp:include page = "common/menubar.jsp"/>
	 <div style="height:400px"></div>
	 <jsp:include page = "common/footer.jsp"/>
	 
	 
	 
</body>
</html>