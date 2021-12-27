package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.ConsumerSet;
import model.member.ConsumerVO;
import model.member.MemberDAO;
import model.member.MemberVO;

public class AccountEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		ConsumerSet set = new ConsumerSet();
		ConsumerVO cvo = set.getCvo();
		cvo = new ConsumerVO();
		MemberVO mvo = set.getMvo();
		mvo = new MemberVO();
		
		mvo.setMember_id(request.getParameter("member_id"));
		mvo.setMember_pw(request.getParameter("member_pw"));
		cvo.setAddress(request.getParameter("address"));
		cvo.setEmail(request.getParameter("email"));
		cvo.setMember_id(request.getParameter("member_id"));
		cvo.setNickname(request.getParameter("nickname"));
		cvo.setPhoneNumber(request.getParameter("phone"));
		set.setCvo(cvo);
		set.setMvo(mvo);
		
		ActionForward forward = null;
		if(dao.update(set)) {
			forward = new ActionForward();
			forward.setPath("account_edit_page.mem");
			forward.setRedirect(true);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이전과 동일한 비밀번호는 사용하실 수 없습니다!');history.go(-1);</script>");
		}
		
		return forward;
	}

}
