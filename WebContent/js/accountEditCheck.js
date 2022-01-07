/**
 * 
 */

const edit_check = function() {
	const member_pw = document.editForm.member_pw;
	const confirm_pw = document.editForm.confirm_pw;
	if(member_pw.value != confirm_pw.value) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		member_pw.focus();
		return false;
	}
	
	const phone = document.editForm.phone;
	if(phone.value == '') {
		alert("전화번호를 입력하세요.");
		phone.focus();
		return false;
	}
	if(phone.value.length > 11 || phone.value.length < 10) {
		alert("잘못된 전화번호입니다.");
		phone.focus();
		return false;
	}
	if(phone.value.includes('-')) {
		alert("-를 제외하고 입력하세요.");
		phone.focus();
		return false;
	}
	
	const nickname = document.editForm.nickname;
	const checkNickname = document.getElementById("checkNickname");
	if(nickname.value == '') {
		alert("닉네임을 입력하세요.");
		nickname.focus();
		return false;
	}
	if(checkNickname.innerText == '사용할 수 없는 닉네임입니다.') {
		alert("닉네임을 확인하세요.");
		nickname.focus();
		return false;
	}
	if(checkNickname.innerText == '') {
		alert("닉네임을 확인하세요.");
		nickname.focus();
		return false;
	}
	
	const email = document.editForm.email;
	if(email.value != '') {
		const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
		if(!expEmailText.test(email.value)) {
			alert("이메일 형식을 확인하세요!");
			email.focus();
			return false;
		}
	}
	
	const sample6_postcode = document.getElementById("sample6_postcode");
	if(sample6_postcode.value == '') {
		alert("우편번호 및 주소를 입력하세요.");
		sample6_postcode.focus();
		return false;
	}
	
	const sample6_detailAddress = document.getElementById("sample6_detailAddress");
	if(sample6_detailAddress.value == '') {
		alert("상세주소를 입력하세요.");
		sample6_detailAddress.focus();
		return false;
	}
	return true;
}