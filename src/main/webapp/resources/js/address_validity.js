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
	$("#sign_address").validate({
		rules : {
			addressname : {
				required : true
			},
			address : {
				required : true
			},
			phone : {
				required : true,
				regex : /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/,
				maxlength : 11
			}
		},
		messages : {
			addressname : {
				required : "배송지 이름을 입력해주세요."
			},
			address : {
				required : "배송지를 입력해주세요."
			},
			phone : {
				required : "전화번호를 입력해주세요.",
				regex : "전화번호 형식에 맞게 작성해주세요.",
				maxlength : "전화번호 형식에 맞게 작성해주세요."
			}
		}
	});
});