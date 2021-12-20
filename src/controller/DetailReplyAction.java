package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAO();
		ReviewVO vo = new ReviewVO();
		
		vo.setProductID(request.getParameter("product_id"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setReviewContent(request.getParameter("review_content"));
		
		dao.insert(vo);
		
		ActionForward forward = new ActionForward();
		forward.setPath("product.do");
		forward.setRedirect(false);
		
		return null;
	}

}
