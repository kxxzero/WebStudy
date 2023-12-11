<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.bean.*" %>
    
<%
	request.setCharacterEncoding("UTF-8");
%>

<%-- StudentBean bean=new StudentBean() : 메모리 할당 --%>
<jsp:useBean id="bean" class="com.sist.bean.StudentBean">
	<jsp:setProperty name="bean" property="*"/>
	<!-- '*' 입력 시 전체 값 출력 / 개별 낱개 출력도 가능 -->
</jsp:useBean>

<%--
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
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 정보</h1>
	학번 : <%= bean.getHakbun() %>
	학번 : <jsp:getProperty name="bean" property="hakbun"/><br>
	이름 : <%= bean.getName() %>
	국어 : <%= bean.getKor() %>
	영어 : <%= bean.getEng() %>
	수학 : <%= bean.getMath() %>
</body>
</html>