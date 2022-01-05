package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.ConsumerVO;
import model.member.MemberDAO;
import model.member.MemberVO;

public class AccoutEditPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		HttpSession session = request.getSession();
		ConsumerVO vo = (ConsumerVO)session.getAttribute("data");
		mvo.setMember_id(vo.getMember_id());
		ConsumerVO data = dao.detail(mvo);
		request.setAttribute("cvo", data);
		
		ActionForward forward = new ActionForward();
		forward.setPath("accountSetting.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
