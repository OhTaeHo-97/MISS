package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.ConsumerVO;
import model.member.MemberDAO;
import model.member.MemberVO;

public class DeleteMemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
//		ConsumerVO cvo = (ConsumerVO)session.getAttribute("data");
		MemberVO mvo = new MemberVO();
		mvo.setMember_id(((ConsumerVO)session.getAttribute("data")).getMember_id());
		MemberDAO dao = new MemberDAO();
		
		ActionForward forward = null;
		if(dao.delete(mvo)) {
			session.invalidate();
			request.setAttribute("isDelete", true);
			forward = new ActionForward();
			forward.setPath("main.jsp");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원 탈퇴 실패!');history.go(-1);</script>");
		}
		
		return forward;
	}

}
