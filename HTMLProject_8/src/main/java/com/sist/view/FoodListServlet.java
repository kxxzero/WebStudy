package com.sist.view;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 	Servlet => Server + let(경량 프로그램이라는 의미로 저장되는 메모리를 최소화 => Applet/Midlet)
/*
 * 	Servlet(보안이 필요한 경우)
 * 		장점 : 보안 => .java 파일이 아닌 .class 파일로 전송하기 때문에 소스 자체를 볼 수는 없음
 * 		 	자바와 HTML을 연결
 * 		 	JSP + Servlet
 * 		단점 : HTML 작성이 복잡함(문자열) => HTML을 사용하지 않음
 * 		 	수정 할 때마다 컴파일 해야 함
 * 
 * 	JSP(화면 출력용)
 * 		장점 : 사용 편리
 * 			컴파일 과정 없이 실행 => 스크립트
 * 		단점 : 보안이 취약 => .jsp 파일 그대로 전송
 * 
 *	M
 * 	V : View => JSP
 * 	C : Controller => Servlet
 * 
 * 	Spring : 처리 => 웹 => Servlet
 * 
 * 	***
 * 		1. 페이징(Block)
 *  	2. 쿠키(Cookie)
 *  	3. 세션(Session)
 *  	4. 요청 = 응답
 *  
 *  	HTML : 정적 => 화면 UI 출력용
 *  		=> 서버로 데이터 전송
 *  			GET : 'URL?데이터' => 주로 사용하나 노출이 심함 => 단순 데이터 전송(페이지, 번호(영화 번호), 검색...) => 전송이 없는 경우 GET(기본값) 
 *  			POST : => 상대적으로 중요하거나 데이터가 많은 경우 => <form>만 유일하게 POST 방식(나머지는 모두 GET 방식)
 *  			PUT
 *  			DELETE
 *  			=> RestFul
 *  
 *  			JavaScript
 *  			==========
 *  			ajax({
 *  				type:POST
 *  				url: 주소값
 *  				success : function(result)
 *  			})
 *  			View, React
 *  			axios.get...then()
 *  			axios.post		
 *  
 *  	========================= CSS
 */

import java.util.*;
import com.sist.dao.*;
@WebServlet("/FoodListServlet") // 톰캣이 URL 주소를 통해 구동 
public class FoodListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전송 방식(HTML, XML) => 브라우저에 통보
		response.setContentType("text/html;charset=UTF-8");
		
		// 2. 브라우저에서 읽어갈 메모리 위치를 확보
		PrintWriter out=response.getWriter();
		
		// 3. 사용자의 요청값을 받음
		String page=request.getParameter("page");
		if(page==null) {
			page="1"; // default값 => 없을 경우 오류 발생
		}
		int curpage=Integer.parseInt(page);
		
		// 4. 데이터베이스 연동 => 요청한 데이터를 가지고 옴
		FoodDAO dao=FoodDAO.newInstance();
		List<FoodVO> list=dao.foodListData(curpage);
		int totalpage=dao.foodTotalPage();
		
		// 블록 나누기
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		// 1 => 현재 페이지 => 1~10
		//					(10-1)/10*10=0
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
		{
			endPage=totalpage;
		}
		
		// 5. 데이터를 HTML을 통해 출력
		out.write("<html>");
		out.write("<head>"); // css/javascript가 없는 경우 <head> 태그 생략 가능
		out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">");
		out.write("<style type=text/css>");
			out.write(".container{margin-top:50px}");
			// margin : 10px 10px 10px 10px
			//			top right bottom left
			out.write(".row{margin:0 auto; width:900px}");
		out.write("</style>");
		out.write("</head>");
		out.write("<body>"); // 화면 UI
		out.write("<div class=container>");
		out.write("<div class=row>"); // 맛집 이미지
		for(FoodVO vo:list)
		{
			out.write("<div class=\"col-md-4\">");
				out.write("<div class=\"thumbnail\">");
					out.write("<a href=FoodDetailServlet?fno="+vo.getFno()+">");
						out.write("<img src="+vo.getPoster()+" alt=\"\" style=\"width:100%\">");
						out.write("<div class=\"caption\">");
							out.write("<p>"+vo.getName()+"</p>");
						out.write("</div>");
					out.write("</a>");
				out.write("</div>");
			out.write("</div>");
		}
		out.write("</div>");
		out.write("<div class=row>"); // 페이지 출력
		out.write("<div class=text-center>");
		
		out.write("<ul class=\"pagination\">");
			if(startPage>1)
			{
				out.write("<li><a href="+(startPage-1)+">&lt;</a></li>");
			}
//			out.write("<li><a href=\"#\">&lt;</a></li>");
//			out.write("<li><a href=\"#\">1</a></li>");
//			out.write("<li class=\"active\"><a href=\"#\">2</a></li>");
//			out.write("<li><a href=\"#\">3</a></li>");
//			out.write("<li><a href=\"#\">4</a></li>");
//			out.write("<li><a href=\"#\">5</a></li>");
			for(int i=startPage; i<=endPage; i++)
			{
				out.write("<li " + (i == curpage ? "class=\"active\"" : "") + "><a href=\"FoodListServlet?page=" + i + "\">" + i + "</a></li>");
			}
			
			if(endPage<totalpage)
			{
				out.write("<li><a href=FoodListServlet?page="+(endPage+1)+">&gt;</a></li>");
			}
		out.write("</ul>");
		
		out.write("</div>");
		out.write("</div>");
		out.write("<div class=row>"); // 최근 방문
		out.write("</div>");
		out.write("</body>");
		out.write("</html>");
	}

}
