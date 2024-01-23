<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	2) 내장 객체
		= Number()
		= parseInt()
		= String() => 형변환
			=> 유효성 검사(오라클 => Primary Key, NOT NULL)
			- length : 입력된 문자의 개수 => 비밀번호
			- charAt(number)
					======== 문자열 번호(0)
				예) Hello
				   01234 => charAt(4) => 'o'
			- indexOf() : 해당 문자열 찾기
				형식) indexOf('찾는 문자열', fromIndex)
				=> Number(return) => -1은 존재하지 않는 경우
			- lastIndexOf
				형식) lastIndexOf('찾는 문자열', fromIndex)
				=> 서제스트(자동 완성기) => 자음으로 찾기 => PROCEDURE
			- replace : 문자열 변경
				형식) replace('변경될 문자열','변경할 문자열')
			- *** split
				형식) split(String, 구분할 문자) => [](배열에 저장)
			- substring() : 문자를 자를 때 사용
				형식) substring(시작 문자 번호, 끝나는 문자 번호(-))
			- substr
				형식) substr(시작 문자 번호, 개수)
			- trim : 좌우 공백 제어 => 입력 여부
			
		*** 웹의 단점 : 모든 데이터가 문자열로 되어 있음
			String / Date / Array
			=============== 특별한 경우가 아니면 자바에서 처리
		* 서버에서 데이터 읽기 => ajax / axios(vue, react)
		
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/*
		1. 변수
			= let(지역 변수, 전역 변수)
			= const(상수 => 자바에서 데이터를 받는 경우에 주로 사용 => 데이터가 변할 일이 없기 때문)
		2. 연산자
			= +
			= 비교연산자
			= 대입연산자(=, +=)
		3. 제어문
			= if => if~else
			= for문
				· 일반 for문 : for(let i=0; i<=10; i++)
							 for(let data of 배열)
							=========================
					=> 응용 : map, forEach
							 map : 배열.map(function(읽을 데이터){})
								=> 배열.map((읽을 데이터) => {})
								=> map 대신 forEach
		4. 함수
			= 내장 함수
				- 형변환
					· Number(), parseInt()
					· String()
					· JSON.parse()
						오라클 => 자바 => 자바스크립트
								List => []
								VO => {}
								=============== JSON 아니고 String
					JSON => 자바스크립트의 객체 표현법 => .json
					====> XML을 전송
						========== XML을 대체 JSON
							AJAX
							=====  JavaScript AND XML
							
							Vue <=> Spring
							React <=> Spring-Boot
							
			= 사용자 정의 함수
				- 선언적 함수
					function func_name(매개변수...)
					{
							
					}
				- 익명의 함수 : 함수 안에 함수 선언 => 이벤트 등록
					let func_name=function(){}
					let func_name=()=>{}
					
				*** 주의점
					매개변수, 리턴형은 데이터형을 사용하지 않음 => 모두 let으로 처리하기 때문
						예) (name, addr)
			
			= 객체 모델 선택 => 자바스트립트에서는 태그=객체, 속성=멤버변수로 취급
				예) document.querySelector(CSS선택자(태그))
					======================> $(CSS선택자(태그)) : 제이쿼리
				   document.getElementById(id명)
				   
				*** DOM(Document Object Model)프로그램 : 태그를 제어하는 프로그램
					· createElement : 태그를 생성하는 함수
					· createTextNode : 태그와 태그 사이에 들어가는 내용값을 설정
						예) <a>클릭</a> => 클릭
					· appendChild() : 추가
					· innerHTML : 태그를 읽어서 값을 설정
					· textContent : 태그를 읽어서 값을 설정
						예) <td> </td>
					· setAttribute / getAttribute
						예) <embed src="|"> => 동영상
					*** class="" => active 
								 => addClass, removeClass
										
			= 이벤트
				- 일반 방식
					function aaa(){} // 일반적으로 가장 많이 사용하는 형식
					button onclick="aaa()"></button>
				- 고전적인 방식
					let button=document.querySelector("")
					button.onclick=function(){}
				- 리스너 이용 방식
					let button=document.querySelector()
					button.addEventListener('click', function(){})
					=> Jquery
						$('button').click(function(){})
						$('button').on('click', function(){})
			
	*/
			
		}
</script>
</head>
<body>

</body>
</html>