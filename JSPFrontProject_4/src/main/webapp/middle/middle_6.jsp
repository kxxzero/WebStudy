<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	316page => 함수
		1) 함수 : 코드의 집합
			  기능 청리(사용자가 요청 => 행위, 브라우저에서만 작동)
			  ======
			  버튼 클릭 / 마우스 오버 / 변경 / 키보드
			  => 호출 시 이벤트
			  	onclick / onmouseover(hover) / onmouseout / onchange / onkeydown / onkeyup
			  	
		2) 함수 생성 방법
			= 익명의 함수 : function(){} => callback(시스템에 의해 자동 호출)
						 map(function(){})
			= 선언적 함수 : 
				- function 함수명(){} => 함수명()
				- let func=function(){} => 이벤트 등록
				- let func=()=>{} => 이벤트 등록
				
		3) 함수 유형 : 리턴형을 기술하지 않음 => 리턴은 가능
					리턴형 메소드명(매개변수, 매개변수...)
					function func_name(매개변수...)
					{
						return "a" // let으로 모든 데이터형을 받기 때문에 데이터형을 굳이 써주지 않아도 됨
					}
					
					let a=func_name()
					
					function 함수명(매개변수...)
					==============================
						리턴형	매개변수	=> 리턴형은 let, const로 통일하기 때문에 기술하지 않음
						 O		  O
						 ==========
						 예) function func_name(id, pwd)
						 	{
						 		return 값;
							}
						 O		  X
						 ==========
						 예) function func_name()
						 	{
						 		return 값
						 	}
						 X		  O
						 ==========
						 예) function func_name(name)
						 	{
						 		return; // 세미콜론 생략 가능 => void
						 	}
						 X		  X => window.onload
						 ==========
						 예) function func_name()
						 	{
						 			
						 	}
						 구성요소
						 function func_name() // 선언부
						 {
						 	구현부
						 }
						 => ES6 권장사항
						 	let func_name=function(){}
						 	let func_name=()=>{}
						 	
						 	=> let func_name=function(매개변수){}
						 	=> let func_name=(매개변수)=>{} // 화살표 함수는 function, return을 생략할 경우에 주로 사용
		4) 호출 방법
			function func_name(){} => func_name()
			let func_name2=function(){} => func_name2()
			let func_name3=()=>{} => func_name3()
			
			function func_name(name){} => func_name('홍길동')
			let func_name2=function(name){} => func_name2('심청이')
			let func_name3=(name)=>{} => func_name3('박문수')
		
						 	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){ // function() : 익명의 함수
		document.write("<h3>리턴형, 매개변수 설정</h3>")
		let name=hello('홍길동') // hello 함수에 '홍길동'이라는 매개변수를 대입
		document.write(name+"<br>")
		document.write("<hr>")
		
		document.write("<h3>리턴형만 존재하는 함수</h3>")
		let msg=hello2()
		document.write(msg+"<br>")
		document.write("<hr>")
		
		hello3('홍길동')
		hello4()
	}
	// 매개변수, 리턴형 모두 존재
	function hello(name) // function hello() / let hello=function(name) / let hello=()=>
	{
		return name+"님 환영합니다.";
	}
	
	// 매개변수 없음, 리턴형 존재
	function hello2() // function hello2()
	{
		return "Hello JavaScript Function"
	}
	
	// 매개변수 존재, 리턴형 없음 => 해당 함수 안에서 처리
	function hello3(name) // let hello3=function(name)
	{
		// void => 직접 처리
		document.write("<h3>매개변수만 존재하는 함수</h3>")
		document.write(name+"<br>")
		document.write("<hr>")
	}
	
	// 매개변수, 리턴형 모두 없음 => 해당 함수 안에서 처리
	function hello4() // let hello4=function()
	{
		document.write("<h3>매개변수, 리턴형이 없는 함수</h3>")
		document.write(name+"<br>")
		document.write("<hr>")
	}
</script>
</head>
<body>

</body>
</html>