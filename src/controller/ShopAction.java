package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShopAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String product = request.getParameter("product");
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		ProductVO data = vo.setProductID(product);
		dao.selectOne(vo);
		HttpSession session = request.getSession();
		ArrayList<ProductVO> datas = (ArrayList)session.getAttribute("datas");
		if(datas == null) {
			datas = new ArrayList<ProductVO>();
			session.setAttribute("datas", datas);
		}
		datas.add(data);
		
		ActionForward forward = new ActionForward();
		forward.setPath("main.do");
		forward.setRedirect(true);
		return forward;
	}

}
