<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--
    	165page
    	내장 객체 => _jspService() => 선언되어 있는 객체를 9개 제공
    		1. request
    			= HttpServletRequest
    			=> 톰캣에 의해 정보를 묶어서 전송(개발자)
    				==========
    				1) 서버 정보
    					= 서버의 이름 : get
    				
    					----------------------------------------
    						서버 정보				사용자 요청 정보
    					---------------------------------------- URL
    										-------------------- URL
    										--------------- ContextPath
    					
    				2) 브라우저 정보
    					=> getRemoteAddr() : 클라이언트의 IP
    					=> getPort() : 클라이언트의 Port
    				3) 요청 정보
    					=> 단일값 : getParameter()
    					=> 다중값(체크박스) : String[] getParameterValues()
    					=> 디코딩 : 한글 변환 => setCharacterEncoding()
    				4) 추가 정보(실제 1차 프로젝트) => MVC(Spring)
    					=> setAttribute()
    					=> getAttribute()
    		2. response
    		3. session
    		4. out
    		5. application
    		6. pageContext
    		7. page
    		8. exception
    		9. config
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