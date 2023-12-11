<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	EL(Expression Language) : 표현식
		=> 데이터를 화면에 출력(대체 <%= %>)
		=> ${출력할 데이터}
	목적 : JSP 페이지에서 자바 코드를 최소화하는 정책
		=> 웹 디자이너가 어렵게 느끼기 때문에 사용 => 579page
	
		1. EL
			연산자 / 내장 객체 => Spring, Spring-Boot, 실무
				1) 산술연산자 : +, -, *, /, % 
					=> '+'는 산술만 가능
						${"5"+7} => 12
						${null+7} => 7 => null을 0으로 인식
						${"A"+7} => 오류 발생
							=> 문자열 결합 연산자 '+=' 사용 => ${"A"+=7} => A7
							
					=> '/'= div => ${7/2} = ${7 div 2}
						'/' 시 0으로 나눌 수 없음
						정수/정수=실수 => ${5/2} => 2.5
					
					=> '%' = mod => ${7%2} = ${7 mod 2}
					*** 역슬래시(\)를 앞에 붙일 경우 문자열 그대로 출력
					
				2) 비교연산자 : ==, !=, <, >, <=, >=
					=> '==' = eq => ${7==7} = ${7 eq 7}
					=> '!=' = ne => ${7!=9} = ${7 ne 9}
					=> '<' = lt
					=> '>' = gt
					=> '<=' = le
					=> '>=' = ge
					*** 문자열도 비교연산자를 사용
					
				3) 논리연산자 : &&, ||, ! => boolean
					=> 조건 && 조건 = 조건 and 조건 => 조건 2개가 true일 경우에만 true
					=> 조건 || 조건 = 조건 or 조건 => 조건 1개 이상이 true일 경우 true
					=> !조건 = not조건 => 부정
					
				4) 삼항연산자 : 조건?값(조건이 true일 때):값(조건이 false일 때)
				5) 기타연산자
					=> 배열 [], 우선 순위(), 객체 접근 .
					=> empty : 값이 null이거나 없는 경우 확인
		
			
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>