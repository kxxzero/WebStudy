package com.sist.view;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import com.sist.dao.*;

@WebServlet("/FoodDetailServlet")
public class FoodDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		// 사용자가 보내준 데이터 받기
		String fno=request.getParameter("fno");
		// fno에 해당하는 데이터 정보를 가지고 옴 => FoodDAO
		
		// 데이터베이스 연동
		FoodDAO dao=FoodDAO.newInstance();
		FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
		
		// 읽어온 데이터를 HTML에 출력
		out.write("<html>");
	    out.write("<head>"); // CSS / JavaScript => 없는 경우에는 생략이 가능
	    out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">");
	    out.write("<style type=text/css>");
		    out.write(".container{margin-top:50px}");
		    // margin:10px 10px 10px 10px 
		    //        top  right bottom left
		    out.write(".row{margin:0px auto;width:900px}");
		    out.write("a.{margin-left:5px;}");
	    out.write("</style>");
	    out.write("</head>");
	    out.write("<body>"); // 화면 UI
	    out.write("<div class=container>");
	    out.write("<div class=row>");
		out.write("<table class=table>");
		out.write("<tr>");
		StringTokenizer st=new StringTokenizer(vo.getPoster(),"^");
		while(st.hasMoreTokens())
		{
			out.write("<td>");
			out.write("<img src="+st.nextToken()+" style=\"width:100%\" class=img-rounded>");
			out.write("</td>");
		}
		out.write("</tr>");
		out.write("</table>");
	    out.write("</div>"); // row
	    out.write("<div style=\"hieght:30px\"></div>");
	    out.write("<div class=row>");
	    out.write("<div class=col-sm-8>");
	    out.write("<table class=table>");
	    
	    
	    
	    if(!vo.getMenu().equals("no"))
	    {
	    	out.write("<tr>");
	    	out.write("<th width=15%>메뉴</th>");
	    	out.write("<td width=85%>");
	    	out.write("<ul>");
	    	st=new StringTokenizer(vo.getMenu(), "원");
	    	while(st.hasMoreTokens())
			{
				out.write("<li>"+st.nextToken()+"원</li>");
			}
	    	out.write("</ul>");
	    	out.write("</td>");
	    	out.write("</tr>");
	    }
	    
	    
	    
	    out.write("<tr>");
	    out.write("<td colspan=2 class=text-right>");
	    out.write("button class=\btn btn-xs btn-danger");
	    out.write("<h3>"+"vo.getName");
	    
	    out.write("</tr>");
	    out.write("</table>");
	    out.write("</div>");
	    out.write("<div class=col-sm-4>");
	    out.write("</div>");
	    out.write("</div>");
	    out.write("</div>");
	    out.write("</body>");
	    out.write("</html>");
	
	}

}
