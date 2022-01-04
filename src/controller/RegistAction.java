package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.ConsumerSet;
import model.member.ConsumerVO;
import model.member.MemberDAO;
import model.member.MemberVO;

public class RegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		ConsumerSet set = new ConsumerSet();
		System.out.println(request.getParameter("member_id"));
		System.out.println(request.getParameter("member_pw"));
		
		MemberVO mvo = set.getMvo();
		mvo = new MemberVO();
		ConsumerVO cvo = set.getCvo();
		cvo = new ConsumerVO();
		
		mvo.setMember_id(request.getParameter("member_id"));
		mvo.setMember_pw(request.getParameter("member_pw"));
		cvo.setMember_id(request.getParameter("member_id"));
		cvo.setNickname(request.getParameter("nickname"));
		cvo.setAddress(request.getParameter("address"));
		cvo.setPhoneNumber(request.getParameter("phone"));
		cvo.setEmail(request.getParameter("email"));
		
		set.setMvo(mvo);
		set.setCvo(cvo);
		
		System.out.println(set.getMvo());
		
		ActionForward forward = null;
		if(dao.insert(set)) {
			request.setAttribute("isRegister", true);
			forward = new ActionForward();
			forward.setPath("main.jsp");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입 실패!');history.go(-1);</script>");
		}
		
		return forward;
	}
	
}
