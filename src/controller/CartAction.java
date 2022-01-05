package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ArrayList<Integer> cartData = (ArrayList<Integer>)session.getAttribute("cartData");
		if(cartData == null) {
			cartData = new ArrayList<Integer>();
			session.setAttribute("cartData", cartData);
		}
		cartData.add(Integer.parseInt(request.getParameter("productId")));
		System.out.println(cartData);
		
		request.setAttribute("isInsertCart", true);
		ActionForward forward = new ActionForward();
		forward.setPath("detail.do?productid=" + request.getParameter("productId"));
		forward.setRedirect(false);
		return forward;
	}
}