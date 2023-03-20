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
		<a href="./">Home</a> &nbsp;&nbsp;&nbsp;<a href="./MypageView">Mypage</a>
	</div>
	<c:if test="${empty sessionList}">
		<button onclick="location.href='./MemberLogin'">로그인</button>
		<button onclick="location.href='./MemberInsert'">회원가입</button>
	</c:if>
	<c:if test="${not empty sessionList}">
		<c:if test="${sessionList.id == 'admin'}">
			<button onclick="location.href='./MemberSelect'">회원정보전체 조회</button>
			<button onclick="location.href='./MemberLogOut'">로그아웃</button>
		</c:if>
		<c:if test="${sessionList.id != 'admin'}">
			<button
				onclick="location.href='./MemberSelectDetail?id=${sessionList.id}'">회원정보
				조회</button>
			<button onclick="location.href='./AddressPage'">배송지</button>
			<button onclick="location.href='./CartSelect'">장바구니</button>
			<button onclick="location.href='./MemberLogOut'">로그아웃</button>
		</c:if>
	</c:if>
</body>
</html>