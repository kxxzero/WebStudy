package com.sist.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.*;

/*
 * 1. 관련된 클래스가 여러 개 있음 => 인터페이스로 통합(조건 없이 인터페이스 하나로 제어 가능)
 * 2. 조건문 없이 사용 => Map
 * 3. 미리 클래스 메모리 할당 => 주소
 * 4. Model을 찾는 경우에는 URL 주소를 이용해서 찾음
 * 5. 구분
 * 	= request를 JSP로 전송 => forward => 화면에 출력
 *  = request를 초기화 하고 JSP만 호출 => (send)redirect => 예) Insert, Update, Delete
 *  = JSP를 변경하지 않고 전송(데이터만 전송) => Ajax(void)
 *  
 *  => Controller
 *  	1) 요청을 받음
 *  	2) Model을 찾음
 *  	3) Model의 메소드 호출 => request
 *  	4) request를 JSP로 전송
 *  => Model
 *  	1) 요청값을 받음 => 매개변수(request)
 *  	2) 요청 처리 => DAO
 *  	3) 결과값을 request에 담음 => setAttribute()
 *  => View
 *  	1) Controller에서 보내준 request를 출력
 */

@WebServlet("*.do") // 확장자명은 자유롭게 지정 가능 => MVC 구조
/*
 * 찾는 방법
 * 	- list.do
 * 	- update.do
 * 	- delete.do
 * 	- insert.do
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map clsMap=new HashMap();
	
	public void init(ServletConfig config) throws ServletException {
		clsMap.put("list", new ListModel());
		clsMap.put("insert", new InsertModel());
		clsMap.put("update", new UpdateModel());
		clsMap.put("delete", new DeleteModel());		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1번째 방법
		String cmd=request.getRequestURI(); // URI 서버 주소를 제외한 나머지를 모두 가져옴
		/*
		 * /JSPMVCProject_2/list.do
		 * ===============
		 * ContextPath
		 */
		System.out.println("cmd=>1:"+cmd);
		
		cmd=cmd.substring(request.getContextPath().length()+1, cmd.lastIndexOf(".")); // URI+1 뒤에서부터 '.' 앞까지 잘라오면 'list'만 추출
		System.out.println("cmd=>2:"+cmd);
		
		
		// 2번째 방법
		Model model=(Model)clsMap.get(cmd);
		System.out.println("model:"+model); // 새로고침 해도 주소가 모두 동일 => 싱글톤(재사용 가능)
		String jsp=model.execute(request);
		
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
