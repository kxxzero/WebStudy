<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- createElement --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		// react
		let h3=document.createElement("h1"); // <h3></h3>
		let text=document.createTextNode("Hello h3 태그")
		h3.appendChild(text)
		
		document.body.appendChild(h3)
		// 페이지 소스 보기 할 경우 소스를 노출하지 않아서 보안성이 높음
	}
</script>
</head>
<body>

</body>
</html>