package com.sist.model;

import javax.servlet.http.HttpServletRequest;
/*
 * 	MVC
 * 	Model => java => 요청 처리
 * 		jsp => <%	%> 
 * 	View => jsp => 요청 처리 결과를 받아서 화면에 출력만 하는 역할 => java(<%	%>를 사용하지 않음 => el(${}), JSTL을 사용
 * 	Controller => servlet => jsp에서 요청을 받아서 각 처리에 해당하는 Model을 찾아주는 역할 수행
 * 						  => Model을 찾아서 메소드를 호출 => request가 jsp로 연결
 * 		Dispatcher : 배달부 => Framework : 이미 제작됨
 * 		=> DispatcherServlet
 * 		=> FilterDispatcher
 * 		=> Controller => 서빙
 * 			1) 주문을 받음 => JSP로부터 요청 받음
 * 			2) 주방(package)을 거침 => Model 탐색
 * 			3) 음식 서빙 => request를 통해 한 번에 전송
 * 
 * 					  요청(request : IP 첨부)	  	  요청 받기	요청 내용 그대로 전송(request)	 처리
 * 		사용자(JSP)		===============>		Controller		===============>		Model
 * 						<===============						<===============
 * 			 			출력 => 브라우저에서 읽음(request를 JSP로 전송)	결과물을 요청서와 동시에 전송(request.setAttribute())
 * 													
 * 		=> <a>, <form>
 */

// 요청을 받아서 처리한 결과값 전송
public class ListModel {

	public String execute(HttpServletRequest request)
	{
		request.setAttribute("msg", "게시판 목록");
		return "list.jsp"; // request를 받아서 출력하는 위치 => 'list' 테이블로 전송하라
		
	}
}
