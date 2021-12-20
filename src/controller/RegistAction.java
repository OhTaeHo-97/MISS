package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		CustomerSet set = new CustomerSet();
		set.getMemberVO().setMemberID(request.getParameter("id"));
		set.getMemberVO().setMemberID(request.getParameter("pw"));
		set.getCustomerVO().setMemberID(request.getParameter("id"));
		set.getCustomerVO().setMemberID(request.getParameter("nickname"));
		set.getCustomerVO().setMemberID(request.getParameter("address"));
		set.getCustomerVO().setMemberID(request.getParameter("phoneNumber"));
		set.getCustomerVO().setMemberID(request.getParameter("email"));
		
		ActionForward forward = null;
		if(dao.insert(set)) {
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입 실패!');history.go(-1);</script>");
		}
		
		return forward;
	}
	
}
