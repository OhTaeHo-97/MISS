package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;

public class BoardPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		BoardDAO dao = new BoardDAO();
		String cnt = request.getParameter("board_page");
		int mcnt = 1;
		if(cnt != null) {
			mcnt = Integer.parseInt(cnt);
		}
		int totalCount = dao.boardCount();
		int lastPage = totalCount / 8;
		lastPage = totalCount % 8 > 0 ? lastPage + 1 : lastPage;
//		ArrayList<BoardVO> datas = dao.selectAll(mcnt);
		ArrayList<BoardVO> datas = dao.selectAllbyPage(mcnt);
		ActionForward forward = null;
		if(datas == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('공지사항 불러오기를 실패했습니다!');history.go(-1);</script>");
		} else {
			request.setAttribute("board_datas", datas);
			request.setAttribute("board_page", mcnt);
			request.setAttribute("board_last", lastPage); // 추가됨
			forward = new ActionForward();
			forward.setPath("notice.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
