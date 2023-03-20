<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INTERPARK</title>
<link rel="stylesheet" type="text/css"
	href="./css/bootstrap.min_4.5.0.css">
</head>
<body>
	<div>
		<a href="./">Home</a> &nbsp;&nbsp;&nbsp;<a href="./MypageView">Mypage</a>
	</div>
	<form action="./ProductDelete" method="post">
		<div>
			상품 이름 : <input type="text" id="productname" name="productname"
				value="${productDTO.productname}" readonly>
		</div>
		<div>
			<input type="hidden" id="pronum" name="pronum"
				value="${productDTO.pronum}">
		</div>
		<div>
			<input type="hidden" id="category" name="category"
				value="${productDTO.category}">
		</div>
		<div>
			<button type="submit">삭제</button>
		</div>
	</form>
</body>
</html>