let httpRequest=null;

// 브라우저 내장객체를 생성하는 함수
// XMLHttpRequest => 서버에 요청 전송 => 서버로부터 결과값을 받는 클래스
function getXMLHttpRequest(){
	// window.ActiveObject => IE
	if(window.XMLHttpRequest){ // 기타 브라우저(크롬, 파이어폭스)
		return new XMLHttpRequest()
		
	}else{
		return null
	}
}

// 서버에 요청 => find.jsp?fd=aaa
/*
	$.ajax({
		type:post
		url:result.jsp => result.jsp?no=1
		data:{no:1}
		success:function(res){
			res => 실행 결과물 => html, json, 일반 문자
				=> resText, resXML
		}
	})
*/
function sendRequest(url, params, callback, method)
{
	// XMLHttpRequest 얻기
	httpRequest=getXMLHttpRequest();
	
	// 전송 방식 <form method="past">
	let httpMethod=method?method:'GET' // null => GET
	if(httpMethod!='GET' && httpMethod!='POST'){
		httpMethod='GET'	
	}
	// params => null이거나 ''일 경우
	// GET => url? => send()
	
	let httpParams=(params==null || params=='')?null:params
	let httpUrl=url
	
	// GET 방식
	if(httpMethod=='GET' && httpParams!=null){
		httpUrl=httpUrl+"?"+httpParams
		// a.jsp?no=1
	}
	
	// 연결
	httpRequest.open(httpMethod, httpUrl, true)
	// true => 비동기, false => 동기
	httpRequest.setRequestHeader('Content-Type', "application/x-www-form-urlencoded")
	// 콜백 함수 지정 => 자동 호출 => 실행 결과값을 받음
	httpRequest.onreadystatechange=callback
	// 데이터 전송
	httpRequest.send(httpMethod=='POST'?httpParams:null)
}