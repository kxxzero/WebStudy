<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--
    	
    	대입연산자
    	=
    	+=
    	-=
    	
    	let a=10;
    	a+=20 => a=a+20 => a=30
		a-=10 => a=a-10 => a=10    	
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		let i=(6>7) && (6!==7)
		document.write("i="+i+"<br>");
		
		i=(6>7) || (6!==7)
		document.write("i="+i+"<br>");
		
		let k=10;
		k+=10;
		document.write("k="+k+"<br>");
		// 변수 선언 시 무조건 초기화
		/*
			let a; // 선언
			a=100; // 초기화
			
			let a=100; // 선언과 동시에 초기화
		*/
		let o=(6===7)?"YES":"NO"
		document.write("o="+o)
		
	}
</script>
</head>
<body>
	
</body>
</html>