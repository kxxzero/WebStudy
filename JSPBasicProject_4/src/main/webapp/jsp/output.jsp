<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.bean.*" %>
    
<%
	// 한글
	request.setCharacterEncoding("UTF-8");

	// 데이터를 받음
	String hakbun=request.getParameter("hakbun"); // 반드시 일치
	String name=request.getParameter("name");
	String kor=request.getParameter("kor");
	String eng=request.getParameter("eng");
	String math=request.getParameter("math");
	
	// 데이터 묶기
	StudentBean sb=new StudentBean();
	sb.setHakbun(Integer.parseInt(hakbun));
	sb.setName(name);
	sb.setKor(Integer.parseInt(kor));
	sb.setEng(Integer.parseInt(eng));
	sb.setMath(Integer.parseInt(math));
	
	// 오라클 전송
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 정보</h1>
	학번 : <%= sb.getHakbun() %>
	이름 : <%= sb.getName() %>
	국어 : <%= sb.getKor() %>
	영어 : <%= sb.getEng() %>
	수학 : <%= sb.getMath() %>	 
</body>
</html>