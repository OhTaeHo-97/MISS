package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditInformationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		CustomerDAO dao = new CustomerDAO();
		MemberVO mvo = new MemberVO();
		mvo.setID(request.getParameter("id"));
		mvo.setPw(request.getParameter("pre_password"));
		
		ActionForward forward = null;
		// 비밀번호 맞는지 확인
		if(dao.selectOne(mvo)) {
			String new_pw = request.getParameter("new_pw");
			String confirm_pw = request.getParameter("confirm_pw");
			if(new_pw.equals(confirm_pw)) {
				if(new_pw == null && confirm_pw == null) {
					CustomerVO vo = new CustomerVO();
					vo.setMemberID(request.getParameter("id"));
					vo.setNickName(request.getParameter("nickname"));
					vo.setAddress(request.getParameter("address"));
					vo.setPhoneNumber(request.getParameter("phone"));
					vo.setEmail(request.getParameter("email"));
				} else {
					// 비밀번호 변경
					dao.update(mvo);
					// 개인정보 변경
					CustomerVO vo = new CustomerVO();
					vo.setMemberID(request.getParameter("id"));
					vo.setNickName(request.getParameter("nickname"));
					vo.setAddress(request.getParameter("address"));
					vo.setPhoneNumber(request.getParameter("phone"));
					vo.setEmail(request.getParameter("email"));
				}
				forward = new ActionForward();
				forward.setPath("edit.mem");
				forward.setRedirect(false);
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('새로운 비밀번호와 비밀번호 확인이 맞지 않습니다!');history.go(-1);</script>");
			}
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 틀렸습니다!');history.go(-1);</script>");
		}
		
		return forward;
	}

}
