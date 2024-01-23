<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
		width: 900px;
		height: 700px;
		border: 1px solid black;
		margin: 0 auto;	
	}
	.header{
		width: 900px;
		height: 100px;
		background-color: cyan;
		text-align: center;
	}
	.nav{
		width: 900px;
		height: 120px;
		background-color: orange;
	}
	.aside{
		width: 200px;
		height: 380px;
		background-color: yellow;
		float: left;
	}
	.section{
		width: 700px;
		height: 380px;
		background-color: lime;
		float: left;
	}
	.footer{
		width: 900px;
		height: 100px;
		background-color: pink;
		clear: both;
	}
	
	.search{
		width: 600px;
		margin: 0 auto;
	}
	#keyword{
		width: 300px;
		height: 40px;
		margin-top: 20px;
		text-align: center;
	}
	#btn{
		width: 50px;
		height: 40px;
	}
	ul{
		margin: 0 auto;
		list-style: none;
		background-color: blue;
	}
	ul li{
		padding : 15px; 
		float: left;
		font-weight: bold;
		color: white;
	}
	ul li:first-child{
		border-radius : 10px 0 0 10px;
	}
	ul li:last-child{
		border-radius : 0 10px 10px 0;
	}
	ul li:nth-child(odd){
		background-color: blue;
	}
	ul li:nth-child(even){
		background-color: navy;
	}
	ul li:hover{
		cursor: pointer;
		color: cyan;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="search">
				<input type="text" id="keyword">
				<input type="button" id="btn" value="검색">
			</div>
		</div><!-- <header> -->
		<div class="nav">
			<ul>
				<li>홈</li>
				<li>회원</li>
				<li>맛집</li>
				<li>레시피</li>
				<li>서울여행</li>
				<li>제주여행</li>
				<li>추천</li>
				<li>커뮤니티</li>
				<li>마이페이지</li>
			</ul>
		</div><!-- <nav> -->
		<div class="aside"></div><!-- <aside> -->
		<div class="section"></div><!-- <section> -->
		<div class="footer"></div><!-- <footer> -->
	</div>
</body>
</html>