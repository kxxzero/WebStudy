<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	Ajax
	↓
	Async(비동기적인)
	Javascript
	And
	XML => JSON
	
	1. 요청을 처리할 파일을 연결 => open
	2. 요청 데이터 전송 => send
	3. 처리할 함수를 자동 호출하게 만듦 => callback
	
	JQuery
	$.ajax({
		type : GET/POST
		url : 요청 처리되는 JSP/Model을 호출
		data : {} => 요청할 데이터가 없는 경우에는 생략할 수 있음
		login.jsp?id=aaa&pwd=1234
		=> {"id":"aaa","pwd":1234}
		success : function(res){
			res => 실행 결과를 읽어 옴
		}
	})
		
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('.btn').click(function(){
			let no=$(this).attr("value") // 같은 이름의 객체가 여러 개일 경우 'this'를 통해 클릭한 객체를 선택할 수 있도록 함
			/* alert(no) */
			
			$.ajax({
				type:'get',
				url:'ajax_recv.jsp',
				data:{"no":no}, // ?no=1
				success : function(html){
					/* alert(html) //  'recv.jsp' html 코드를 읽어 옴 */
					/* $('#recv').html(html) */
					
					$('img').attr("src", html)
				}
			})
		})
	})
</script>
</head>
<body>
	<!-- 요청 처리 -->
	<input type="button" value="1" class="btn">
	<input type="button" value="2" class="btn">
	<input type="button" value="3" class="btn">
	<input type="button" value="4" class="btn">
	<input type="button" value="5" class="btn">
	<input type="button" value="6" class="btn">
	<input type="button" value="7" class="btn">
	
	<!-- <div id="recv">
		실행 결과 출력
	</div> -->
	<center>
		<img src="../image/m1.jpg" width="280" height="360">
	</center>
</body>
</html>