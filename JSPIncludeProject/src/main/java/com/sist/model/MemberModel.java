package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class MemberModel {
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../member/join.jsp"); // include되는 파일
		return "../main/main.jsp"; // 실행되는 파일
	}
}
