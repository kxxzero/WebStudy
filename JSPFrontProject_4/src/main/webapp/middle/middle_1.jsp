<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
	반복문: for
	for(초기값;조건식;증가식)
	{
		반복 수행 문장
	}
	["홍길동","심청이","박문수"]
	["남자","여자","남자"]
	
	2. forEach
	
	3. map => 반복문(가장 많이 사용되는 반복문) => vuew, react
		* 형식)
		배열명.map(function(데이터)){
			자동 호출(배열에서 읽은 값 1개를 매개변수...
			반복 출력물...
		}
		=>
		배멸명.map((데이터)=>{
					화살표(function과 return을 제거)
					람다식(함수의 포인터)
		})
		
		Runnalbe r=new Runnable(
			()=>{}
		)
		
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		const names=["홍길동","심청이","이순신","강감찬","박문수"]
		const sexs=["남자","여자","남자","남자","남자"]
		// 일반 for
		document.write("<h3>일반 for</h3>")
		// length => 배열의 데이터 개수
		// 자바스크립트의 배열 => 인덱스 번호는 0번부터 시작
		
		for(let i=0; i<names.length; i++){
			document.write(names[i]+"&nbsp;")
		}
		document.write("<hr>")
		
		// for of => 1개 출력
		document.write("<h3>for of</h3>")
		
		// for(String name:names)
		for(let name of names){
			document.write(name+"&nbsp;")	
		}
		document.write("<hr>")
			
		// for in => 여러 개 출력
		document.write("<h3>for in</h3>")
				
		for(let index in names){
			document.write(names[index]+"("+sexs[index]+")"+"&nbsp;")	
		}
		document.write("<hr>")
		
		// 함수형으로 변경 => map / forEach
		// 일반 for, map, forEach
		document.write("<h3>map 사용법 1</h3>")
		// 형식 ajax
		names.map(function(name){
			document.write(name+"&nbsp;")
		});
		document.write("<hr>")
			
		document.write("<h3>map 사용법 2</h3>")
		// 형식 ajax
		names.map((name)=>{ // function 대신 화살표 사용
			document.write(name+"&nbsp;")
		});
		document.write("<hr>")
		
		// map 대신 forEach를 사용하여 반복문을 의미한다는 것을 알려줌(쓰는 방식은 동일함)
		document.write("<h3>forEach 사용법 1</h3>")
		// 형식 ajax
		names.forEach(function(name){
			document.write(name+"&nbsp;")
		});
		document.write("<hr>")
			
		document.write("<h3>forEach 사용법 2</h3>")
		// 형식 ajax
		names.forEach((name)=>{ // function 대신 화살표 사용
			document.write(name+"&nbsp;")
		});
		document.write("<hr>")
	};
</script>
</head>
<body>

</body>
</html>