package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.ConsumerVO;
import model.member.MemberDAO;

public class FindPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		ConsumerVO vo = new ConsumerVO();
		vo.setMember_id(request.getParameter("member_id"));
		vo.setPhoneNumber(request.getParameter("phoneNumber"));
		ActionForward forward = null;
		if(dao.findPw(vo)) {
			request.setAttribute("member_id", request.getParameter("member_id"));
			forward = new ActionForward();
			forward.setPath("findPwResult.jsp");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력하신 정보와 일치하는 정보가 없습니다.');history.go(-1);</script>");
		}
		
		return forward;
	}

}
