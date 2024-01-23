package com.sist.model;


import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

/*
 * 	1. DispatcherServlet
 * 		=> WEB-INF => application에 있는 클래스명을 읽음
 * 		=> 대기
 * 		=> init은 서버 구동 시 1번만 수행
 * 	2. 사용자 접속 : service()
 * 		=> 사용자가 URL을 전송
 * 			예) main/main.do
 * 		=> 전체 XML에 등록된 Model을 읽음 => @RequestMapping을 찾아서 메소드 호출
 */

public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response)
	{
		// DB 연동
		request.setAttribute("main_jsp", "../main/home.jsp"); // include가 되는 파일
		return "../main/main.jsp"; // return은 항상 main으로 설정하여 main으로 돌아가도록 함
		
		// 'main_jsp'를 '../main/main.jsp'에 'application.xml'등록하여 전송
	}
	
	// RequestMapping에는 같은 이름을 사용할 수 없음
}
