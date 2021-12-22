package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao = new MemberDAO();
		ConsumerVO vo = new ConsumerVO();
		vo.setMemberID(request.getParameter("member_id"));
		ConsumerVO data = dao.selectOne(vo);
		
		request.setAttribute("data", data);
		
		ActionForward forward = new ActionForward();
		forward.setPath("InformationEdit.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
