<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0 auto;
	width: 1200px;
}
.caption p{
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  word-break: break-all;
}
.thumbnail{
	padding: 0;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="${main_jsp }"/>
	<!-- 각 파일에서 main_jsp를 넘겨줌 'main_jsp'에 'MainModel'을 통해 각각의 파일명을 넣어주면 됨 -->
	<%-- <jsp:include page="footer.jsp"/> --%>
	
	<!-- 실행 시 주소창에 '~jsp'가 아닌 '~.do'로 입력 후 확인!!! -->
</body>
</html>