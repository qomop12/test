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
	<div><a href="./">Home</a>	&nbsp;&nbsp;&nbsp;<a href="./MypageView">Mypage</a></div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>이메일</td>
					<td>전화번호</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${memberDTO.id}</td>
					<td>${memberDTO.password}</td>
					<td>${memberDTO.name}</td>
					<td>${memberDTO.email}</td>
					<td>${memberDTO.phone}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div align="center">
		<button onclick="location.href='./MemberUpdate?id=${memberDTO.id}'">회원 수정</button>
		<button onclick="location.href='./MemberDelete?id=${memberDTO.id}'">회원 탈퇴</button>
	</div>
</body>
</html>