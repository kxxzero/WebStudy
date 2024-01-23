<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
    
<%
	SawonVO vo=new SawonVO();
	vo.setName("홍길동");
	vo.setDept("개발부");
	// ${} => request.session
	request.setAttribute("vo", vo); // JSP로 데이터를 추가해서 전송
	// request에 담을 수 있는 것은 제한이 없음
	session.setAttribute("vo", vo); // 
	SawonVO svo=(SawonVO)request.getAttribute("vo");
		
%>

<%--
	EL(Expression Language)

	$(sessionScope.id}
	
		예)
			session.setAttribute("admin", "1")
				=>
				=>
			request.setAttribute("id","hong");
					============ getParameter()로 받을 수 없음
				=>
				=>
				=>
			?id=admin&pwd=1234
				=> request
				=>
				
			bean => vo
				=> class Sawon
					{
						private int sabun;
						private String name;
						
						=> getter / setter
						   getSabun(), setSabun()
						   getName(), setName()
					}
					
					Sawon vo=new Sawon();
					vo.setSabun(1); => getSabun()
					vo.setName("홍길동"); => getName()
					
					request.setAttribute("vo", vo) => 해당 JSP로 요청값을 전송
						=> Sawon vo=(Sawon)request.getAttribute("vo");
									===================================
									${vo.getName()} => ${vo.name} // 변수가 아닌 메소드 getName()을 호출한 것
									${vo.getSabun()} => ${vo.sabun}
							vo.getName() / vo.getSabun()
			Model => 자바
			===== DAO/VO/... 자바로 코딩하는 모든 파일을 일컫는 말
				========== 1개로 만들 수 있음
				
				*** JSP 단점 : 확장이 불가능하기 때문에 재사용 불가 => 기능 추가 불가
								=> 자바는 상속, 확장이 가능하기 때문에 연동해서 사용
								
			
									
 --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : <%= svo.getName() %><br>
부서 : <%= svo.getDept() %><br>

<h1>EL</h1>
이름 : ${vo.getName() }, ${vo.name }<br>
부서 : ${vo.getDept() }, ${vo.dept }<br>

이름 : ${sessionScope.vo.getName() }, ${sessionScope.vo.name }<br>
부서 : ${sessionScope.vo.getDept() }, ${sessionScope.vo.dept }<br>

</body>
</html>