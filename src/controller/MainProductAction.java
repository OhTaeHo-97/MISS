package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainProductAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String cnt = request.getParameter("cnt");
		int mcnt = 3;
		if(cnt != null) {
			mcnt = Integer.parseInt(cnt);
		}
		
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductVO> datas = dao.selectAll(request.getParameter("type"), mcnt);
		request.setAttribute("datas", datas);
		
		ActionForward forward = new ActionForward();
		forward.setPath("main_product.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
