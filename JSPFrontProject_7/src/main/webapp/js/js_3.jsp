<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.container{
		margin-top: 50px;
	}
	.row{
		margin: 0 auto;
		width: 100%;
	}
</style>
<script type="text/javascript">
let price=document.querySelector('#price').getAttribute
let count=document.querySelector('#sel').value;
let total=price*count;

document.querySelector('#rorla').innerHTML=total

/*
 *	이벤트 : 사용자가 태그에 행위를 했을 때 발생
 	- button
 		<input type=button>
 		<input type=image>
 		<input type=submit>
 		<button> => click
 	- select
 		모든 태그에 적용 : mouseover, mouseout
 						mousedown, mouseup, focus
 		입력창 : keyup, keydown
 
 */
</script>
</head>
<body>
	<div class="container">
		<div class="row">
		  <table class="table">
			  <tr>
				  <td width="35%" align="center" rowspan="9">
					  <img src="${vo.goods_poster }" id="image">
				  </td>
				  <td width="65%" align="center">
					  <span id="title">
					   ${vo.goods_name }
					  </span>
				  </td>
			  </tr>
			  <tr>
			  	  <td width="65%">
					  <span id="sub">${vo.goods_sub }</span>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <span id="percent">${vo.goods_discount }%</span>&nbsp;
					  <span id="price" data-price="${vo.price}">${vo.goods_price }</span>
					  <p>
						  <del id="psub">17,900원</del>
					  </p>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <span id="label">첫구매할인가</span>
					  <span id="price2">${vo.goods_first_price }</span>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <span id="star">★★★★★</span>&nbsp;
					  <span id="bold">4.5</span>
					  <span id="count">(299)</span>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <img src="https://recipe1.ezmember.co.kr/img/mobile/icon_delivery3.png">
					  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  <span id="delevery">${vo.goods_delivery }</span>
				  </td>
			  </tr>			  
			  <tr>
			  	  <td width="65%">
						  <option>옵션 선택</option>
						  <option value="1">1개</option>
						  <option value="2">1개</option>
						  <option value="3">2개</option>
						  <option value="4">1개</option>
						  <option value="5">5개</option>
					  </select>
				  </td>
			  </tr>
			  <tr>
			  	<td></td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <input type="button" value="장바구니" id="cart">
					  <input type="button" value="바로구매" id="buy" onclick="requestPay()">
					  <a href="../store/all.do" id="cart">목록</a>
					  <!-- <input type="button" value="목록" id="cart"
					   onclick="javascript:history.back()"> -->
				  </td>
			  </tr>
		  </table>
	  </div>
	</div>
</body>
</html>