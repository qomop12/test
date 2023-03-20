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
<script src="./js/member_validity.js" type="text/javascript"></script>
</head>
<body>
	<div>
		<a href="./">Home</a> &nbsp;&nbsp;&nbsp;<a href="./MypageView">Mypage</a>
	</div>
	<form action="./MemberUpdate" method="post" id="sign_member">
		<div>
			아이디 : <input type="text" id="id" name="id" value="${memberDTO.id}"
				readonly>
		</div>
		<div>
			비밀번호 : <input type="password" id="password" name="password">
		</div>
		<div>
			이름 : <input type="text" id="name" name="name">
		</div>
		<div>
			이메일 : <input type="email" id="email" name="email">
		</div>
		<div>
			전화번호 : <input type="text" id="phone" name="phone" placeholder="-제외">
		</div>
		<div>
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>