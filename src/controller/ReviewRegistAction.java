package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ReviewVO;

public class ReviewRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAO();
		ReviewVO rvo = new ReviewVO();
		rvo.setProduct_id(Integer.parseInt(request.getParameter("productId")));
		rvo.setNickname(request.getParameter("userNickname"));
		rvo.setReview_content(request.getParameter("replyContent"));
		
		ActionForward forward = null;
		if(dao.insertReview(rvo)) {
			forward = new ActionForward();
			forward.setPath("detail.do?productid=" + request.getParameter("productId"));
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('댓글 등록 실패!');history.go(-1);</script>");
		}
		
		return forward;
	}

}
