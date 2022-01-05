package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ArrayList<Integer> cartData = (ArrayList<Integer>)session.getAttribute("cartData");
		cartData.remove(Integer.valueOf(Integer.parseInt(request.getParameter("deleteId"))));
		
		ActionForward forward = new ActionForward();
		forward.setPath("cartPage.do");
		forward.setRedirect(false);
		return forward;
	}

}
