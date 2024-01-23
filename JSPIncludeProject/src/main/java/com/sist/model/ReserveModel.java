package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

import java.util.*;
import java.text.*;
public class ReserveModel {
	@RequestMapping("reserve/date.do")
	public String reserve_date(HttpServletRequest request, HttpServletResponse response)
	{
		String today=new SimpleDateFormat("yyyy-M-d").format(new Date());
		StringTokenizer st=new StringTokenizer(today,"-"); // '-'로 나누기
		int year=Integer.parseInt(st.nextToken()); // 연도 잘라내기
		int month=Integer.parseInt(st.nextToken()); // 월 잘라내기
		int date=Integer.parseInt(st.nextToken()); // 일 잘라내기
		String[] strWeek= {"일","월","화","수","목","금","토"};
		
		// 요일 / 마지막 날
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, 1);
		
		int week=cal.get(Calendar.DAY_OF_WEEK); // 요일 가져오기
		week=week-1; // 1번부터 시작하기 때문에 0번부터 시작하기 위해 -1을 해줌
		
		int lastday=cal.getActualMaximum(Calendar.DATE); // 마지막 날짜 가져오기
		
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("date", date);
		request.setAttribute("strWeek", strWeek);
		
		request.setAttribute("main_jsp", "../reserve/date.jsp");
		return "../main/main.jsp";
	}
}
