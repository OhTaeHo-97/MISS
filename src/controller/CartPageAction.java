package controller;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.product.ProductDAO;
import model.product.ProductSet;
import model.product.ProductVO;

public class CartPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ArrayList<Integer> cartData = (ArrayList<Integer>)session.getAttribute("cartData");
		ArrayList<ProductVO> cartVoData = null;
		if(cartData != null) {
			cartVoData = new ArrayList<ProductVO>();
			ProductDAO dao = new ProductDAO();
			Collections.sort(cartData);
			for(int i = 0; i < cartData.size(); i++) {
				ProductVO pvo = new ProductVO();
				pvo.setProduct_id(cartData.get(i));
				ProductSet set = dao.selectOne(pvo);
				ProductVO vo = set.getProduct();
				cartVoData.add(vo);
			}
			request.setAttribute("pvoData", cartVoData);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("cart.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
