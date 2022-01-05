package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;

public class BoardEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setBoard_content(request.getParameter("content"));
		vo.setBoard_id(Integer.parseInt(request.getParameter("bid")));
		vo.setTitle(request.getParameter("title"));
		
		ActionForward forward = null;
		if(dao.updateBoard(vo)) {
			request.setAttribute("isEdit", true);
			forward = new ActionForward();
			forward.setPath("boardPage.board");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('공지사항 수정 실패!');history.go(-1);</script>");
		}
		
		return forward;
	}

}
