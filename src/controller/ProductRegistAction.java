package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;

public class ProductRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();
		System.out.println(request.getParameter("image"));
		System.out.println(request.getServletContext().getRealPath("upload"));
		System.out.println(request.getParameter("comment"));
		
		vo.setMusic_genre(request.getParameter("genre"));
		vo.setMusic_singer(request.getParameter("singer"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setProduct_category(request.getParameter("category"));
		vo.setProduct_comment(request.getParameter("comment"));
		vo.setProduct_name(request.getParameter("pname"));
		vo.setProduct_pictureurl(request.getParameter("image"));
		vo.setStock(Integer.parseInt(request.getParameter("stock")));
		
		ActionForward forward = null;
		if(dao.insertProduct(vo)) {
			request.setAttribute("isRegistProduct", true);
			forward = new ActionForward();
			forward.setPath("main.jsp");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('제품 등록 실패!');history.go(-1);</script>");
		}
		return forward;
	}

}