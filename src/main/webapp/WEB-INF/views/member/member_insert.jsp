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
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/member_validity.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		//아이디 중복 검사
		$("#idCheck").click(function() {
			var idVal = $("input[name=id]").val();
			var inesrt = $("button[id=insert]").val();
			$.ajax({
				url : "./MemberIdCheck",
				type : "post",
				data : {
					"id" : idVal
				},
				success : function(idCheck) {
					$("button[id=insert]").val(idCheck);
					if (idCheck == "Yes") {
						alert("사용 가능한 아이디입니다.");
					}
					if (idCheck == "No") {
						alert("중복된 아이디입니다.");
					}
				}
			});
		});
		// 즁복검사 유효성
		$("#insert").click(function() {
			var check = $("button[id=insert]").val();
			if (check == false || check == "No") {
				alert("중복 검사를 해주세요.");
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div>
		<a href="./">Home</a>
	</div>
	<form action="./MemberInsert" method="post" id="sign_member">
		<div>
			아이디 : <input type="text" id="id" name="id">
			<button type="button" id="idCheck" name="idCheck">중복 체크</button>
		</div>
		<div>
			비밀번호 : <input type="password" id="password" name="password">
		</div>
		<div>
			이름 : <input type="text" id="name" name="name">
		</div>
		<div>
			이메일 : <input type="email" id="email" name="email">
		</div>
		<div>
			전화번호 : <input type="text" id="phone" name="phone" placeholder="-제외">
		</div>
		<div>
			<button type="submit" id="insert">가입</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>