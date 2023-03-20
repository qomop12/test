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
		//수량, 가격
		$(".plus").click(function() {
			var num = parseInt($("input[class=num]").val());
			var price = parseInt($("input[class=pri]").val());
			var price1 = ${productDTO.price};
			$("input[class=num]").val(num + 1);
			$("input[class=pri]").val(price + price1);
		});
		$(".minus").click(function() {
			var num = parseInt($("input[class=num]").val());
			var price = parseInt($("input[class=pri]").val());
			var price1 = ${productDTO.price};
			if (num > 1) {
				$("input[class=num]").val(num - 1);
				$("input[class=pri]").val(price - price1);
			}
		});
		//장바구니 추가
		$("#cart").click(function() {
			if (confirm("장바구니에 추가하시겠습니까?") == true) {
				$.ajax({
					url : "./CartInsert",
					type : "post",
					data : {
						quantity : $("input[class=num]").val(),
						id : "${sessionList.id}",
						pronum : "${productDTO.pronum}"
					}
				});
				if (confirm("장바구니로 이동하시겠습니까?") == true) {
					location.href = "./CartSelect";
					return false;
				} else {
					location.reload();
					return false;
				}
			} else {
				location.reload();
				return false;
			}
		});
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
					<td>상품 이름</td>
					<td>가격</td>
					<td>판매자</td>
					<td>합계</td>
					<td>수량</td>
					<td></td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${productDTO.productname}</td>
					<td>${productDTO.price}</td>
					<td>${productDTO.id}</td>
					<td><input type="text" class="pri" size="4"
						value="${productDTO.price}" readonly></td>
					<td>
						<div>
							<button type="button" class="plus">+</button>
							<input type="text" value="1" class="num" size="1"
								style="text-align: center;" readonly>
							<button type="button" class="minus">-</button>
						</div>
					</td>
					<td><a href="">상품주문</a></td>
					<td><a href="./CartSelect" id="cart">장바구니에 넣기</a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<c:if
		test="${sessionList.id == productDTO.id || sessionList.id == 'admin'}">
		<div align="center">
			<button onclick="location.href='./ProductUpdate?pronum=${productDTO.pronum}'">상품 수정</button>
			<button onclick="location.href='./ProductDelete?pronum=${productDTO.pronum}'">상품 삭제</button>
		</div>
	</c:if>
</body>
</html>