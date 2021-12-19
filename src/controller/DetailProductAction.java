package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailProductAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		vo.setProductID(request.getParameter("product"));
		
		
		ActionForward forward = new ActionForward();
		
		return null;
	}
}
