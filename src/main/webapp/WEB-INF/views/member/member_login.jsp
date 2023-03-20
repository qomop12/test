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
<script type="text/javascript">
	$(function() {
		$("#loginCheck").click(function() {
			var idVal = $("input[name=id]").val();
			var passVal = $("input[name=password]").val();
			//유효성
			if (idVal == false || passVal == false) {
				alert("아이디 또는 비밀번호를 입력하세요");
				return false;
			}
			//로그인 검사
			$.ajax({
				url : "./MemberLogin",
				type : "post",
				data : {
					"id" : idVal,
					"password" : passVal
				},
				success : function(check) {
					if (check == "Yes") {
						location.href = "./";
					}
					if (check == "No") {
						alert("아이디 또는 비밀번호를 잘못 입력했습니다.");
						location.reload();
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<div>
		<a href="./">Home</a>
	</div>
	<div>
		<form action="./MemberLogin" method="post">
			<div>
				아이디 : <input type="text" id="id" name="id">
			</div>
			<div>
				비밀번호 : <input type="password" id="password" name="password">
			</div>
			<button type="submit" id="loginCheck">로그인</button>
		</form>
	</div>
</body>
</html>