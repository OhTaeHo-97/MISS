package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;

public class TitleSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		vo.setProduct_category(request.getParameter("category"));
		vo.setProduct_name(request.getParameter("titleInput"));
		
		String cnt = request.getParameter("search_cnt");
		int mcnt = 6;
		if(cnt != null) {
			mcnt = Integer.parseInt(cnt);
		}
		
		ArrayList<ProductVO> datas = dao.searchWord(vo, mcnt);
		
		request.setAttribute("datas", datas);
		request.setAttribute("device_cnt", mcnt);
		request.setAttribute("search_category", request.getParameter("category"));
		
		ActionForward forward = new ActionForward();
		forward.setPath("search_page.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
