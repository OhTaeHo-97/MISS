package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailFavAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		
		if(dao.clickFav(vo)) {
			System.out.println("FavAction update 성공!");
		} else {
			System.out.println("FavAction update 실패!");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("detail.do");
		forward.setRedirect(true);
		return forward;
	}

}
