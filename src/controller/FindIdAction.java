package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.ConsumerVO;
import model.member.MemberDAO;

public class FindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ConsumerVO vo = new ConsumerVO();
		MemberDAO dao = new MemberDAO();
		vo.setPhoneNumber(request.getParameter("phoneNumber"));
		String findId = dao.findId(vo);
		ActionForward forward = new ActionForward();
		request.setAttribute("findId", findId);
		forward.setPath("findIdResult.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
