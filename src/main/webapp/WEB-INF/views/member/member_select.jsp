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
</head>
<body>
	<div>
		<a href="./">Home</a> &nbsp;&nbsp;&nbsp;<a href="./MypageView">Mypage</a>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>이메일</td>
					<td>전화번호</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.id}</td>
						<td>${list.password}</td>
						<td>${list.name}</td>
						<td>${list.email}</td>
						<td>${list.phone}</td>
						<td><a href="./MemberSelectDetail?id=${list.id}">회원 상세조회</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	<div align="center">
		<ul>
			<c:if test="${pageMaker.prev}">
				<a href="MemberSelect${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<a href="MemberSelect${pageMaker.makeQuery(idx)}">${idx}</a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="MemberSelect${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
			</c:if>
		</ul>
	</div>
</body>
</html>