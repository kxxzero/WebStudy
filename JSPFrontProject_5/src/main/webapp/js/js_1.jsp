<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	
 	if(조건문)
 	{
 		true일 때 처리
 	}
 	else
 	{
 		false일 때 처리
 	}
 	=========================
 2) 반복문
 	= 일반 for문
 		for(let i=0; i<=10; i++)
 		{
 			반복 처리
 		}
 	=========================
 	= for in : 배열의 인덱스
 		for(변수 in 배열)
 	= for of : 배열의 데이터를 1개씩 읽기
 		for(변수 of 배열)
 	= map : 베열의 데이터를 1개씩 읽기
 		배열.map(function(데이터){
 		})
 		배열.map((데이터)=>{
 		})
 	= forEach : 배열의 데이터를 1개씩 읽기
 		배열.forEach(function(데이터){
 		})
 		배열.forEach((데이터)=>{
 		})
 	========================= 배열
 3) 반복 제어문
 	= break : 반복을 중단
 
 	=========================
 *** 함수 : 리턴형이 없음 => 데이터형이 동일하기 때문
 	형식) function func_name(매개변수...)
 	{
 		처리
 		return // 리턴이 있는 경우
 	}
 	let func_name=function(){}
 	let func_name()=>{}
 	=========================
 	 
 1. HTML 태그 => 제어하는 역할 => CSS의 선택자
 	========== 객체 모델(태그 : 클래스, 속성 : 멤버변수)
 	1) 속성값 변경
 	2) 스타일 변경
 	3) 이벤트 등록
 2. 이벤트 : 사용자가 행위를 했을 때 처리를 해주는 역할
 	=> mouse, keyboard...
 3. 브라우저 내장 객체
 	1) window
 	2) location
 	3) history
 	4) document
 4. 내장 객체
 	1) String
 	2) Date
 	3) Number
 	4) Math
 5. 라이브러리
 
 =========================
 
 341page
 문서 객체 선택
 	태그를 객체로 변환해서 사용
 	태그 선택하는 방법
 	===============
 	$(Jquery)
 	e.target(react)
 	$ref(vue)
 	
 	<자바스크립트>
 		= document.getElementById(ID명)
 		= document.qeurySelector("CSS선택자")
 		=================================== $("CSS선택자")
 		=> 태그 1개 설정
 		= document.getElementClassName("클래스명")
 		= document.querySelectorAll(CSS선택자)
 		= document.getElementByTagName(태그명)
 		= document.getElementByName(name)
 		===================================
 		createElement("태그명") : 태그 생성
 		createTextNode() : 태그와 태그 사이에 값 설정
 		*** appendChild() : 태그 안에 다른 태그를 첨부
 			=> $("CSS선택자").append()
 				v-html
 		setAttribute() : 속성 추가
 			=>$("CSS선택자").attr(속성명, 값)
 				v-model
 		getAttribute() : 속성값 읽기
 			=>$("CSS선택자").attr(속성명)

		===================================
		*** 태그와 태그 사이에 데이터 추가
			- innerHTML : html 추가
			- textContent : 문자 추가 => '<h1>aaa</h1>'
			
		========================================
	1. 태그 선택
		getElementById()
		
		
			
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		let div=document.getElementById("box"); // 태그 자체를 가지고 옴
		/* div.textContent="<font color=red>취소</font>" */
		div.innerHTML="<font color=red>취소</font>"
		// => $("#box").text()
	}
</script>
</head>
<body>
	<div id="box">수정</div>
</body>
</html>