<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body > div{
		width: 400px;
		height: 100px;
		border: 3px solid black;
		position: relative;
		overflow-y: scroll;
	}
	.d{
		width: 100px;
		height: 100px;
		position: absolute;
	}
	.a{
		background-color: yellow;
		top: 10px;
		left: 10px;
		z-index: 100;
	}
	.b{
		background-color: cyan;
		top: 50px;
		left: 50px;
		z-index: 10;
	}
	.c{
		background-color: pink;
		top: 90px;
		left: 90px;
		z-index: 5;
	}
</style>
</head>
<body>
	<div>
		<div class="a d"></div>
		<div class="b d"></div>
		<div class="c d"></div>
	</div>
</body>
</html>