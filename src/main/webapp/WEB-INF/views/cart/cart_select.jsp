<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INTERPARK</title>
<link rel="stylesheet" type="text/css"
	href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		// 수량, 가격
		// .plus에 컨트롤러 에서 가져온 value를 넣고 수량을 .plus의 value와 같은 공간의 값을 가져온다.
		// +,-버튼에 배열과 같이 ${plus = plus + 1}로 0부터 시작하는 값을 넣고 브라우저에 출력되는 상품들만 값이 들어가도록 했다.
		// 컨트롤러에서는 -2값을 보내지만 ${plus}로 받고나면 값이 -1이 되어있는 이유를 모르겠다.
		// ${plus}와 다르게 ${minus}는 정상적으로 값을 받는다.
		$(".plus").click(
				function() {
					var num = $("input[class=num]");					//수량
					var price = $("input[class=pri]");						//가격
					var sum = $("input[class=sum]");						//합계
					var idx = $(this).val();										//+를 누른 값
					num[idx].value = parseInt(num[idx].value) + 1;	//[idx]를 넣어 idx의 값과 같은 배열을 찾아간다.
					sum[idx].value = parseInt(sum[idx].value) + parseInt(price[idx].value);
					// 		for (var i = 0; i < num.length; i++) {					
					// 			if (num[i] == num[idx]) {							//num에 num[idx]를 넣어주면 idx의 값과 같은 공간을 찾아간다.
					// 				num[i].value = parseInt(num[i].value) + 1
					// 			}
					// 		}
					var cartnum = $("input[id=checkbox]");
					$.ajax({
						url : "./CartUpdate",
						type : "post",
						data : {
							cartnum : cartnum[idx].value,
							quantity : num[idx].value
						}
					});
				});
		$(".minus").click(
				function() {
					var num = $("input[class=num]");
					var price = $("input[class=pri]");
					var sum = $("input[class=sum]");
					var idx = $(this).val();
					var cartnum = $("input[id=checkbox]");
					if (num[idx].value > 1) {
						num[idx].value = parseInt(num[idx].value) - 1;
						sum[idx].value = parseInt(sum[idx].value) - parseInt(price[idx].value);
					}
					$.ajax({
						url : "./CartUpdate",
						type : "post",
						data : {
							cartnum : cartnum[idx].value,
							quantity : num[idx].value
						}
					});
				});
	});
	$(function() {
		// 장바구니 삭제
		// 배열을 생성하고 for문을 사용해 체크된 값들을 배열에 추가시켜준다.
		// 추가된 배열을 for문을 통해 하나씩 삭제해준다.
		$("#delete").click(function() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				var arr = new Array();
				var check = $("input[id=checkbox]");
				for (var i = 0; i < check.length; i++) {
					if (check[i].checked) {
						arr.push(check[i].value);
					}
				}
				for (var i = 0; i < arr.length; i++) {
					alert(arr[i]);
					$.ajax({
						url : "./CartDelete",
						type : "post",
						data : {
							cartnum : arr[i]
						}
					});
				}
				location.reload();
			}
		})
	});
</script>
</head>
<body>
	<div>
		<a href="./">Home</a> &nbsp;&nbsp;&nbsp;<a href="./MypageView">Mypage</a>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<td></td>
					<td>상품 이름</td>
					<td>가격</td>
					<td>수량</td>
					<td>합계</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cartList" items="${cartList}">
					<c:forEach var="productList" items="${productList}">
						<c:if
							test="${cartList.id == sessionList.id and productList.pronum == cartList.pronum}">
							<tr>
								<td><input type="checkbox" id="checkbox"
									value="${cartList.cartnum}"></td>
								<td>${productList.productname}</td>
								<td><input type="text" class="pri" size="4"
									value="${productList.price}" readonly></td>
								<td>
									<div>
										<button type="button" class="plus" value="${plus = plus + 1}">+</button>
										<input type="text" value="${cartList.quantity}" class="num"
											size="1" style="text-align: center;" readonly>
										<button type="button" class="minus"
											value="${minus = minus + 1}">-</button>
									</div>
								</td>
								<td><input type="text" class="sum" size="4"
									value="${productList.price * cartList.quantity}" readonly>
								<td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
		<a href="">상품주문</a>
		<button type="button" id="delete">삭제</button>
	</div>
</body>
</html>