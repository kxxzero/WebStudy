<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>날짜 변환(자바)</h1>
	<%
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(date);
	%>
	<%= today%>
	<br>
	<h1> 날짜 변환(JSTL)</h1>
	<c:set var="date" value="<%=date %>">
	
	
		${date }
	</c:set>
</body>
</html>