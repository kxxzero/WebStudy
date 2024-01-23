<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 
	ES5 => ES6
	변수 => 자동 지정 변수
	var		let => 사용 범위(지역 변수 => 메모리 해제)
	
	=> 변수 선언 => let / const
		let : 지역 변수
		const : 상수
		=> 자동 지정 변수 => jquery / vue / react
			
		
		========================================
		let i=10 => i:int
		let i-10.5 => i:double
		----------------------------------------> i:Number(숫자형)
		
		let i='A' => i:char
		let i="A" => i:string
		----------------------------------------> i:String(문자형)
		
		let i=true => i:boolean
		----------------------------------------> i:Boolean(논리형)
		
		let i={name:"홍길동", sex:"남자"}
		----------------------------------------> i:object(객체형)
													=> JSON(***)
													=> ~VO
		let i=[1,2,3,4,5] => i:array
		----------------------------------------> i:Array
		
		========================================
		형변환
			- 숫자 변환
				· pardeInt("10") = 10
			
			- 문자 변환
				· String(10) = "10" // 자바 => (int)10.5 = 10
				· Math.round(10.5)
				=> String, Date, Math...
			- 논리형
				· Boolean(1) => true
				· Boolean(0) => false
					=> 0, 0.0이 아닌 모든 수는 true
		========================================
		연산자
			+ : 산술, 문자열 결합
				"10"+"20" => "1020"
				"10"-"20" => -10
				----------> parseInt("10")-parseInt("20")
				
			/ : 정수 ÷ 정수 = 실수
			
			==, ===  
			!=, !==
			----------> 혼용해서 사용 가능하지만 '===', '!=='을 권장
			
		*** 연산 처리 시 변수 선언
			- undefined : 변수의 초기화(X), 변수 선언이 안 된 상태
			- NaN : 연산 처리가 안 된 상태
				'A'-1 = NaN
				-----
				금액 : 1000
				<select>
					<option>1개</option>
					<option>2개</option>
					<option>3개</option>
				</select>
				=> 1000*2개 => NaN
			- Infinity : 0으로 나눈 경우
				10/0
				
				let i ${}
				let name=''				
				
		========================================
			
		오라클 ===== 데이터 읽기(자바) ===== HTML/JavaScript
		====							==========> EL/JSTL 적용 가능
		데이터 공유
*/

	window.onload=function(){
		console.log("a="+a)	// a=undefined
		if(true)
		{
			var a=10;
			console.log("if 안 => a="+a);
		}
		console.log("if 밖 => a="+a); // var 사용 시 지역 변수를 블록 밖에서도 사용할 수 있음 => 메모리 누수 현상 => let 사용으로 문제 개선
	}
</script>

</head>
<body>

</body>
</html>