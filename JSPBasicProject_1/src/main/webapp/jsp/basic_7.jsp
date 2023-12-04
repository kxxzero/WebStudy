<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="8kb"%>
    
    <%-- 139page
   		= 지시자
   			page : JSP 파일에 대한 정보
   				=> JSP 시작점
   				1. ContentType = 실행 시 변경될 파일 형식
   					=> 자바로 변경 시 : response.setContentType()
   					=> html => text/html; charset=UTF-8
   										==========
   										charset=ISO-8859-1 => default
   						xml	=> text/xml;charset=UTF-8
   						json => text/plain;charset=UTF-8
   						=> 브라우저에 알려줌
   						=> page 안에서 1번만 사용 가능
   				2. import => 외부 라이브러리 첨부
   							java.lang, javax.http.servlet
   							============================== 생략 가능
   					=> 사용 형식 => 2
   						<%@ page import="java.util.*, java.io.*"%>
   						<%@ page import="java.util.*"%>
   						<%@ page import="java.io.*"%>
   				3. buffer => html을 저장하는 메모리 공간
   							=> 8kb
   							=> html이 출력을 할 때 용량이 부족한 경우 증가시킴
   								buffer="16kb" => 출력스트림
   				4. errorPage
   				
   			taglib : 태그로 자바 기본 문법 제공 => jstl/el
   			include : JSP 안에 다른 JSP를 첨부해서 사용
   				<%@ 지시자명 속성="값" 속성="값" %>
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