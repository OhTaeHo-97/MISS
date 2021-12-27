package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.ConsumerSet;
import model.member.MemberDAO;
import model.member.MemberVO;

public class AccountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		System.out.println(request.getParameter("member_id"));
		System.out.println(request.getParameter("member_pw"));
		
		
		vo.setMember_id(request.getParameter("member_id"));
		vo.setMember_pw(request.getParameter("member_pw"));
		
		ActionForward forward = new ActionForward();
		ConsumerSet data = dao.consumerLogin(vo);
		if(data == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 잘못되었습니다!');history.go(-1);</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("account_edit_page.mem");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
