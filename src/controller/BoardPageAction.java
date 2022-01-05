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
		String cnt = request.getParameter("board_cnt");
		int mcnt = 10;
		if(cnt != null) {
			mcnt = Integer.parseInt(cnt);
		}
		ArrayList<BoardVO> datas = dao.selectAll(mcnt);
		ActionForward forward = null;
		if(datas == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('공지사항 불러오기를 실패했습니다!');history.go(-1);</script>");
		} else {
			request.setAttribute("board_datas", datas);
			request.setAttribute("board_cnt", mcnt);
			forward = new ActionForward();
			forward.setPath("notice.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
