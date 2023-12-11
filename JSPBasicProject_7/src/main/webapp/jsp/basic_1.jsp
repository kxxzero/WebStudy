<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	JSP : (MVC, Spring, Spring-Boot) => 화면 출력
		1. 지시자
			= page => contentType, errorPage, import, buffer
			= taglib => MVC(EL/JSTL)
		2. 자바 / HTML
			*** 사용법 <% %>, <%= %>
		3. 내장 객체 => 미리 생성 후 사용이 가능하도록 함
			= request : 사용자의 요청 정보
				=> HttpServletRequest
			= response : 응답 (브라우저로 전송 => HTML / Cookie)
				=> HttpServletResponse
			= pageContext : JSP 연결 => request를 유지
							include() / forward()
							=> <jsp:include> <jsp:forward>
				=> pageContext => RequestDispatcher
			= out : 메모리 HTML을 출력 => 출력 버퍼(관리)
				print() => <%= %> => ${}
					=> JspWriter => PrintWriter
			= application : 서버 정보(서버 관리)
				=> getRealPath() => 실제 톰캣이 읽어가는 위치
				=> Controller / ServletContext
			= config => web.xml, exception(try~catch)
				=> ServletConfig 
			= page => this
				 => Object
			*** session : 서버에 필요한 정보 저장
				=> 사용자 정보 저장(로그인) / 장바구니 => 임시 기억 장소
				=> 전역 변수(공유 변수) => 모든 JSP에서 사용 가능
				*** request => 매개 변수 => 모든 JSP마다 1개씩 가지고 있음
					=> 화면 변경 / 새로고침 => 자동으로 초기화
					=> session / cookie => 생성
						=============== 임시 저장
						getSession(), getCookie()
			==================================================
			동작
				1. JSP 소스 생성 => 실행
				2. JSP를 자바로 변경
					jsp파일명_jsp => .java
					a.jsp => a_jsp, main.jsp => main_jsp
				3. 컴파일 => .class
				   	=> JVM이 .class로드
				   	=> 한 줄씩 번여 시작
				   	=> out.write() => 메모리 출력
				   						|
				   					브라우저에서 읽어서 출력
				4. jsp
					1) _jspService() => 사용자 요청 시마다 호출되는 메소드
				   		{
				   			==========
				   			여기서 첨부되는 소스 코딩
				   			==========
				   		}
				   	2) JSP에서 모든 HTML 앞에는 out.write가 생략되어 있음	
				5. servelt / jsp
					servlet : 수정 시마다 컴파일
					jsp : 컴파일하지 않음
			
			주요 메소드
				request
					= String getParameter() : 단일값을 받는 경우
						<input type=text, radio, password, file...>
						<textarea><select>
						=> <form => submit> => 입력된 값만 전송
					= String[] getParameterValues() 다중값을 받는 경우(checkbox)
					*** 웹은 모든 데이터형이 String임
						=> 변환 : Wrapper
					= 사용자 요청 =========> 서버(웹서버 => 톰캣(WAS)) ==========> 개발자
							  한글(encoding)					  한글(decoding)
					
					자바 : 한글(2byte) => 서버(1byte)
							=> byte로 변환	=====> (2byte)
					예)  <a href="a.jsp?name=홍길동">전송</a>
										↓
						http://localhost:8080/JSPBasicProject_7/jsp/a.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99
																			   %ED%99%8D%EA%B8%B8%EB%8F%99 ==========> 홍길동 =>
					setAttribute, getAttribute : 추가된 내용 받기
					============	└ ${name} => request.getAttribute("name")
					데이터를 추가해서 다른 JSP로 전송
					========================= MVC
					getRequestURI, getRequestURL, getContextPath
					= getRemoteAddr()
				
				response
					out
						= clear()
						= print() / write()
					pageContext
						= include()
						= forward() 
					
					exception
						= getMessage()
						
					=> 데이터베이스
						JDBC : 연결 / 해제 => 시간이 많이 걸림
						DBCP : 연결을 미리 설정하고 반환 => 재사용
						
						ORM : 라이브러리 제작(MyBatis/JPA)
					=> 1차
					
								
 --%>				
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello JSP</h1>
	<a href="a.jsp?name=홍길동">전송</a>
</body>
</html>