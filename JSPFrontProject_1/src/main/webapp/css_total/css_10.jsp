<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
		width: 1200px;
		height: 600px;
		border: 1px solid black;
	}
	.header{
		width: 100%;
		height: 100px;
		background-color: cyan;
	}
	.aside1{
		width: 200px;
		height: 400px;
		background-color: yellow;
		float: left;
	}
	.section{
		width: 800px;
		height: 400px;
		background-color: gray;
		float: left; 
	}
	.aside2{
		width: 200px;
		height: 400px;
		background-color: orange;
		float: left;
	}
	.footer{
		width: 100%;
		height: 100px;
		background-color: pink;
		clear: both;		
	}
</style>
</head>
<body>
	<div class="container">
		<div class="header"></div>
		<div class="aside1"></div>
		<div class="section"></div>
		<div class="aside2"></div>
		<div class="footer"></div>
	</div>
</body>
</html>