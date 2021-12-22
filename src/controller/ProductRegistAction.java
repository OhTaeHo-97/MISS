package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		vo.setName(request.getParameter("name"));
		vo.setPrice(request.getParameter("price"));
		vo.setCommenct(request.getParameter("comment"));
		vo.setPictureurl(request.getParameter("url"));
		vo.setCategory(request.getParameter("category"));
		vo.setSinger(request.getParameter("singer"));
		vo.setGenre(request.getParameter("genre"));
		
		dao.insert(vo);
		
		ActionForward forward = new ActionForward();	
		forward.setPath("main.do");
		forward.setRedirect(false);
		return forward;
	}

}
