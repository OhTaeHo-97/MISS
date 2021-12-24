package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TitleSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		String category = request.getParameter("category");
		vo.setProduct_category(category);
		vo.setProduct_name(request.getParameter("search"));
		ArrayList<ProductVO> datas = dao.searchWord(vo, mcnt);
		
		request.setAttribute("datas", datas);
		request.setAttribute("category", category);
		
		ActionForward forward = new ActionForward();
		forward.setPath("search_page.do");
		forward.setRedirect(false);
		return forward;
	}

}
