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
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/address_validity.js" type="text/javascript"></script>
</head>
<body>
	<div>
		<a href="./">Home</a> &nbsp;&nbsp;&nbsp;<a href="./MypageView">Mypage</a>
	</div>
	<form action="./AddressUpdate" method="post" id="sign_address">
		<div>
			<input type="hidden" id="num" name="num" value="${addressDTO.num}">
		</div>
		<div>
			<input type="hidden" id="id" name="id" value="${sessionList.id}">
		</div>
		<div>
			배송지 이름 : <input type="text" id="addressname" name="addressname" value="${addressDTO.addressname}">
		</div>
		<div>
			배송지 주소 : <input type="text" id="address" name="address" value="${addressDTO.address}">
		</div>
		<div>
			전화번호 : <input type="text" id="phone" name="phone" value="${addressDTO.phone}">
		</div>
		<div>
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>