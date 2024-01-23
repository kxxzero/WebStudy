<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){ // 시작하는 부분
		$('div > h1+span').css("color","red") // 인접 관계 => h1+span : h1과 인접한(바로 다음에 위치하는) span태그를 선택
	}) 	
</script>
</head>
<body>
	<div>
		<h1>Hello Jquery!</h1>
		<span>Hello Selector1</span>
		<span>Hello Selector2</span>
	</div>
</body>
</html>