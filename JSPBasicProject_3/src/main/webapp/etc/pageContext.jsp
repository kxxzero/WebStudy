<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	1. 내장 객체 얻기
		getRequest(), getResponse(), getOut()
		getSession(), getPage(), getException()
		application => getServletContext()
		=> 사용 빈도가 거의 없음(99.999999999)
		
		request.getParameter()
		pageContext.getRequest().getParameter()
	2. 웹 흐름 제어
		include(), forward() => 파일마다 request를 공유함
		pageContext.include() => 사용 빈도 거의 없음
		=> <jsp:include>
		=> 
			1) <%@ include file="" %> : 정적
				=> file에는 반드시 file명을 설정함
			2) <jsp:include page=""> : 동적
				=> 내용 출력 시에 변경
					page=변수명
			=> JSP 안에 특정 위치에 다른 JSP를 포함
				a.jsp
				<html>
					<body>
						<%
							int a=10;
						%>
						<h1><%= a%></h1>
					</body>
				</html>
				=========================
				<html>
					<body>
						<h1>10</h1>
					</body>
				</html>
				
				b.jsp
				<html>
					<body>
						<%
							int a=100;
						%>
						<h1><%=a%></h1>
						==============================
						<%@ include file="a.jsp" %>
						
						<html>
							<body>
								<%
									int a=10;
								%>
								<h1><%= a%></h1>
							</body>
						</html>
						==============================
						<jsp:include
					</body>
				</html>
				=========================
				<html>
					<body>
						<h1>100</h1>
					</body>
				</html>
			3) 
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