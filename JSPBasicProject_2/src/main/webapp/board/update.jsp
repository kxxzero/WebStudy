<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
    
<%
	String no=request.getParameter("no");
	String curpage=request.getParameter("page");
	
	// 2. 오라클에서 데이터 가지고 오기
	BoardDAO dao=BoardDAO.newInstance();
	BoardVO vo=dao.boardUpdateData(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/table.css">
<style type="text/css">
	img#main{
		margin-top: 50px;
	}
	a{
		color : black;
		text-decoration: none;
	}
	a:hover{
		color: green;
		text-decoration: underline;		
	}
		
</style>
</head>
<body>
	<center>
		<img id="main" src="https://i0.wp.com/aikidonews.co.kr/wp-content/uploads/2017/03/QA-e1488530256249.jpg?resize=500%2C269" width="480" height="200">
		<form method="post" action="update_ok.jsp">
			<table class="table_content" width=800>
				<tr>
					<th width=20%>이름</th>
					<td width="80%">
						<input type=text name=name size=15 value="<%= vo.getName() %>" required>
						<%-- 감춘 다음 데이터를 전송 : hidden --%>
						<input type="hidden" name="no" value="<%= no %>">
						<input type="hidden" name="page" value="<%= curpage %>">
					</td>
				</tr>
				
				<tr>
					<th width=20%>제목</th>
					<td width="80%">
						<input type=text name=subject size=45 value="<%= vo.getSubject() %>" required>
					</td>
				</tr>
				
				<tr>
					<th width=20%>내용</th>
					<td width="80%">
						<textarea rows="10" cols="50" name=content required>value="<%= vo.getContent() %>"</textarea>
					</td>
				</tr>
				
				<tr>
					<th width=20%>비밀번호</th>
					<td width="80%">
						<input type=password name=pwd size=10 required>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" class="text-center">
						<button>취소</button>
						<input type="button" value="취소" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>