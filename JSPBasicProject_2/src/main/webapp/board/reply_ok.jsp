<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*" %>

<%
// 1. 요청 데이터 가지고 오기
	request.setCharacterEncoding("UTF-8");

	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	
	// hidden
	String pno=request.getParameter("pno");
	String curpage=request.getParameter("page");
	
	BoardVO vo=new BoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
// 2. 데이터베이스 연동
	BoardDAO dao=BoardDAO.newInstance();
    dao.boardReplyInsert(Integer.parseInt(pno), vo); 
    boolean bCheck=dao.boardUpdate(vo);

// 3. 화면 이동
// 	=> 비밀번호(X) => history.back()
	if(bCheck==false)
	{
		%>
			
		<%
	}
	else
	{
		response.sendRedirect("detail.jsp?no="+pno+"&page=");
		// sendRedirect는 GET 방식
	}

//	=> 비밀번호(O) => detail.jsp
%>