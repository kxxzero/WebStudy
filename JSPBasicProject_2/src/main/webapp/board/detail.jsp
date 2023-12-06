<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
    
<%
	/*
		1. 회원가입, 회원 수정
			예매, 글쓰기 => 입력창 / 처리창 각각 따로 생성 => jsp 2개
	*/

	// 1. 요청 데이터 받기
	// ?no= &page=
	// request.setCharacterEncoding() => 디코딩을 사용하지 않는 경우(한글이 넘어올 경우에만 사용하는 것으로 한글 깨짐을 방지)
	//	 => 알파벳, 숫자가 넘어올 경우 => 1,2byte 상관 없이 무조건 받음
	String no=request.getParameter("no");
	String curpage=request.getParameter("page");
	
	// 2. 오라클에서 데이터 가지고 오기
	BoardDAO dao=BoardDAO.newInstance();
	BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
	// 3. 데이터를 화면에 출력하기
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let i=0; // 전역 변수
	$(function(){
		// window.onload=function(){}
		$('#delBtn').click(function(){
			if(i==0)
			{
				$('#del').show();
				$('#delBtn').text("취소");
				$('#pwd').focus();
				// document.getElmentByid("pwd");
				i=1;				
			}
			else
			{
				$('#del').hide();
				$('#delBtn').text("삭제");
				i=0;
			}
		});
	});
</script>
</head>
<body>
	<center>
		<img id="main" src="https://i0.wp.com/aikidonews.co.kr/wp-content/uploads/2017/03/QA-e1488530256249.jpg?resize=500%2C269" width="480" height="200">
		<form method="post" action="insert_ok.jsp">
			<table class="table_content" width=800>
				<tr>
					<th width=20%>번호</th>
					<td width=30% class="text-center"><%=vo.getNo() %></td>
					<th width=20%>작성일</th>
					<td width=30% class="text-center"><%=vo.getDbday() %></td>
				</tr>
				<tr>
					<th width=20%>이름</th>
					<td width=30% class="text-center"><%=vo.getName() %></td>
					<th width=20%>조회수</th>
					<td width=30% class="text-center"><%=vo.getHit() %></td>
				</tr>
				<tr>
					<th width=20%>제목</th>
					<td colspan=3><%= vo.getSubject() %></td>
				</tr>
				
				<tr>
					<td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;"><%=vo.getContent() %></pre></td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<a href="reply.jsp?no=<%=no%>&page=<%=curpage%>">답변</a>&nbsp;
						<a href="update.jsp?no=<%=no%>&page=<%=curpage%>">수정</a>&nbsp;
						<span id="delBtn" style="cursor:pointer">삭제</span>&nbsp;
						<a href="list.jsp?page=<%=curpage%>">목록</a>
					</td>
				</tr>
				
				<tr style="display:none" id="del">
					<td colspan="4" class="text-right">
						<form method="post" action="delete.jsp">
							<input type="hidden" name="no" value="<%=no%>">
							<input type="hidden" name="page" value="<%=curpage%>">
							비밀번호 : <input type="password" name="pwd" size="15" id="pwd" required>
							<button>삭제</button>
						</form>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>