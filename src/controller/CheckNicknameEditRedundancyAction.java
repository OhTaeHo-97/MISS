package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.ConsumerVO;
import model.member.MemberDAO;

public class CheckNicknameEditRedundancyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		ConsumerVO vo = new ConsumerVO();
		vo.setNickname(request.getParameter("nickname"));
		HttpSession session = request.getSession();
		vo.setMember_id(((ConsumerVO)session.getAttribute("data")).getMember_id());
		
		int nicknameCheck = dao.checkEditNickname(vo);
		
		PrintWriter out = response.getWriter();
		out.write(nicknameCheck + "");
		
		return null;
	}

}
