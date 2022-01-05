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
	
	const email = document.editForm.email;
	if(email.value != '') {
		const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
		if(!expEmailText.test(email.value)) {
			alert("이메일 형식을 확인하세요!");
			email.focus();
			return false;
		}
	}
	
	const address = document.editForm.address;
	if(address.value == '') {
		alert("주소를 입력하세요.");
		address.focus();
		return false;
	}
	return true;
}