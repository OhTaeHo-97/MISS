package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FavFilterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		String category = request.getParameter("category");
		vo.setProduct_category(category);
		ArrayList<ProductVO> datas = dao.searchFavoriteCnt(vo, mcnt);
		
		request.setAttribute("datas", datas);
		
		ActionForward forward = null;
		if(category.equals("music")) {
			forward = new ActionForward();
			forward.setPath("music.do");
			forward.setRedirect(false);		
		} else if(category.equals("device")) {
			forward = new ActionForward();
			forward.setPath("device.do");
			forward.setRedirect(false);		
		} else {
			System.out.println("잘못된 파라미터 전달");
		}
		return forward;
	}

}
