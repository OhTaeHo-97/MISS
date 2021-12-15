<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.member.UserVO"%>

<jsp:useBean id = "udao" class = "model.member.UserSet" />
<jsp:useBean id = "mvo" class = "model.member.MemberVO" />
<%
	// 로그인
	String action = request.getParameter("action");
	if(action.equals("login")) {
		UserVO customer = udao.selectOne(vo);
		if(customer != null) {
			session.setAttribute("customer", customer);
		} else {
			out.println("<script>alert('로그인에 실패하였습니다. 아이디와 비밀번호를 다시 확인해주세요.');</script>");
		}
	} else if(action.equals("id_redundancy")) {
		
	} else if(action.equals("register")) {
		
	}
%>