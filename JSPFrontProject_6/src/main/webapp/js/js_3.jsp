<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	내장 객체
	1. Math 객체
	
	2. Number
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.container{
		margin-top: 50px;
	}
	
	.row{
		margin: 0 auto;
		width: 100%;
	}
</style>
<script type="text/javascript">
	let str="Hello JavaScript ";
	documnet.write("문자 개수:"+str.length+"<br>")
	str=str.trim()
	documnet.write("문자 개수(trim):"+str.length+"<br>")
	
	window.onload=function(){
		let btn=document.querySelector("#btn")
		btn.addEventListener('click', function(){
			let fd=document.querySelector('#fd')
			if(fd.value.trim()=="")
			{
				alert("검색어 입력!")
				fd.focus()
				return
			}
			alert("검색어 입력 완료!")
		})
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<input type="text" id="fd" name="fd" size="20" class="input-sm">
			<input type="button"value="검색" class="btn-sm btn-danger">	 
		</div>
	</div>
</body>
</html>