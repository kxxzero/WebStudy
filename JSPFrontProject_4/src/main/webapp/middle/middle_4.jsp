<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	배열 => let 변수명=[]
	객체 => let 변수명={} => 자바의 VO 같은 역할
	객체 배열 => let 변수명=[{},{},{},{}...] => 자바의 List 같은 역할
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.container{
		margin-top: 50px;
	}
	.row{
		margin: 0 auto;
		width: 800px;
	}
</style>
<script type="text/javascript">
	window.onload=function(){
		const sawons=[
			{sabun:1, name:'홍길동', dept:'개발부', loc:'서울', job:'대리'}
			{sabun:2, name:'심청이', dept:'영업부', loc:'부산', job:'과장'}
			{sabun:3, name:'박문수', dept:'기획부', loc:'경기', job:'사원'}
			{sabun:4, name:'이순신', dept:'자재부', loc:'인천', job:'부장'}
			{sabun:5, name:'강감찬', dept:'총무부', loc:'제주', job:'대리'}
		]
		let html='';
		
		// for(SawonVO vo:list)
			
	
			
			
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
			<thead>
				<tr class="success">
					<th class="text-center">사번</th>
					<th class="text-center">이름</th>
					<th class="text-center">부서</th>
					<th class="text-center">근무지</th>
					<th class="text-center">직위</th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>