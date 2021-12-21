package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setBoardID(request.getParameter("bid"));
		BoardVO data = dao.selectOne(vo);
		
		request.setAttribute("title", data.getTitle());
		request.setAttribute("content", data.getContent());
		
		ActionForward forward = new ActionForward();
		forward.setPath("notice_detail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
