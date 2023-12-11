<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, com.sist.vo.*"%>
<%@ page import="java.util.*" %>

<%--
 	fs=all&mode=2ss=
 	=> ss!=null => ss=""
 --%>
 
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"/>

<%
	/* request.setCharacterEncoding("UTF-8"); */
	String fs=request.getParameter("fs");
	String ss=request.getParameter("ss");
	String strPage=request.getParameter("page");
	/* System.out.println("ss="+ss); */
	
	if(strPage==null)
	{
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage);
	
	List<FoodVO> list=new ArrayList<FoodVO>();
	int totalpage=0;
	if(ss==null || ss.equals(""))
	{
		fs="all";
	}
	
	if(fs.equals("all"))
	{
		list=dao.foodAllData(curpage);
		totalpage=dao.foodAllTotalPage();
	}
	else
	{
		list=dao.foodFindData(curpage, fs, ss);
		totalpage=dao.foodFindTotalPage(fs, ss);
	}
	final int BLOCK=10;
	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	
	if(endPage>totalpage)
	{
		endPage=totalpage;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
	  <main class="container clear"> 
	    <!-- main body --> 
	    <!-- ################################################################################################ -->
	    <div class="content"> 
	      <!-- ################################################################################################ -->
	      <div id="gallery">
	        <figure>
	          <header class="heading">
	          <!-- post로 전송 시 hidden으로 감춰서 전송해야 함 -->
		        <form method="post" action="../food/food_find.jsp" class="inline">
		         	<select name="fs">
		          		<option value="allf">전체</option>
		          		<option value="name">업체명</option>
		          		<option value="address">주소</option>
		          	</select>
		          	<input type="hidden" name="mode" value="2">
		          	<input type="text" name="ss" size="15">
		          	<button>검색</button>
	          	</form>
	          </header>
	          <ul class="nospace clear">
	          
	          <%
	          	for(int i=0; i<list.size(); i++)
	          	{
	          		FoodVO vo=list.get(i);
	          %>
	          		<li class="one_quarter <%= i%4==0?"first ":""%>"><a href="#"><img src="https://www.menupan.com<%=vo.getPoster() %>" title="<%=vo.getName()%>" %>" alt=""></a></li>
	          <%
	          	}
	          %>
	            
	          </ul>
	          <figcaption>Gallery Description Goes Here</figcaption>
	        </figure>
	      </div>
	      <!-- ################################################################################################ --> 
	      <!-- ################################################################################################ -->
	      <nav class="pagination">
	        <ul>
	          <li><a href="#">&laquo; Previous</a></li>
	          <li><a href="#">1</a></li>
	          <li><a href="#">2</a></li>
	          <li><strong>&hellip;</strong></li>
	          <li><a href="#">6</a></li>
	          <%
	          	for(int i=startPage; i<=endPage; i++)
	          	{
	          %>
	          		<li class="current"><strong>7</strong></li>
	          <%
	          	}
	          %>
	          
	          
	          <li><a href="#">8</a></li>
	          <li><a href="#">9</a></li>
	          <li><strong>&hellip;</strong></li>
	          <li><a href="#">14</a></li>
	          <li><a href="#">15</a></li>
	          <li><a href="../main/main.jsp?mode=2&">Next &raquo;</a></li>
	        </ul>
	        
	      </nav>
	      <!-- ################################################################################################ --> 
	    </div>
	    <!-- ################################################################################################ --> 
	    <!-- / main body -->
	    <div class="clear"></div>
	  </main>
	</div>
</body>
</html>