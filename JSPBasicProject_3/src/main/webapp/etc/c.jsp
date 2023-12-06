<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="d.jsp?id=admin&pwd=1234&mode=1">Redirect</a>
	<!-- 새창 띄우기 => request 유지하지 않음 -->
	<br>
	<a href="d.jsp?id=admin&pwd=1234&mode=2">Forward</a> 
	<!-- 덮어쓰기 => 주소가 바뀌지 않음 request 유지 -->
</body>
</html>