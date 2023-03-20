$(function() {
	$.validator.setDefaults({
		 onkeyup : false,
		 onclick : false,
		 onfocusout : false,
		 showErrors : function(errorMap, errorList) {
			 if (this.numberOfInvalids()) { // 에러가 있으면
				 alert(errorList[0].message); // 경고창으로 띄움
			 }
		 }
		});
		$.validator.addMethod("regex", function(value, element, regexpr) {
			return regexpr.test(value);
		});
	$("#sign_member").validate({
		rules : {
			id : {
				required : true,
				minlength : 4,
				regex : /^[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/
			},
			password : {
				required : true,
				minlength : 4
			},
			name : {
				required : true,
				minlength : 2,
				regex : /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/
			},
			email : {
				required : true,
			    regex : /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
			},
			phone : {
				required : true,
				maxlength : 11,
				regex : /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/
			}
		},
		messages : {
			id : {
				required : "아이디를 입력해주세요.",
				minlength : "아이디는 최소 {4} 글자입니다.",
				regex : "공백이나 특수문자를 제거해주세요."
			},
			password : {
				required : "비밀번호를 입력해주세요.",
				minlength : "비밀번호는 최소 {4} 글자입니다."
			},
			name : {
				required : "이름을 입력해주세요.",
				minlength : "이름은 최소 {2} 글자입니다.",
				regex : "이름은 한글만 입력가능합니다."
			},
			email : {
				required : "이메일을 입력해주세요.",
			    regex : "이메일 형식을 확인하세요."
			},
			phone : {
				required : "전화번호를 입력해주세요.",
				maxlength : "전화번호 형식에 맞게 작성해주세요.",
				regex : "전화번호 형식에 맞게 작성해주세요."
			}
		}
	});
});