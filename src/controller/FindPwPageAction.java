package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindPwPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setAttribute("result_id", request.getParameter("result_id"));
		ActionForward forward = new ActionForward();
		forward.setPath("findPw.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
