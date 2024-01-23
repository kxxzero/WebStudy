<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios"></script>
</head>
<body>
	<div class="app">
		<table border=1 bordercolor=black>
			<thead>
				<tr>
					<td>이름</td>
					<td>나이</td>
					<td>주소</td>
				</tr>
			</thead>
			<tbody>
				<tr v-for="vo in msg">
					<td>{{vo.name}}</td>
					<td>{{vo.age}}</td>
					<td>{{vo.addr}}</td>
			</tbody>
		</table>
		<br>
		<input type="text" size=20 v-model="msg">
	</div>
<script>
	const App={
		data(){
			return {
				msg:[
					{"name":"홍길동1", age:20, "addr":"서울"}
					{"name":"홍길동2", age:20, "addr":"서울"}
					{"name":"홍길동3", age:20, "addr":"서울"}
					{"name":"홍길동4", age:20, "addr":"서울"}
				]
			}
		},
		mounted(){
			axios.get(../food/list)
		}
	}
	Vue.createApp(App).mount('.app') // mount : (가상)메모리에 올리는 것
</script>
</body>
</html>