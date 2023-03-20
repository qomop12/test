<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		//로그인을 해야만 상품 추가 가능
		$("#insert").click(function() {
			var idVal = $("input[name=id]").val();
			if (idVal == false) {
				alert("로그인 후에 상품을 추가해주세요.")
				return false;
			}
			//유효성 검사
			var name = $("input[name=productname]").val();
			var price = $("input[name=price]").val();
			if (name == false) {
				alert("상품이름을 적어주세요");
				return false;
			}
			if (price == false) {
				alert("상품 가격을 설정해주세요");
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
	<form action="./ProductInsert" method="post">
		<div>
			상품 이름 : <input type="text" id="productname" name="productname">
		</div>
		<div>
			가격 : <input type="text" id="price" name="price">
		</div>
		<div>
			<input type="hidden" id="category" name="category"
				value="${productDTO.category}">
		</div>
		<div>
			<input type="hidden" id="id" name="id" value="${sessionList.id}">
		</div>
		<div>
			<button type="submit" id="insert">등록</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>