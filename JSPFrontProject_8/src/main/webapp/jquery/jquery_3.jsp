<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	/*
		문서 객체(=태그) 제어
			1) <태그>(제어할 값)</태그> => 태그와 태그 사이의 값
				- 읽기(getter) : text()
				- 수정하기(setter) : text("추가 문자열")
				=> textContent()
	*/
	
	$(function(){
		// getter
		/* let h1=$("h1").text()
		alert(h1) */
		
		// setter
		/* $('h1').text("Jqeury값 입력") */
		
		/* let div=$("div").text() // 해당 태그 안에 다른 태그가 존재해도 태그를 제외한 문자열만 읽어옴
		alert(div) */
		
		/* let div=$('div').html(); // innerHTML => 해당 태그 안에 존재하는 다른 태그까지 함께 읽어옴
		alert(div) */
		
		/* $('div').text("<font color=red>Hello Jquery</font>") */ // 입력한 그대로 출력
		/* $('div').html("<font color=red>Hello Jquery</font>") // 입력한 코드가 적용되어 출력 */
		
		// val() => input의 value값을 제어
		let input=$('input').val() // getter
		alert(input)
		
		$('input').val("ID가 없습니다.") // setter => update에서 주로 사용
		// append, trim, attr, hide, show ...
		// 나머지 문법은 이전에 배운 자바스크립트 문법을 그대로 사용
	})
</script>
</head>
<body>
	<div><h1>Hello Jquery!</h1></div>
	<input type="text" size="20" value="Hello">
</body>
</html>