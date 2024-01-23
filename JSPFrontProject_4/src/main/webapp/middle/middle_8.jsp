<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.container-fluid{
		margin-top: 50px;
	}
	.row{
		margin: 0 auto;
		width: 800px;
	}
</style>
<script type="text/javascript">
let index=1
// function prev()
// let prev=function(){}

let prev=()=>{
	index--
	if(index<1)
	{
		index=7
	}
	let img=document.querySelector('img')
	img.src='../image/m'+index+'.jpg'
	
}
</script>
</head>
<body>
	<div class="contaier">
		<div class="row">
			<div class="text-center">
				<img src="../image/m1.jpg" style="width: 400px"; height>
			</div>
		</div>
	</div>
</body>
</html>