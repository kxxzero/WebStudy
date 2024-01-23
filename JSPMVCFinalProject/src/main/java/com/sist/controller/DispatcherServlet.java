package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.*;

import java.util.*;
import java.net.*;

/*	
 * 	XML 파싱
 * 	Annotation => 클래스 찾기 => 메소드 찾기
 * 	=> MVC 동작
 * 		1. 요청(JSP) => <a>, <form>
 * 			=> DispatcherServlet(Controller) => 이미 제작
 * 			=> @WebServlet("*.do")
 * 						============ list.do, insert.do
 * 									======	============ 구분문자
 * 					| 서버에서 받을 수 있는 부분 : URI, URL => 서버 연결 주소
 * 						=> URI를 이용해서 Model 찾기
 *		2. DispatcherServlet(Controller)의 역할
 *			= 브라우저에서 요청을 받음
 *					=> 요청 받는 파일
 *						JSP : View(화면 출력) => 보안이 취약하기 때문에 화면 출력만 함
 *						Servlet : 연결(Java/HTML)
 *								===============
 *			= 분리된 Java를 찾음 => HTML에 연결(request/session)
 *		3. MVC 목적 : 유지보수를 오래하기 위함
 *			1) 보안(JSP => 배포(소스를 통으로 전송)) => 유지보수
 *			2) 여러 명이 동시 개발 => Front(HTML) / Back(Java)
 *			3) JSP 단점 : 확장성, 재사용, 변경이 어려움
 *				=> 사이트 제작 시 버림
 *			4) 신규 사원 확장
 *			=> 차기 MVVM / MVVP
 *		4. 소프트웨어 => 회귀
 *		==================== 
 *		5. 동작			 request
 *			JSP(링크, 버튼) =====> DispatcherServlet
 *								=====> Model(DAO와 연동)
 *								   ===== request에 결과값 담기
 *										=> setAttribute()
 *			  DispatcherServlet <=====
 *				=> request 필요 있음 => request를 JSP로 전송
 *					JSP로 request를 전송 메소드 => forward(request, response) 
 *				=> request 필요 없음 => 화면만 이동
 *					화면만 변경하는 메소드 => sendRedirect(파일명) => 회원가입, 로그인 여부, 글쓰기... = INSERT/UPDATE/DELETE
 *
 *		*** DispatcherServlet은 수정 불가 => 고정 시켜서 '.jar' 파일 생성
 *				1) 설정 파일
 *					Spring : application-context.xml
 *							 application-datasource.xml
 *							 application-security.xml
 *								=> 태그 속성은 Spring에서 제공하는 것만 사용 가능
 *								=> dtd
 */

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<String> clsList= new ArrayList<String>();

    public DispatcherServlet() {
        // TODO Auto-generated constructor stub
    	// 1. XML의 경로 읽기 => XML 안에 클래스 등록
    	try
    	{
    		URL url=this.getClass().getClassLoader().getResource(".");
    		File file=new File(url.toURI());
    		// 다양한 운영체제에 호환시키기 위해 사용
    		
    		System.out.println(file.getPath());
    		String path=file.getPath();
    		path=path.replace("\\", File.separator);
    		
    		// 경로 입력 방법
    		// window => \\
    		// mac => /
    		path=path.substring(0, path.lastIndexOf(File.separator));
    		
    		// C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPMVCFinalProject\WEB-INF\classes
    		
    		System.out.println(path);
    		path=path+File.separator+"application.xml"; // 파일명은 반드시 'application.xml'
    		
    		// XML 파싱 : XML 안에서 필요한 데이터를 추출하는 것
    		// 1. 파서기 생성
    		DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
    		DocumentBuilder db=dbf.newDocumentBuilder();
    		
    		// 2. XML을 전송
    		Document doc=db.parse(new File(path));
    		
    		// 3. root 태그 읽기 => 테이블
    		Element root=doc.getDocumentElement();
    		// beans => SQL 문장에서 'FROM 테이블명'
    		
    		// 4. root 밑에 있는 태그를 모아서 데이터 추출
    		NodeList list=root.getElementsByTagName("bean");
    		// 1,2,3,4,5,6,7,8,9,10 =>  for(i=1; i<=10; i++){}
    		
    		// list => <bean>
    		for(int i=0; i<list.getLength(); i++)
    		{
    			// <bean id="board" class="com.sist.model.BoardModel"> 
    			Element bean=(Element)list.item(i);
    			String id=bean.getAttribute("id");
    			String cls=bean.getAttribute("class");
    			System.out.println(id+":"+cls);
    			
    			clsList.add(cls);
    		}
    		
    		    		
    		
    	}catch(Exception ex) {}
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri=request.getRequestURI();
		uri=uri.substring(request.getContextPath().length()+1);
		
		System.out.println("사용자 요청 URI :"+uri);
		
		try
		{
			for(String cls:clsList)
			{
				// 클래스 정보 읽기
				Class clsName=Class.forName(cls);
				// 메소드 / 멤버변수 /생성자 
		
				// 클래스 정보를 이용해서 메모리 할당 리플렉션
				Object obj=clsName.getDeclaredConstructor().newInstance();
				
				Method[] methods=clsName.getDeclaredMethods(); // 클래스에 선언된 모든 메소드를 가지고 옴
				for(Method m:methods)
				{
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					// 메소드 위에 선언된 @RequestMapping을 가지고 옴
					// => m(메소드) => 위에 저장된 어노테이션을 가지고 옴
					/*
					 * 저장된 객체
					 * 	A a=new A() => a
					 * A
					 */
					if(rm.value().equals(uri))
					{
						String jsp=(String)m.invoke(obj, request, response);
						
						System.out.println("출력할 JSP:"+jsp);
						
						if(jsp==null) // void => ajax
						{
							return;
						}
						else if(jsp.startsWith("redirect:"))
						{
							// return "redirect:list.do"
							jsp=jsp.substring(jsp.indexOf(":")+1);
							response.sendRedirect(jsp);
							// sendRedirect() : 새롭게 생성
						}
						else
						{
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);
							// 실질적으로 실행되는 것은 DispatcherServlet임 => URL이 .do로 실행됨 => jsp가 아닌 Servlet을 실행 중
							// forward() : 복사해서 덮어쓰기
							// 하나의 화면에서 HTML을 바꿔치기 하는 것이기 때문
						}
						return;						
					}
				}
			}
		}catch(Exception ex) {
			System.out.println("Error 발생 :" + ex.printStackTrace());
			ex.printStackTrace();
		}
	}

}
