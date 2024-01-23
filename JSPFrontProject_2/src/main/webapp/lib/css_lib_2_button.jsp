<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.container{
		margin-top: 50px;
	}
	.row{
		margin: 0 auto;
		width: 800px;
	}
	
	/* 
		button => 모든 태그에 적용 가능
			   => <a>,  <span> : class="btn" 필요
			   => <button>, <input type="button"> : class="btn" 생략 가능
		1. class
			형식 : btn
			크기 : btn-sm / btn-lg / btn-xs
			색상 : btn-success : green
				  btn-danger : red
				  btn-primary : blue
				  btn-warning : orange
				  btn-default : gray
				  btn-info : cyan
			적용 : class="btn btn-sm btn-succeess" 
	 */
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<input type="button" value="danger" class="btn btn-lg btn-danger">
			<input type="button" value="success" class="btn btn-lg btn-success">
			<input type="button" value="warning" class="btn btn-lg btn-warning">
			<input type="button" value="primary" class="btn btn-lg btn-primary">
			<input type="button" value="default" class="btn btn-lg btn-default">
			<input type="button" value="info" class="btn btn-lg btn-info">
		</div>
		
		<div style="height: 10px"></div>
		
		<div class="row">
			<input type="button" value="danger" class="btn btn-sm btn-danger">
			<input type="button" value="success" class="btn btn-sm btn-success">
			<input type="button" value="warning" class="btn btn-sm btn-warning">
			<input type="button" value="primary" class="btn btn-sm btn-primary">
			<input type="button" value="default" class="btn btn-sm btn-default">
			<input type="button" value="info" class="btn btn-sm btn-info">
		</div>
		
		<div style="height: 10px"></div>
		
		<div class="row">
			<input type="button" value="danger" class="btn btn-xs btn-danger">
			<input type="button" value="success" class="btn btn-xs btn-success">
			<input type="button" value="warning" class="btn btn-xs btn-warning">
			<input type="button" value="primary" class="btn btn-xs btn-primary">
			<input type="button" value="default" class="btn btn-xs btn-default">
			<input type="button" value="info" class="btn btn-xs btn-info">
		</div>
		
		<div style="height: 10px"></div>
		<div class="row">
			<a href="#" class="btn btn-sm btn-danger">이전</a>
			<a href="#" class="btn btn-sm btn-primary">다음</a>
			<span class="btn btn-sm btn-danger">수정</span>
			<span class="btn btn-sm btn-primary">삭제</span>
		</div>
	</div>
</body>
</html>