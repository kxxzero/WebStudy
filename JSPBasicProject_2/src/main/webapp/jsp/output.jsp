<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	// 1. 한글 => 디코딩 실행 => 모든 JSP마다 내장 객체를 가지고 있음
    	// 2. 화면 변경 => request가 초기화 => session/ajax
    	try
    	{
    		request.setCharacterEncoding("UTF-8"); // 내장 객체
    	}catch(Exception ex){}
   		// <input type=text sie=15 name="name">
   		String name=request.getParameter("name");
   		String sex=request.getParameter("sex");
   		// radio는 name이 동일해야 그룹이 생성 => 1개만 선택
   		String tel1=request.getParameter("tel1");
   		String tel2=request.getParameter("tel2");
   		String tel=tel1+")"+tel2;
   		String content=request.getParameter("content");
   		String[] hobby=request.getParameterValues("hobby");			
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%--
	HTML 주석은 남아 있음
	HTML + Java를 동시에 주석을 설정
	
	=> <%= %>
	   <%  %> : MVC에서는 사용하지 않음
	   			
	   			=> 태그형으로 제작 : JSTL
	   			<%= %> => ${}
	   			
	=> 내장 객체 => Spring / Spring-Boot
		*** request : JSP마다 request를 가지고 있음
					단점) 화면 변경/새로고침 시 request는 초기화
					=> HttpServletRequest의 객체명
					=> jsp페이지로 데이터 전송 시 데이터 전체를 묶어서 전송
											=============== request
					=> request는 Map 형식으로 되어 있음
						(키, 값) => 키는 중복 불가
						<input type=text name="aaa"> // name값이 키 역할
						<input type=text name="aaa">
						<input type=text name="aaa">
						=> ?name=aaa => getParameter("name")
							==== ===
							 키    값		=> ?page=1
							 				? page= 1
							 				
						=> a.jsp
							=> null
							if(a==null)
						=> a.jsp?name=
							=> " "
							if(a.equals(""))
							=> form 태그를 이용해서 전송 : post => action
							=> <a> => get=>()?name	
		*** response : 
		*** session
		application : 업로드
		pageContext => RequestDispatcher => include, forward
			<jsp:include>
		out
		===== 다운로드
 --%>

<body>
	1. *** 사용자의 IP : <%= request.getRemoteAddr() %><br>
	2. 서버 정보 : <%= request.getServerName() %><br>
	3. 서버 프로토콜 : <%= request.getProtocol() %><br>
	4. 전송 방식 : <%= request.getMethod() %><br>
	5. 포트 번호 : <%= request.getServerPort() %><br>
	6. *** 요청 URL : <%= request.getRequestURL() %><br>
	5. *** 요청 URI : <%= request.getRequestURI() %><br>
	8. *** ContextPath : <%= request.getContextPath() %> : 루트 폴더<br>
	9. 전송 값<br>
		이름 : <%=name %> <br>
		성별 : <%=sex %> <br>
		전화 : <%=tel %> <br>
		소개 : <%=content %> <br>
		취미 : <%
		try
		{
			out.write("<ul>");
			for(String h:hobby)
			{
				out.write("<li>"+h+"</li>");	
			}
			out.write("</ul>");
		}catch(Exception ex){
			out.write("취미가 없습니다.");
			// <%=
		}
		%>
		
	 
</body>
</html>