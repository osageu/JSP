<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_elParam</title>
</head>
<body>
	<p>
		해당 페이지 요청 시에 전달값은 내부적으로 param 영역에 저장됨
	</p>
	<p>
		상품명 : ${param.pname}<br>
		수량 : ${param.pcount }<br>
		옵션1 : ${paramValues.option[0] }<br>
		옵션1 : ${paramValues.option[1] }<br>
	</p>
</body>
</html>