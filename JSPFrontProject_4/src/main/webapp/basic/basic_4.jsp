<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	자바스크립트 반복문
		= do~while : 사용 빈도 거의 없음
					 조건은 후조건을 사용 => 무조건 1번 이상은 수행
			* 형식)
				초기값
				do
				{
					반복수행문장
					증가식
				}while(조건문)
				
		= while : 무한 루프(게임, 네트워크 통신)
				  선조건 => 수행이 1번도 안 될 수 있음
			* 형식)
				
		= for : 반복 회수가 지정된 경우(핵심)
			* 웹 : 사용자에게 보여주는 역할
				 	테이블 : 게시판 => 한 눈에 볼 수 있는 개수(15~20)
				 	div : card => 이미지(10~15) => 페이징
			* 형식)
				for(초기값; 조건문; 증가식)
				{
					반복 수행 문장
				}
				
				for in / for of / ***forEach / ***map
				  
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// type="text/javascript" ES5, ES6 => text/babel
	// do~while
	window.onload=function(){
		let i=1; // 1
		do{
			document.write("i="+i+"<br>"); // 2
			i++; // 3
		}while(i<=10) // 4 => 2번 이동 4(false면 종료)
		
		document.write("<hr>")
		
		// while
		document.write("<h3>while</h3>")
		i=1; // 초기값 => 1
		while(i<=10){ // 2
			document.write("i="+i+"<br>") // 3
			ㅑ++; // 4
		}
		document("<hr>")
		
		//for
		document.write("<h3>for</h3>")
		// 1		2		4
		for(i=1;i<=10;i++){
			document.write("i="+i+"<br>") / /3
		}
		document.write("<hr>")
		
		// break
		document.write("<h3>break</h3>")
		for(i=1;i<=10;i++){
			if(i==5) break // 반복 중단
			document.write("i="+i+"<br>")
		}
		document.write("<hr>")
		
		// continue
		document.write("<h3>continue</h3>")
		for(i=1;i<=10;i++){
			if(i==5) continue // i==5일 때 => 증가식으로 이동
			document.write("i="+i+"<br>")
		}
		document.write("<hr>")	
		
	}
</script>
</head>
<body>

</body>
</html>