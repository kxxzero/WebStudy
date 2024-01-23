<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// 384page : 필요할 경우 class를 추가/삭제
	$(function(){
		$('#box').hover(function(){ // if
			$('#box').addClass('hover') // 'hover'라는 클래스명 추가
		}, function(){ // else
			$('#box').removeClass('hover') // 'hover'라는 클래스명 삭제
		})
	})
	// 주로 메뉴에서 'active' 활성화 시 사용
</script>
<style type="text/css">
	#box{
		width: 100px;
		height: 100px;
		background-color: red;
	}
	#box.hover{
		background-color: blue;
		border-radius: 50px;
	}
</style>
</head>
<body>
	<div id="box"></div>
</body>
</html>