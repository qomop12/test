<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INTERPARK</title>
</head>
<body>
	<script type="text/javascript">
		alert("${productDTO.productname} 상품이 추가되었습니다.");
		location.href = "./ProductSelect?category=${productDTO.category}";
	</script>
</body>
</html>