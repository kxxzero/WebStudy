<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	자바스크립트 ===== 자바 ===== 오라클
		└ 오라클을 연결할 수 없음
	*** 자바와 자바스크립트 연동
		~VO	=== {} === Object
				== 자바스크립트 객체 표현법 => JSON
		~List === [{},{},{}...] => Array
		=> 브라우저 안 자바에서 전송된 데이터를 받아서 동적으로 변환
						=============== Array, Object
		=> 자바스크립트 사용법
			1) 내부 스크립트(파일 1개 제어)
				<head>
					<script>
						=> 제어
					</script>
				</head>
			2) 외부 스크립트(여러 개 파일을 동시에 제어, 재사용)
				.js
				원격 : <script src="http:~">
				내부 : <script src="경로명">
			3) 인라인 스크립트 : 태그 1개 제어
				onclick="javascript:history.back()"
				function aaa()
				<a href="aaa()">(X)
				<a href="javascript:aaa()"> => 우편 번호
		=> 버전
			ES5 => ES6
			변수 => 자동 지정 변수
					var => let, const
						=> 화살표 함수
			let a=10 => a:Int
			let a="aaa" => a:String
			let a=10.5 => a:Double
			let a=[] => a:Array
			let a{} => a:Object
			
			*** ';'은 사용해도 되고 안 해도 됨
		
		=> 자바스크립트 출력(결과값)
			1. alert()
			2. console.log()
			3. document.write()
			4. innerHTML => Ajax, Vue, React
		========================================
			1. 자바스크립트 문법
				= 변수선언
				= 데이터형
				= 연산자
				= 제어문
				= 함수
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 
	
	1) 변수
		변수 선언(데이터형이 없음) => 값에 따라서 자동으로 데이터형이 변경
		var => let, 상수 = const
		var의 단점은 지역변수의 스코프(사용 범위)가 명확하지 않음
		function aaa()
		{
			var a=10; => 메모리 누수 현상이 많이 존재
		} //  메모리가 해제(X)
		alert(a);
		
		↓ 
		
		function aaa()
		{
			let a=10;
		} // 메모리 해제(O)
		=> 식별자
			- 키워드는 사용 불가 => let, if, for ...
			- 특수문자 사용 가능 => _, $
			- 숫자로 시작할 수 없음
			- 공백이 있으면 안 됨
			- 대소문을 구분함
			- 문자 길이는 상관 없음(3~10)
		=> 규칙
			- 생성자는 대문자 => 객체 지향 => React
			- 변수, 함수 => 소문자
			- 단어가 여러 개인 경우에는 각 단어의 시작을 대문자로 입력
		*** 변수 : 1개의 데이터를 저장하는 메모리 공간
	2) 데이터형(자바스크립트에서 지원)
		let i=10 => i:int
		let i=10.5 => i:double
		
		========================= i:Number
		*** 문자열 정수형 변환
			Number('10'), parseInt('10')
			
			let i='A' => i:char => i='ABCDE'
			let i="A" => i:String
			==================== i:String
			
		*** 숫자를 문자열 변환
			String(10) => '10'
			
			====================
			let i=true => i:boolean
			
			Boolean(1) => true, Boolean(0) => false
			=> c언어
			let i={키:값, 키:값...}
			let hong={name:'홍길동', sex:'남자', age:'20'}
					=> hong.name, hong.sex, hong.age
					=> 자바스크립트 객체 표현법(JSON)
			let i=[] => i:Array
			=====> 데이터형이 달라도 됨 ["aaa", 10, 10.5 true...]
			***
				let i=10;
				i="hello"
				i=[]
				i={}
				
				let i=function(){}
				=> Number(정수, 실수), String(문자열, 문자), Boolean, Object, Array, Function
				
				=> 데이터형 확인이 가능 typeof
				
				=> 자바 => main()
					window.onload=function(){}
					=> Jquery : $(function(){})
					=> VueJs : mounted()
					=> React : componentDidMount()
				
					1. Number : 정수, 실수
					2. String : 
*/
	window.onload=function(){
		/*
            출력 방법 => System.out.println()
            => console.log(출력물)
            => 브라우저 출력 : document.write()
            => 팝업 : alert()
            => 태그안에 출력 : innerHTML
        */
		let a=10
       	let b=10.5 
       	let c='ABC'
       	let d="ABC"
       	let e=[1,2,3,4,5,"홍길동"] // Array => Object
       	let f={name:'홍길동',sex:'남자',age:20}
       	let g=true
       	
       	console.log("a="+a);
        console.log("b="+b);
        console.log("c="+c);
        console.log("d="+d);
        console.log("e="+e);
        console.log("f="+f);
        console.log("g="+g);
        
        /*document.write("a="+a+"<br>")
        document.write("b="+b+"<br>")
        document.write("c="+c+"<br>")
        document.write("d="+d+"<br>")
        document.write("e="+e+"<br>")
        document.write("f="+f+"<br>")
        document.write("g="+g+"<br>")
        document.write("<hr>")*/
        
        let i="a="+a+"<br>"
        +"b="+b+"<br>"
        +"c="+c+"<br>"
        +"d="+d+"<br>"
        +"e="+e+"<br>"
        +"f="+f+"<br>"
        +"g="+g+"<br>"
        +"<hr>"
   		let k=document.querySelector("span");
   		k.innerHTML=i;
   		
   		/*
	        자바스크립트에서 제공하는 데이터형 
	        1. Number : 정수,실수 
	        2. String : 문자(''),문자열("")
	        3. Object : Array([]),Object({})
	        4. Boolean : true/false 
	            * 0이 아닌 모든 수는 true 
	              0, 0.0 => false
	        5. null : 값이 없는 경우 
	        6. undefined : 선언이 안된 경우 
	        ========= 확인 : typeof 
    	*/
    	
    	document.write("a="+typeof a+"<br>")
        document.write("b="+typeof b+"<br>")
        document.write("c="+typeof c+"<br>")
        document.write("d="+typeof d+"<br>")
        document.write("e="+typeof e+"<br>")
        document.write("f="+typeof f+"<br>")
        document.write("g="+typeof g+"<br>")
        let m;// 값이 없는 경우 / 선언 안된 변수 => undefined
        document.write("m="+typeof m+"<br>")
        document.write("j="+typeof j+"<br>")
        
        // 자바스크립트는 필요하면 언제든 데이터형 변경이 가능
        document.write("<hr>");
        let o=10;
        document.write("o="+typeof o+"<br>")
        o="Hello"
        document.write("o="+typeof o+"<br>")
        o={name:"홍길동"};
        document.write("o="+typeof o+"<br>")
        o=["aa",1,2,3,4.5,6]
        document.write("o="+typeof o+"<br>")
        
        let u='';
        let n="";
        document.write("u="+typeof u+"<br>")
        document.write("n="+typeof n+"<br>")
       	
}
</script>
</head>
<body>
	<span></span>
</body>
</html>