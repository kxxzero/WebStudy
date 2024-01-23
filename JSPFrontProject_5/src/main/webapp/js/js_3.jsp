<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--
    	document.querySelector(CSS선택자)
    		=> tag : ("div")
    		=> id : ("#id")
    		=> class : (".class")
    		=> 계층 : ("div #id")
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		let h1=document.querySelector("h1") // 맨 처음에 위치한 1개의 태그만 적용
		// <h1 style="color:red">
		h1.style.color="orange"
		h1.style.background="skyblue"
		
		let h1s=document.querySelectorAll("h1") // 해당하는 모든 태그에 적용
		// h1 => 배열
		console.log("h1="+typeof h1)
		for(let h1 of h1s){
			h1.style.color="orange"
			h1.style.background="skyblue"
		}
	}
</script>
</head>
<body>
	<h1>Hello JavaScript</h1>
	<h1>Hello JavaScript</h1>
	<h1>Hello JavaScript</h1>
</body>
</html>