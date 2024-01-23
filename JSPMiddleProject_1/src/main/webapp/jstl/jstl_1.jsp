<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>&lt;c:forTokens&gt; => StringTokenizer</h1>
	<c:forTokens items="m1, m2, m3, m4, m5, m6, m7" delims="," var="image">
		<img src="${images.}" width="150" height="200">
	</c:forTokens>
	
	<h1>&lt;c:if&gt;</h1>
	<%-- 증가 : step="1" => 생략 가능 --%>
	<%-- 문자 가능 --%>
	<c:forEach var="i" begin="1" end="10">
		<c:if test="${i%2==0}">
			${i += "짝"}&nbsp;
		</c:if>
		<%-- else가 없기 때문에 반대 조건을 직접 지정 --%>
		<c:if test="${i%2!=0}">
			${i += "홀"}&nbsp;
		</c:if>
	</c:forEach>
</body>
</html>