package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;

public class FavAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stubW
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		vo.setProduct_id(Integer.parseInt(request.getParameter("productId")));
		
		if(dao.clickFav(vo)) {
			System.out.println("FavAction update 성공!");
		} else {
			System.out.println("FavAction update 실패!");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("detail.do?productid=" + request.getParameter("productId"));
		forward.setRedirect(false);
		return forward;
	}
}
