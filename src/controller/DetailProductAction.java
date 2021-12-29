package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductSet;
import model.product.ProductVO;

public class DetailProductAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		vo.setProduct_id(Integer.parseInt(request.getParameter("productid")));
		
		ProductSet data = dao.selectOne(vo);
		request.setAttribute("product", data.getProduct());
		request.setAttribute("replies", data.getReviewdata());
		
		ActionForward forward = new ActionForward();
		forward.setPath("product.jsp");
		forward.setRedirect(false);
		return forward;
	}
}