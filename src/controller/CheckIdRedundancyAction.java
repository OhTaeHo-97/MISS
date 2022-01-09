package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;

public class CheckIdRedundancyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setMember_id(request.getParameter("memberId"));
		
		int idCheck = dao.checkId(vo);
		
		PrintWriter out = response.getWriter();
		out.write(idCheck + "");
		
		return null;
	}

}
