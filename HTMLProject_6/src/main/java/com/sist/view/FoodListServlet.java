package com.sist.view;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.dao.*;

@WebServlet("/FoodListServlet")
public class FoodListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");;
		
		// HTML을 모아서 전송
		PrintWriter out=response.getWriter();
		// CategoryServlet에서 전송된 cno를 받음
		// FoodListServlet?cno=1
		String cno=request.getParameter("cno");
		// DataBase 연동
		FoodDAO dao=FoodDAO.newInstance();
		CategoryVO cvo=dao.categoryInfoData(Integer.parseInt(cno));
		
		
		out.write("<html>");
		out.write("<head>");
		out.write("</head>");
		out.write("<body>");
		out.write("<div class=container>");
		out.write("</div>");
		out.write("</body>");
		out.write("</html>");
	}

}
