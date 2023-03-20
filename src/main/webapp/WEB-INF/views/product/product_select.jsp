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
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<td>상품 이름</td>
					<td>가격</td>
					<td>판매자</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<c:if test="${list.category == category}">
						<tr>
							<td><a href="./ProductSelectDetail?pronum=${list.pronum}">${list.productname}</a></td>
							<td>${list.price}</td>
							<td>${list.id}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">
			<button onclick="location.href='./ProductInsert?category=${category}'">상품 추가</button>
		</div>
	</div>
</body>
</html>