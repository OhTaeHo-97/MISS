package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ReviewVO;

public class DeleteReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAO();
		ReviewVO rvo = new ReviewVO();
		rvo.setReview_id(Integer.parseInt(request.getParameter("reviewId")));
		
		ActionForward forward = null;
		if(dao.deleteReview(rvo)) {
			forward = new ActionForward();
			forward.setPath("detail.do?productid=" + request.getParameter("productId"));
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('댓글 삭제 실패!');history.go(-1);</script>");
		}
		return forward;
	}

}
