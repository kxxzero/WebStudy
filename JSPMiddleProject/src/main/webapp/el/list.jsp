<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="model" class="com.sist.dao.EmpModel"/>

<%
	model.empListData(request);
	// <% => 자바 코딩을 완전히 제거
	// 최근 => HTML(ThymeLeaf)
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="800" border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>직위</th>
			<th>입사일</th>
			<th>급여</th>
		</tr>
		<%--
			for(EmpVO vo:request.getAttribute("list"))
		--%>
		<c:forEach var="vo" items="${list} ">
			<tr>
				<td>${vo.empno }</td>
				<td>${vo.ename }</td>
				<td>${vo.job }</td>
				<td>${vo.hiredate }</td>
				<td>${vo.sal }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>