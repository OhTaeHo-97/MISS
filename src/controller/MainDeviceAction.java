package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.product.ProductDAO;
import model.product.ProductVO;

public class MainDeviceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String filter = request.getParameter("filter");
		System.out.println(filter);
		if(filter == null) {
			HttpSession session = request.getSession();
			filter = (String)session.getAttribute("filter");
		}
		ProductDAO dao = new ProductDAO();
		
		
		String cnt = request.getParameter("device_cnt");
		int mcnt = 12;
		if(cnt != null) {
			mcnt = Integer.parseInt(cnt);
		}
		
		ActionForward forward = new ActionForward();
		if(filter.equals("recent")) {
			ProductVO pvo = new ProductVO();
			pvo.setProduct_category("device");
			ArrayList<ProductVO> datas = dao.searchNewest(pvo, mcnt);
			request.setAttribute("datas", datas);
			request.setAttribute("device_cnt", mcnt);
			forward.setPath("device.jsp");
			forward.setRedirect(false);
		} else if(filter.equals("old")) {
			ProductVO pvo = new ProductVO();
			pvo.setProduct_category("device");
			ArrayList<ProductVO> datas = dao.searchOldest(pvo, mcnt);
			request.setAttribute("datas", datas);
			forward.setPath("device.jsp");
			request.setAttribute("device_cnt", mcnt);
			forward.setRedirect(false);
		} else if(filter.equals("fav")) {
			ProductVO pvo = new ProductVO();
			pvo.setProduct_category("device");
			ArrayList<ProductVO> datas = dao.searchFavoriteCnt(pvo, mcnt);
			request.setAttribute("datas", datas);
			request.setAttribute("device_cnt", mcnt);
			forward.setPath("device.jsp");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근입니다!');history.go(-1);</script>");
		}
		return forward;
	}
}
