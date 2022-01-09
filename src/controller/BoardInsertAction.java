package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;

public class BoardInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setTitle(request.getParameter("title"));
		vo.setBoard_content(request.getParameter("content"));
		
		ActionForward forward = null;
		if(dao.insertBoard(vo)) {
			request.setAttribute("isInsert", true);
			forward = new ActionForward();
			forward.setPath("boardPage.board");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('공지사항 등록 실패!');history.go(-1);</script>");
		}
		return forward;
	}
}
