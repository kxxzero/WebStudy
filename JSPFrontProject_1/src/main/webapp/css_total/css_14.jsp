<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	1. 선택자 => Javascript
	2. 글자 관련
	3. margin / padding / border
	4. background
	5. position
		= fixed
		= relative
		= 배치 => top / bottom / left / right
	6. overflow
	=============================================
	css는 약간 수정할 수 있을 정도만
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin: 0;
	padding: 0;
}
body{
	width: 960px;
	margin: 0 auto;
	overflow: hidden;
}
#nav{
	width: 300px;
	float: left; 
}
#section{
	width: 660px;
	float: right;
}
#nav ul li{
	list-style: none;
}

@media screen and (max-width: 768px){
	body{
		width: auto;
	}
	#nav, #section{
		width: auto;
		float: none;
	}
}
</style>
</head>
<body>
	<div id="nav">
		<ul>
			<li>홈</li>
			<li>뉴스1</li>
			<li>뉴스2</li>
		</ul>
	</div>
	<div id="section">
		여자프로농구 ‘두 지현’의 인기 경쟁이 뜨겁다.
		국가대표 가드 신지현(28·하나원큐)과 박지현(23·우리은행)이 2023~24시즌 최고 스타 자리를 두고 경쟁을 하고 있다. 18일 한국여자농구연맹(WKBL) 올스타 팬 투표 집계 결과(오후 4시 기준)에 따르면 신지현은 2만654표로 가장 많은 표를 얻었다. 2위는 2만567표를 얻은 박지현이다. 둘의 격차는 불과 87표로, 초박빙이다.
		지난 시즌 처음으로 팬 투표 1위를 차지한 신지현은 이번 시즌 인기와 팀 성적 두 마리를 모두 잡으려고 하고 있다. 아직 시즌 초반이지만 분위기는 나쁘지 않다. 13경기에 모두 나가 팀 내 최다인 평균 13.3점을 넣고 3.2리바운드 3.9어시스트를 기록 중이다.
	</div>
</body>
</html>