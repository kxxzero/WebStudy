<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*" %>
    
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dao" class="com.sist.dao.BoardDAO"/>
<jsp:useBean id="bean" class="com.sist.dao.BoardBean">
	<jsp:setProperty name="bean" property="*"/>
<%--
	bean.setName(request.getParameter("name"))
	bean.setNo(Integer.paresInt(request.getParameter("no"))
 --%>
</jsp:useBean>

<%
	// id가 등로되면 객체로 사용 가능 => 컴파일 시에 자동으로 자바로 벼경
	dao.boardInsert(bean);
	response.sendRedirect("list.jsp");
%>
