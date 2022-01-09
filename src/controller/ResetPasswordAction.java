package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.ConsumerSet;
import model.member.ConsumerVO;
import model.member.MemberDAO;
import model.member.MemberVO;

public class ResetPasswordAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		mvo.setMember_id(request.getParameter("member_id"));
		ConsumerVO cvo = dao.detail(mvo);
		mvo.setMember_pw(request.getParameter("member_pw"));
		ConsumerSet set = new ConsumerSet();
		set.setCvo(cvo);
		set.setMvo(mvo);
		
		ActionForward forward = null;
		if(dao.update(set)) {
			request.setAttribute("resetPassword", true);
			forward = new ActionForward();
			forward.setPath("main.jsp");
			forward.setRedirect(false);
		} else {
			request.setAttribute("resetPassword", false);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이전 비밀번호와 같은 비밀번호로는 변경할 수 없습니다.');history.go(-1);</script>");
		}
		
		return forward;
	}

}
