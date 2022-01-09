/**
 * 
 */

function newPwWrite() {
	const member_pw = document.newPwForm.member_pw;
	const confirm_pw = document.newPwForm.member_pw_confirm;
	if(member_pw.value == '') {
		alert("비밀번호를 입력하세요.");
		member_pw.focus();
		return false;
	}
	if(confirm_pw.value == '') {
		alert("비밀번호 확인을 입력하세요.");
		confirm_pw.focus();
		return false;
	}
	if(member_pw.value != confirm_pw.value) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		member_pw.focus();
		return false;
	}
	return true;
}