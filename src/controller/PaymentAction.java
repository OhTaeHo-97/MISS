package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.product.ProductDAO;
import model.product.ProductSet;
import model.product.ProductVO;

public class PaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ArrayList<Integer> cartData = (ArrayList<Integer>)session.getAttribute("cartData");
		ArrayList<ProductVO> cartVoData = new ArrayList<ProductVO>();
		ProductDAO dao = new ProductDAO();
		Collections.sort(cartData);
		for(int i = 0; i < cartData.size(); i++) {
			ProductVO pvo = new ProductVO();
			pvo.setProduct_id(cartData.get(i));
			ProductSet set = dao.selectOne(pvo);
			ProductVO vo = set.getProduct();
			cartVoData.add(vo);
		}
		
		ArrayList<ProductVO> stockList = new ArrayList<ProductVO>();
		for(ProductVO pvo : cartVoData) {
			if(pvo.getProduct_category().equals("device")) {
				stockList.add(pvo);
			}
		}
		
		ActionForward forward = null;
		if(stockList.size() == 0) {
			request.setAttribute("isPay", true);
			session.removeAttribute("cartData");
			forward = new ActionForward();
			forward.setPath("main.jsp");
			forward.setRedirect(false);
		} else {
			if(dao.stock(stockList)) {
				request.setAttribute("isPay", true);
				session.removeAttribute("cartData");
				forward = new ActionForward();
				forward.setPath("main.jsp");
				forward.setRedirect(false);
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('결제에 실패했습니다!');</script>");
			}
		}
		return forward;
	}

}
