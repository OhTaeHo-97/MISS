package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setBoard_id(Integer.parseInt(request.getParameter("bid")));
		
		ActionForward forward = null;
		if(dao.deleteBoard(vo)) {
			request.setAttribute("isDelete", true);
			forward = new ActionForward();
			forward.setPath("boardPage.board");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('공지사항 삭제에 실패했습니다!');history.go(-1);</script>");
		}
		return forward;
	}
}
