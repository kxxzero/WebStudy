<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	자바스크립트의 핵심
	===============
	=> 객체 모델 : 태그를 읽어 오는 방법
				document.querySelector(CSS선택자)
				document.getElementById()
	=> 내장 객체 : String, Math, Date => 함수
	=> 브라우저 내장 객체 : window, document, history, location
	=======================================================
		라이브러리 변경 => Jquery => 동적(Ajax)
		
		단일값 저장 : 변수
			let 변수명=값(값에 따라 자동으로 데이터형이 결정)
		다중값 저장
			배열 [] => 자바와 다른 점: 데이터형 혼합이 가능(let 하나로 사용 가능) => ["", 10, "", 10.5, {}]
			객체 {} => {키:값, 키:값...}
					  ====	==== > 자바에서는 멤버 변수 => JSON(JavaScript Object Notation) : Javascript 객체 문법으로 구조화된 데이터를 표현하기 위한 문자 기반의 표준 포맷
					  
			 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let arr=["홍길동", 20, 'A', "영업", 3500] // 자바에서는 Object[](모든 데이터형을 다 받을 수 있음)
	console.log(arr)
	console.log("arr="+typeof arr)
	for(let data of arr){
		document.write(data+"<br>")
	}
	document.write("<hr>")
	document.write("<h3>객체 표현법:1(JSON)</h3>")
	// {변수:값, 변수:값, 변수:값...}
	let sawon={sabun:1, name:"홍길동", dept:"개발부", pay:3500}

	document.write("사번:"+sawon.sabun+"<br>")
	document.write("이름:"+sawon.name+"<br>")
	document.write("부서:"+sawon.dept+"<br>")
	document.write("연봉:"+sawon.pay+"<br>")
	document.write("<hr>")
	
	document.write("<h3>객체 표현법:2(JSON)</h3>")
	document.write("사번:"+sawon['sabun']+"<br>")
	document.write("이름:"+sawon['name']+"<br>")
	document.write("부서:"+sawon['dept']+"<br>")
	document.write("연봉:"+sawon['pay']+"<br>")
	document.write("<hr>")
	
	/* document.write("<h3>객체 표현법:3(JSON)</h3>")
	document.write("사번:"+sawon[0]+"<br>")
	document.write("이름:"+sawon[1]+"<br>")
	document.write("부서:"+sawon[2]+"<br>")
	document.write("연봉:"+sawon[3]+"<br>")
	document.write("<hr>") */
	
	document.write("<h3>객체 표현법:2(JSON)</h3>")
	for(let key in sawon){
		document.write(key+":"+sawon)	
	}
	
	
	
	// function 첨부가 가능 => function 자체를 변수로 취급
	/*
		function func_name()
		{
			
		}
		let func_name=function(){}
		let func_name=()=>{}
		
		function aaa(){}
		function bbb(callback) // callback: 자체 내에서 다시 호출하는 함수
		{
			
		}
		bbb(aaa) => $.ajax()
		
	*/
	
}
</script>
</head>
<body>

</body>
</html>