package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAO();
		ReviewVO vo = new ReviewVO();
		
		vo.setProduct_id(request.getParameter("product_id"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setReview_content(request.getParameter("review_content"));
		
		if(dao.insertReview(vo)) {
			System.out.println("댓글 등록 완료");
		} else {
			System.out.println("댓글 등록 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("product.do");
		forward.setRedirect(false);
		return forward;
	}

}
