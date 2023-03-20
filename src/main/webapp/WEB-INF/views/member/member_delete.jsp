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
		<a href="./">Home</a>&nbsp;&nbsp;&nbsp;<a href="./MypageView">Mypage</a>
	</div>
	<form action="./MemberDelete" method="post">
		<div>
		아이디 : <input type="text" id="id" name="id" value="${memberDTO.id}" readonly>
		</div>
		<div>
		<input type="hidden" id="adminCheck" name="adminCheck" value="${sessionList.id}">
		</div>
		<div>
			<button type="submit">탈퇴</button>
		</div>
	</form>
</body>
</html>