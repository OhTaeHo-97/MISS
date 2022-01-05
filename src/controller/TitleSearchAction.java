package controller;

import java.io.PrintWriter;
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
		int mcnt = 8;
		if(cnt != null) {
			mcnt = Integer.parseInt(cnt);
		}
		
		ArrayList<ProductVO> datas = dao.searchWord(vo, mcnt);
		System.out.println(datas);
		
		request.setAttribute("searchDatas", datas);
		request.setAttribute("search_cnt", mcnt);
		request.setAttribute("titleInput", request.getParameter("titleInput"));
		
		ActionForward forward = null;
		if(request.getParameter("category").equals("music")) {
			forward = new ActionForward();
			forward.setPath("searchMusic.jsp");
			forward.setRedirect(false);
		} else if(request.getParameter("category").equals("device")) {
			forward = new ActionForward();
			forward.setPath("searchDevice.jsp");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근입니다!');history.go(-1);</script>");
		}
		return forward;
	}
}
