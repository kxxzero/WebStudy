<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	쿠키 => 상태의 지속
		  ===== state : 데이터 관리 => react/vue => 변수
		  							  |
		  							  props/state
		  ===== 저장 공간 : 브라우저(로컬)
		  		====== 메소드 제공
		  				======
		  				1. 저장
		  					new Cookie*(키, 값)
		  					==================
		  					단점 : 문자열만 저장 가능
		  						: 키는 중복 불가
		  				*** Cookie는 반드시 해당 사용자 브라우저로 전송
		  					=> response는 1개 일만 수행 가능
		  					=> Cookie / HTML => 1개만 선택
		  						=> JSP 파일에서
		  						=> JSP는 2개가 필요
		  						=> detail.jsp : HTML
		  						=> before.jsp : 쿠키
		  				2. 읽기
		  					request.getCookies() => Cookie[]
		  					
		  				3. 삭제
		  					setMaxAge(0)
		  				4. 저장 기간
		  					setMaxAge(초단위)
		  				5. 키 읽기
		  					getName()
		  					값 읽기
		  					get
		  				6. 
	
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