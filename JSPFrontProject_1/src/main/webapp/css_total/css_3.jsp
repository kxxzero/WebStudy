<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.wrap{
	width: 900px;
	height: 900px;
	border: 1px solid green;
	position: relative;
}
img{
	position: absoulute;
	width: 200px;
	height: 300px;
}
.a{
	top: 0px;
	left: 0px;
}
.b{
	top: 0px;
	right: 0px;
}
.c{
	bottom: 0px;
	left: 0px;
}
.d{
	bottom: 0px;
	right: 0px;
}
.e{
	top: 350px;
	left: 350px;
}
</style>
</head>
<body>
	<h1>Absolute 배치</h1>
	<div class="wrap">
		<img class="a" src="../image/m1.jpg">
		<img class="b" src="../image/m2.jpg">
		<img class="c" src="../image/m3.jpg">
		<img class="d" src="../image/m4.jpg">
		<img class="e" src="../image/m5.jpg">
	</div>
</body>
</html>