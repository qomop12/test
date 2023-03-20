<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INTERPARK</title>
<!-- <c:forEach var="list" items="${list}">
	<c:if test="${list.id == memberDTO.id}">
			<script type="text/javascript">
				alert("입력하신 ${memberDTO.id} 아이디가 이미 존재합니다.")
				location.href = "./MemberInsert";
			</script>
	</c:if>
</c:forEach> -->
</head>
<body>
	<script type="text/javascript">
		alert("입력하신 ${memberDTO.id} 아이디로 가입되었습니다.")
		location.href = "./";
	</script>
</body>
</html>