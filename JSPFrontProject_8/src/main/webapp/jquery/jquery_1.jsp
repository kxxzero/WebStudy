<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	JQuery : 자바스크립트 라이브러리로 HTML을 제어하는 프로그램 => DOMScript
		1. 라이브러리 연결
			= 원격으로 연결
				<script type="text/javascript" src="http://code.jquery.com/jqeury.js">
				*** jquery가 충돌이 되면 안 됨 => main.jsp
				
		2. jquery의 시작
			= window.onload=function(){}
			= $(document).ready(function(){})
			  =================> 생략
			  $(function(){}) => 1번만 사용
			  
		3. $() 표준화
			= selector(CSS)
			= document.querySelector(CSS)
				1) 태그
				2) 아이디
				3) 클래스
				document.querySelector("tr") => $("tr")
				document.querySelector("#aaa") => $("#aaa")
				document.querySelector(".bbb") => $(".bbb") // 싱글따옴표('')도 사용 가능 => '.bbb'
				
		4. $(태그 읽기) => CSS 선택자와 동일
		   $(내장 객체) => $(window), $(document) ...
		   => Vue : mounted()
		   => React : componentDidMount() => useEffect() => React-Query
		   			 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- import 영역 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){ // window.onload=function(){}
		/* let a=document.querySelector("#a"); // <h1 id="a">Hello Jquery</h1>
		a.style.color="red"
		a.style.backgroundColor="yellow" */
		
		// ↓ Jquery로 변환
		/* $("#a").css("color","red").css("backgroundColor", "yellow") */
		
		// ↓ 한 번에 모아서 처리
		$('#a').css({"color":"red","backgroundColor":"green"}) 
		/* $('.c').css({"color":"yellow","backgroundColor":"blue"}) */
		
		/* let c=document.querySelector('.c') // 이렇게 처리 할 경우 하나의 객체만 변경
		c.style.color="blue" */
		// ↓ 위 입력 방식으로 여러 개의 객체를 변경하는 방법
		let cs=document.querySelectorAll(".c")
		// []
		for(let c of cs){
			c.style.color="blue"
		}
		
		// 속성 선택자 => 태그명[속성=값](equals) / 태그명[속성*=값](contains) / 태그명[속성^=값](startsWith) / 태그명[속성$=값](endsWith)
		$('h1[value=d]').css('color','pink')
		// h1.addEventListener('click', function(){})
		/*
			$('h1').click(function(){})
			$('h1').on('click', function(){})
		*/
		$('h1').click(function(){
			alert("Hello Jquery")
			
		})
	})
</script>
</head>
<body>
	<h1 id="a">Hello Jquery</h1>
	<h1 class="c">Hello Jquery</h1>
	<h1 id="b">Hello Jquery</h1>
	<h1 class="c">Hello Jquery</h1>
	<h1 value="d">Hello Jquery</h1>
</body>
</html>