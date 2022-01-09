package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DetailShopAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int product = Integer.parseInt(request.getParameter("product"));
		HttpSession session = request.getSession();
		ArrayList<Integer> datas = (ArrayList<Integer>)session.getAttribute("datas");
		if(datas == null) {
			datas = new ArrayList<Integer>();
			session.setAttribute("datas", datas);
		}
		datas.add(product);
		
		ActionForward forward = new ActionForward();
		forward.setPath("detail.do");
		forward.setRedirect(true);
		return forward;
	}
}
