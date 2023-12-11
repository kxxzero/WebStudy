<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import=""%>

<%
	/* request.setCharacterEncoding("UTF-8"); */

	String fno=request.getParameter("fno");

// 1. Cookie 생성
	Cookie cookie=new Cookie("food_"+fno, fno);

// 2. 저장 경로 설정
	cookie.setPath("/");

// 3. 저장 기간 설정
	cookie.setMaxAge(60*60*24);

// 4. 브라우저로 이동
	response.addCookie(cookie);

// 5. 상세보기로 이동
	response.sendRedirect("detail.jsp?fno="+fno+"&fd="+fd+"&ss="+URLEncoder.encoder(ss,"UTF-8"));
//sendRedirect는 GET 방식 => 요청 값 전송 시 반드시 ?
%> 
