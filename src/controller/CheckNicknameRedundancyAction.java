package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.ConsumerVO;
import model.member.MemberDAO;

public class CheckNicknameRedundancyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		ConsumerVO vo = new ConsumerVO();
		vo.setNickname(request.getParameter("nickname"));
		
		int nicknameCheck = dao.checkNickname(vo);
		
		PrintWriter out = response.getWriter();
		out.write(nicknameCheck + "");
		
		return null;
	}

}
