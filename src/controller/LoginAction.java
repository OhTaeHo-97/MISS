package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.AdminVO;
import model.member.ConsumerSet;
import model.member.MemberDAO;
import model.member.MemberVO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		String right = request.getParameter("right");
		ActionForward forward = null;
		
		System.out.println(request.getParameter("member_id"));
		System.out.println(request.getParameter("member_pw"));
		
		if(right.equals("admin")) {
			vo.setMember_id(request.getParameter("member_id"));
			vo.setMember_pw(request.getParameter("member_pw"));
			
			MemberVO mvo = dao.adminLogin(vo);
			if(mvo == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
			} else {
				HttpSession session = request.getSession();
				AdminVO data = new AdminVO();
				data.setMember_id(mvo.getMember_id());
				session.setAttribute("data", data);
				session.setAttribute("auth", mvo.getAuth());
				forward = new ActionForward();
				forward.setPath("main.jsp");
				forward.setRedirect(false);
			}
		} else if(right.equals("user")) {
			vo.setMember_id(request.getParameter("member_id"));
			vo.setMember_pw(request.getParameter("member_pw"));
			
			ConsumerSet data = dao.consumerLogin(vo);
			if(data == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("data", data.getCvo());
				session.setAttribute("auth", data.getMvo().getAuth());
				forward = new ActionForward();
				forward.setPath("main.jsp");
				forward.setRedirect(false);
			}
		} else {
			System.out.println("잘못된 인자 전달");
		}
		
//		System.out.println(request.getParameter("member_id"));
//		System.out.println(request.getParameter("member_pw"));
//		vo.setMember_id(request.getParameter("member_id"));
//		vo.setMember_pw(request.getParameter("member_pw"));
//		
//		ActionForward forward = null;
//		ConsumerSet data = dao.consumerLogin(vo);
//		if(data == null) {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
//		} else {
//			HttpSession session = request.getSession();
//			session.setAttribute("data", data.getCvo());
//			session.setAttribute("auth", data.getMvo().getAuth());
//			forward = new ActionForward();
//			forward.setPath("main.jsp");
//			forward.setRedirect(false);
//		}
		return forward;
	}
	
}
