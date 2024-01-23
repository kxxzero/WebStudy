<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	*** 제어문은 자바와 동일한 형식
	
	1) 조건문
		= 단일 조건문
			if
		= 다중 조건문
			if~else if
		= 
			
	2) 선택문
		= switch
			switch(정수)
			
	3) 반복문
		= ***for
			- 일반 for문
			- for in
			- for of => for~each for(String name:list)
			- *** map() =>
			- forEach() => 
		= while => 무한 스크롤
		= do~while
			
	4) 반복 제어문
		= break
		= continue
			
 --%>
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
		width: 350px;
	}
	h1{
		text-align: center;
	}
</style>

<script type="text/javascript">
	function login(){
		// 1. 입력한 ID 읽기()
		// 객체 모델 => 10장(태그를 객체로 인식, 속성 : 멤버 변수로 인식)
		let id=document.querySelector("#id"); // 태그를 가지고 옴
		// $('#id') => target.value => $ref
		if(id.value===""){ // 문자열도 비교연산자 처리 가능
			// 입력이 안 된 경우
			let div=document.querySelector(".id") // querySelector : 태그 선택
			div.innerHTML="<font color=red>아이디를 입력하세요</font>"
			id.focus();
			return;
		}
		else{
			
			// 입력이 된 경우
			let div=document.querySelector(".id") // querySelector : 태그 선택
			div.innerHTML=""
		}	
		
		/* 비밀번호 */
		let pwd=document.querySelector("#pwd");
		if(pwd.value===""){
			let div=document.querySelector(".pwd")
			div.innerHTML="<font color=red>비밀번호를 입력하세요</font>"
			pwd.focus();
			return;
		}
		else{
			let div=document.querySelector(".pwd")
			div.innerHTML=""
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h1>Login</h1>
		<div class="row">
			<table class="table">
				<tr>
					<th width="30%" class="text-center">ID</th>
					<td width="70%">
						<input type="text" id="id" size="15" class="input-sm">
						<div class="id"></div>
					</td>
				</tr>
				
				<tr>
					<th width="30%" class="text-center">비밀번호</th>
					<td width="70%">
						<input type="password" id="pwd" size="15" class="input-sm">
						<div class="pwd"></div>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" class="text-center">
						<input type="button" value="로그인" class="btn-sm btn-primary" onclick="login()">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>