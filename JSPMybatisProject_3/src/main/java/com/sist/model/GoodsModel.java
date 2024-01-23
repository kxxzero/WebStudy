package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.dao.*;
import com.sist.controller.RequestMapping;

/*	MVC
 * 	DB 연동
 * 	화면 출력
 */

public class GoodsModel {
	private String[] table= {"", "goods_all", "goods_best", "goods_special", "goods_new"};
	
	@RequestMapping("goods/goods_list.do")
	public String goods_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		String type=request.getParameter("type");
		if(type==null) {
			type="1";
		}
		String tab=table[Integer.parseInt(type)];
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("tab_name", tab); // mapper에 작성한 명칭과 동일하게 입력힐 것
		map.put("start", start);
		map.put("end", end);
		
		List<GoodsVO> list=GoodsDAO.goodsListData(map);
		
		// 총 페이지
		int totalpage=GoodsDAO.goodsTotalPage(map);
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		
		// JSP로 전송
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		
		request.setAttribute("main_jsp", "../goods/goods_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("goods/goods_detail.do")
	public String goods_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String type=request.getParameter("type");
		Map map=new HashMap();
		map.put("no", no);
		map.put("tab_name", table[Integer.parseInt(type)]);
		GoodsVO vo=GoodsDAO.goodsDetailData(map);

		String price=vo.getGoods_price();
		price=price.replaceAll("[^0-9]",""); // 숫자 외에 나머지는 공백
		// 숫자 => [0-9], 알파벳 => [A-Za-z], 한글 => [가-힣]
		// ^[A-Z] => 시작, [^] => 제외
		// [A-Z]$ => 끝
		// . => 임의의 한글자
		// * => 0 이상
		// + => 1 이상
		// ? => 0 또는 1
		// => 정규식
		// [] => 패턴, {} => 개수
		// [0,9],{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3} => ip
		vo.setPrice(price);
		request.setAttribute("vo", vo);
		request.setAttribute("type", type); // 여러 개의 테이블을 한 번에 처리하기 위함
		request.setAttribute("main_jsp", "../goods/goods_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("goods/cart_insert.do")
	public void cart_insert(HttpServletRequest request, HttpServletResponse response) {
		
		String result="";
		
		try {
			String gno=request.getParameter("no");
			String price=request.getParameter("price");
			String count=request.getParameter("count");
			String type=request.getParameter("type");
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			CartVO vo=new CartVO();
			vo.setAmount(Integer.parseInt(count));
			vo.setGno(Integer.parseInt(gno));
			vo.setId(id);
			vo.setPrice(Integer.parseInt(price));
			vo.setType(Integer.parseInt(type));
			GoodsDAO.cartInsert(vo);
			
			result="yes";
		} catch(Exception ex) {
			result="no";
			ex.printStackTrace();
		}
		
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		} catch(Exception ex) {}
		
	}
	
	
	@RequestMapping("goods/cart_buy.do")
	public static void cart_buy(HttpServletRequest request, HttpServletResponse response) {
		
		String result="";
		
		try {
			String gno=request.getParameter("gno");
			String price=request.getParameter("price");
			String count=request.getParameter("count");
			String type=request.getParameter("type");
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			CartVO vo=new CartVO();
			vo.setAmount(Integer.parseInt(count));
			vo.setGno(Integer.parseInt(gno));
			vo.setId(id);
			vo.setPrice(Integer.parseInt(price));
			vo.setType(Integer.parseInt(type));
			GoodsDAO.cartBuyInsert(vo);
			
			result="yes";
		} catch(Exception ex) {
			result="no";
			ex.printStackTrace();
		}
		
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		} catch(Exception ex) {}
		
	}
	
	
	@RequestMapping("goods/cart_cancel.do")
	public String cart_cancel(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		
		// DB 연동
		GoodsDAO.cartDelete(Integer.parseInt(no));
		
		return "redirect:../mypage/mypage_cart.do";
	}
	
	
	@RequestMapping("goods/goods_cart_buy.do")
	public String goods_cart_buy(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		// DB 연동
		GoodsDAO.goodsCartBuy(Integer.parseInt(no)); // 구매가 완료된 상태
		return "redirect:../mypage/mypage_cart.do";
	}
	
}
