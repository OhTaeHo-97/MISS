package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setMember_ID(request.getParameter("member_id"));
		vo.setMember_PW(request.getParameter("member_pw"));
		
		ActionForward forward = null;
		UserVO data = dao.selectOne(vo);
		if(data == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("data", data);
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(false);
		}
		return forward;
	}
	
}
