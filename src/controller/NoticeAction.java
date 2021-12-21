package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> datas = dao.selectAll();
		request.setAttribute("datas", datas);
		
		ActionForward forward = new ActionForward();
		forward.setPath("notice.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
