<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	func()
}
function func()
{
	document.write("func() Call...(1)")	
}
function func()
{
	document.write("func() Call...(2)")	
}

// 똑같은 이름의 함수가 생성될 경우 최근에 만들어진 함수를 호출함 => 오버라이딩 => 같은 이름을 부여할 경우 덮어쓰기 때문에 그 전에 작성된 함수는 호출이 되지 않음
</script>
</head>
<body>

</body>
</html>