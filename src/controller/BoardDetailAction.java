package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setBoard_id(Integer.parseInt(request.getParameter("bid")));
		BoardVO data = dao.selectOne(vo);
		request.setAttribute("boardData", data);
		
		ActionForward forward = new ActionForward();
		forward.setPath("noticeDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
