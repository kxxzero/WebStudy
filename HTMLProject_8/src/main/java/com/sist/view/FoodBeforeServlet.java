package com.sist.view;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FoodBeforeServlet")
public class FoodBeforeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fno=request.getParameter("fno");
		Cookie cookie=new Cookie("food_"+fno, fno);
		//                        키           값 => map
		// 저장위치 
		cookie.setPath("/");
		// 저장기간 
		cookie.setMaxAge(60*60*24);
		// 클라이언트로 전송 
		response.addCookie(cookie);
		
		// 상세 보기로 이동 해라
		response.sendRedirect("FoodDetailServlet?fno="+fno);
	}

}
