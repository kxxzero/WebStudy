<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div.container{
		width: 800px;
		height: 700px;
		border: 2px solid red;		
	}
	div.header{
		width: 796px;
		height: 146px;
		border: 2px solid green;
	}
	div.aside{
		width: 196px;
		height: 396px;
		border: 2px solid blue;
		float: left;
	}
	div.section{
		width: 596px;
		height: 396px;
		border: 2px solid magenta;
		float: right;
	}
	div.footer{
		width: 796px;
		height: 146px;
		border: 2px solid black;
		clear: both;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<%@ include file="header.jsp" %>
		</div>
		
		<div class="aside">
			<%@ include file="aside.jsp" %>
		</div>
		
		
		<div class="section">
			<%@ include file="section.jsp" %>
		</div>
		
		
		<div class="footer">
			<%@ include file="footer.jsp" %>
		</div>
	</div>
</body>
</html>