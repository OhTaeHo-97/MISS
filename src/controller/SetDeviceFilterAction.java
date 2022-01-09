package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SetDeviceFilterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("filter", "fav");
		
		ActionForward forward = new ActionForward();
		forward.setPath("main_device.do");
		forward.setRedirect(false);
		return forward;
	}

}
