package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeRegisterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setTitle(request.getParameter("title"));
		vo.setBoardContent(request.getParameter("content"));
		dao.insert(vo);
		
		ActionForward forward = new ActionForward();
		forward.setPath("notice.do");
		forward.setRedirect(true);
		return forward;
	}
}
