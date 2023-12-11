<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
    
<%--
	581page
	기본 객체(내장 객체)
	=> ***requestScope / ***sessionScope / applicationScope
	=> param / pageContext
	
	EL은 자바 변수를 출력하는 것이 아님
		=> request, session에 저장된 데이터 출력
		
 --%>
 
 <jsp:useBean id="model" class="com.sist.dao.StudentModel"/>
 
 <% 
 	StudentVO vo=model.studentDetailData();
	request.setAttribute("vo", vo);
 	
 	String name="홍길동";
 	request.setAttribute("name", "심청이");
 	session.setAttribute("name1", "박문수");
 	
 	// param => getParameter("name")
 	// param.key => param.name
 	// applicationScope => realpath
 	/*
 		${} => 출력물(request, session에 담겨 출력을 요청 시에만 사용)
 	*/
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
학번 : ${vo.hakbun }
<!-- 약식으로 작성 시 get을 생략할 수 있음 => 변수처럼 호출하지만 get메소드를 호출하는 것임 => 따라서 VO에 get메소드가 존재하지 않을 경우 오류 발생 -->
<br>
이름 : ${vo.getName() }
<br>
국어 : ${vo.getKor() }
<br>
영어 : ${vo.eng}
<br>
수학 : ${vo.math}

	이름은 ${requestScope.name }입니다.
	<br>
	이름은 ${sessionScope.name1 }입니다.
	<br>
	이름은 <%=name %>입니다.
	<br>
	이름은 <%=request.getAttribute("name") %>입니다.
</body>
</html>