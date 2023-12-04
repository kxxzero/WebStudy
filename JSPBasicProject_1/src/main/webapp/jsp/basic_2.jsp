<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--
    	=> 스프링 화면 출력(jsp) => ThymeLeaf(html)
    	
    	113page
    	
    		1. 자바 / HTML의 분리
    		= 자바를 코딩하는 방법(스크립트릿)
    			1) <% %> : 스트립트릿
    				일반 메소드 안에 코딩 => 변수(지역 변수), 메소드 호출, 제어문, 연산자
    					=> _jspService() 안에 첨부
    					=> 자바와 동일
    					=> ;
    					=> <%
    							여기서 주석
    							/*
    							
    							*/
    							//
    						%>
    			2) <%! %> : 선언문 => 메소드 제작, 멤버 변수
    				=> 클래스 영역에 설정
    			3) out.write() => 자바 데이터 출력
    			   ==========
    			   	<%= %> : out.write(=====); // 이미 세미콜론(;)이 포함되어 있음
    			
    	코딩 방식
    		1. JSP => 데이터 읽기 => 데이터베이스 연동
    		2. HTML 제작
    		3. 필요한 위치에 for/if를 이용해서 화면 출력
    		4. CSS를 적용
    		5. 동적으로 변경 : JavaScript    		
    			
    --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>&lt;% 스크립트릿 %&gt;</h1>
	<h3>구구단</h3>
	<table border=1 width=700px>
		<tr>
			<%
				for(int i=2; i<=9; i++)
				{
					%>
					
					<th><%= i+"단" %>></th>
					
					<%
				}
			%>
		</tr>
			<%
				for(int i=2; i<=9; i++)
				{
			%>
			<%
					for(int j=2; j<=9; j++)
					{
			%>			
			<%
					}
				}
			%>
	</table>
</body>
</html>

