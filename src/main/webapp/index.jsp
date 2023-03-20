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
</head>
<body>
	<div>
		<a href="./">Home</a>
	</div>
	<div>
		<div align="right">
			<c:if test="${empty sessionList}">
				<button onclick="location.href='./MemberLogin'">로그인</button>
				<button onclick="location.href='./MemberInsert'">회원가입</button>
			</c:if>
			<c:if test="${not empty sessionList}">
				<div>${sessionList.name}님환영합니다.</div>
				<button onclick="location.href='./MemberLogOut'">로그아웃</button>
				<button onclick="location.href='./MemberInsert'">회원가입</button>
				<button onclick="location.href='./MypageView'">마이페이지</button>
			</c:if>
		</div>
	</div>
	<div>
		<details>
			<summary>상품</summary>
			<div>
				<a href="./ProductSelect?category=상의">상의</a>
			</div>
			<div>
				<a href="./ProductSelect?category=하의">하의</a>
			</div>
			<div>
				<a href="./ProductSelect?category=신발">신발</a>
			</div>
			<div>
				<a href="./ProductSelect?category=악세사리">악세사리</a>
			</div>
		</details>
	</div>
</body>
</html>