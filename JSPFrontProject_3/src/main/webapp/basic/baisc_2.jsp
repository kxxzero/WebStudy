<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	연산자
	1) 단항 연산자
		= 증감 연산자(++, --)
		= 부정 연산자(!)
	2) 형변환 연산자
		= 숫자 변환 : Number(문자), parseInt(문자열)
			(int) 10.5 => 존재하지 않는 입력법
		= 문자열 변환 : String(10) => "10"
		= Boolean : Boolean(숫자)
				=> Boolean(1) = true, Boolean(0) = false
	3) 이항 연산자
		= 산술 연산자 : +, -, /, *, % => '+' 문자열 결합으로도 사용
		= 비교 연산자 : ===, !==, <, >, <=, >=	=> 결과값 : boolean
					(==, != 혼용) => 경고
					*** 문자열도 비교가 가능
		= 논리 연산자 : &&, ||
		= 대입 연산자 : =, +=, -=
	4) 삼항 연산자
		= (조건)?true일 때 값:false일 때 값
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	// 단항 연산자(++, --, !)
	let a=10;
	let b=a++; // 후치 연산자 => 대입 => 증가
	// b=a => a=a+1
	document.write("a="+a+"<br>") // a=11
	document.write("b="+b+"<br>") // b=10
	
	a=10;
	b=++a;
	// a=a+1 => b=a
	document.write("a="+a+"<br>") // a=11
	document.write("b="+b+"<br>") // b=11
	
	let c=false;
	c=!c;
	document.write("c="+c+"<br>")
	
	let c=false;
	c=!c;
	document.write("d="+d+"<br>") // false
	// 0이 아닌 모든 수는 true
	// 0이거나 0.0인 경우에는 false
	
	// 형변환
	let e="10";
	document.write("e="+typeof e+"<br>")
	document.write("e="+typeof Number(e)+"<br>")
	document.write("e="+typeof parseInt(e)+"<br>")
	document.write("e="+typeof Boolean(e)+","+Boolean(e)+"<br>")
	
	/*
		자바와 다른점
		- 숫자 => 문자열, Boolean으로 변경 가능
					===============
		- 변수에는 데이터형을 사용하지 않음(let, const) => typeof
		- 모든 숫자
	*/
}
</script>
</head>
<body>

</body>
</html>