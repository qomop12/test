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
<script type="text/javascript">
	// 수정
	// 체크된 라디오박스 num값 넘겨주기
	$(function() {
		$("#update").click(function() {
			if (confirm("정말 수정하시겠습니까?") == true) {
				var numVal = $("input[name=radio]:checked").val();
				location.href = "AddressUpdate?num=" + numVal;
			} else {
				alert("취소 되었습니다.");
				location.reload();
			}
		});
	});
	// 삭제
	$(function() {
		$("#delete").click(function() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				var numVal = $("input[name=radio]:checked").val();
				$.ajax({
					url : "./AddressDelete",
					type : "post",
					data : {
						"num" : numVal
					}
				});
				alert("삭제 되었습니다.");
				location.reload();
			} else {
				alert("취소 되었습니다.");
				location.reload();
			}
		});
	});
</script>
</head>
<body>
	<div>
		<a href="./">Home</a> &nbsp;&nbsp;&nbsp;<a href="./MypageView">Mypage</a>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<td></td>
					<td>배송지 이름</td>
					<td>배송지 주소</td>
					<td>전화번호</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<c:if test="${list.id == sessionList.id}">
						<tr>
							<td><input type="radio" id="radio" name="radio"
								value="${list.num}" checked></td>
							<td>${list.addressname}</td>
							<td>${list.address}</td>
							<td>${list.phone}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<button onclick="location.href='./AddressInsert'">추가</button>
		<button type="button" id="update">수정</button>
		<button type="button" id="delete">삭제</button>
	</div>
</body>
</html>