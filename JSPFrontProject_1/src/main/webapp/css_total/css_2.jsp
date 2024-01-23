<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.box{
		width:200px;
		height:100px;
		margin-right: 10px;
		padding: 20px;
	}
	.box.a{
		float:left;
		background-color:cyan;
	}
	.box.b{
		float:left;
		background-color:yellow;
	}
	.box.c{
		float:left;
		background-color:pink;
	}
	.box.d{
		clear:both;
		width:700px;
		background-color:gray;
	}
</style>
</head>
<body>
	<div class="a box">float:left</div>
	<div class="b box">float:left</div>
	<div class="c box">float:left</div>
	<div class="d box">float:right</div>
</body>
</html>