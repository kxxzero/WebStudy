<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, com.sist.vo.*"%>
    
<%
/* 	session.setAttribute("id", "hong"); */
	// 1. session에 등록이 되었는지 여부
	String id=(String)session.getAttribute("id");
	String name=(String)session.getAttribute("name");
	String admin=(String)session.getAttribute("admin");
	/* admin="n"; */
/*
	session
		클래스 : HttpSession => 생성 : request.getSession()
			=> 내장 객체 사용 가능
			=> 서버에 저장 => 데이터 노출이 없음(보안이 뛰어남)
			=> 주요 기능 => 데이터 일부 정보를 저장
			
			=> 주요 메소드
				*** 1. 저장 : setAttribute("키", "값");
					=> 키 : String
					=> 값 : Object => 장바구니 => List
				*** 2. 읽기 : getAttribute("키");
					=> 리턴형 : Object getAttribute("키");
						=> 형변환에 주력
				3. 저장 기간 설정 : setMaxinactionInterval("초 단위")
					=> 기본(default) : 1800초(30분)
				*** 4. 삭제
					=> 일부 삭제 : removeAttribute(키) => 장바구니 취소
					=> 전체 삭제 : invalidate() => 로그아웃
				5. session은 브라우저 당 1개만 매정(접속자) => 누구의 session인지 구분하는 session id 필요 => getId()
																							========== 채팅
				6. 처음 저장인지 여부 확인 : isNew()
				7. Map 형식으로 되어있음
				======== 키, 값 => 중복 불가
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <div id="logo" class="fl_left">
      <h1><a href="../main/main.jsp">Food & Recipe & Travel</a></h1>
    </div>
    <div class="fl_right">
      <ul class="inline">
      
      <%
      	if(id==null)
      	{
      %>
      		<form method=post action="../member/login.jsp" class="inline">
	  	      <li>ID: <input type=text name=id style="width:100px"></li>
	  	      <li>PW: <input type=password name=pwd style="width:100px"></li>
	  	      <li><input type=submit value=로그인></li>
	          </form>
	  <%
      	}
      	else
      	{
      %>
      		<form method=post action="../member/logout.jsp" class="inline">
	  	      <li><%=name %>(<%=admin.equals("y")?"관리자":"일반 사용자" %>)님 로그인 되었습니다.</li>
	  	      <li><input type=submit value=로그아웃></li>
	        </form>
	  <%
      	}
      %>
      </ul>
    </div>
   </header>
</div>
<div class="wrapper row2">
  <nav id="mainav" class="clear"> 
    <ul class="clear">
      <li class="active"><a href="../main/main.jsp">홈</a></li>
      <li><a class="drop" href="#">회원</a>
      	<%
      		if(id==null)
      		{	
      	%>
	      		<ul>
		          <li><a href="pages/gallery.html">회원가입</a></li>
		          <li><a href="pages/full-width.html">아이디 찾기</a></li>
		          <li><a href="pages/sidebar-left.html">비밀번호 찾기</a></li>
		        </ul>
      	<%
      		}
      		else
      		{
      	%>
      			<ul>
		          <li><a href="pages/gallery.html">회원 수정</a></li>
		          <li><a href="pages/full-width.html">회원 탈퇴</a></li>
		        </ul>
      	<%
        	}
      	%>
      </li>
      <li><a class="drop" href="#">맛집</a>
        <ul>
          <li><a href="../main/main.jsp?mode=2">맛집 검색</a></li>
          <li><a href="pages/full-width.html">맛집 예약</a></li>
          <li><a href="pages/full-width.html">맛집 추천</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">레시피</a>
        <ul>
          <li><a href="pages/gallery.html">레시피</a></li>
          <li><a href="pages/full-width.html">쉐프</a></li>
          <li><a href="pages/sidebar-left.html">레시피 만들기</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">서울 여행</a>
        <ul>
          <li><a href="pages/gallery.html">명소</a></li>
          <li><a href="pages/full-width.html">자연 & 관광</a></li>
          <li><a href="pages/sidebar-left.html">쇼핑</a></li>
          <li><a href="pages/sidebar-left.html">호텔</a></li>
          <li><a href="pages/sidebar-left.html">날씨</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">커뮤니티</a>
        <ul>
          <li><a href="pages/gallery.html">자유게시판</a></li>
          <li><a href="pages/full-width.html">공지사항</a></li>
          <li><a href="pages/sidebar-left.html">묻고답하기</a></li>
        </ul>
      </li>
      <li><a href="#">스토어</a></li>
      <%
      	if(id!=null && admin.equals("y")) // 로그인이 된 경우
      	{
      %>
      		<li><a href="#">관리자페이지</a></li>
      <%
      	}
      	if(id!=null && admin.equals("n"))
      	{
      %>
      		<li><a href="#">마이페이지</a></li>
      <%
      	}
      %>
    </ul>
    </nav>
</div>
</body>
</html>