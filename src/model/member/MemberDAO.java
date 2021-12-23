package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.common.JDBCUtil;

public class MemberDAO {
	// CRUD 비즈니스 메서드 구현
	// 1. 회원가입에 필요한 C - insert (insertMVO, insertCVO)
	// 2. 로그인에 필요한 R - selectOne
	// 3. 회원정보 수정에 필요한 U - update
	// 4. 회원탈퇴도 구현할 수 있지만 아직 설계하지 않았으므로.. - delete
	
	Connection conn = null;
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	String sql_selectOne = "select * from member where member_id = ?"; // 회원 로그인할 떄 필요한 sql구문
	String sql_selectCVO = "select * from consumer where member_id = ?";
	String sql_selectAdmin = "select * from admin where member_id =?";
	String sql_insertMVO = "insert into member(member_id,member_pw) values(?,?)"; // 회원가입때 필요한 sql구문 - member 테이블용
	String sql_insertCVO = "insert into consumer values(?,?,?,?,?)"; // 회원가입때 필요한 sql구문 - consumer 테이블용
	String sql_updateCon = "UPDATE consumer SET nickname = ?, address = ?, phonenumber = ?, email = ? where member_id = ?";
	String sql_updateMem = "update member set member_pw = ? where member_id = ?";
	String sql_delete = "delete from member where member_id = ?";
	
	public ConsumerSet consumerLogin(MemberVO mvo) { // mvo객체를 통해 member_id와 member_pw를 넘겨받아야 한다.
		conn = JDBCUtil.connect();
		ConsumerSet cs = null;
		try {
			pstmt = conn.prepareStatement(sql_selectOne); 
			//select * from member where member_id = ? 한 개의 rows 리턴
			pstmt.setString(1, mvo.getMember_id());
			rs = pstmt.executeQuery();
			if(rs.next()) { // ID가 존재한다면 -> 비밀번호 일치 확인
				if(rs.getString("member_pw").equals(mvo.getMember_pw())) {
					// 비밀번호 일치!!
					System.out.println("회원 비밀번호 일치"); //로깅용 
					cs = new ConsumerSet();
					MemberVO mbvo = new MemberVO();
					ConsumerVO csvo = new ConsumerVO();
					
					mbvo.setMember_id(rs.getString("member_id"));
					//mbvo.setMember_pw(rs.getString("member_pw"));
					mbvo.setAuth(rs.getString("auth"));
					
					pstmt = conn.prepareStatement(sql_selectCVO);
					pstmt.setString(1, rs.getString("member_id"));
					rs2 = pstmt.executeQuery();
					if(rs2.next()) {
						csvo.setMember_id(rs2.getString("member_id"));
						csvo.setNickname(rs2.getString("nickname"));
						csvo.setAddress(rs2.getString("address"));
						csvo.setEmail(rs2.getString("email"));
						csvo.setPhoneNumber(rs2.getString("phoneNumber"));
					}
								
					cs.setMvo(mbvo);
					cs.setCvo(csvo);
				}
				else {
					System.out.println("비밀번호 불일치"); //로깅용
				}
			}
			else {
				System.out.println("ID 불일치");				
			}
		} catch (SQLException e) {
			System.out.println("MemberDAO selectOne중 에외발생"); //로깅용
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return cs;
	}
	
	public MemberVO adminLogin(MemberVO mvo) {
		conn = JDBCUtil.connect();
		MemberVO vo = null;
		try {
			pstmt = conn.prepareStatement(sql_selectOne);
			//select * from member where member_id = ?
			pstmt.setString(1, mvo.getMember_id());
			rs = pstmt.executeQuery();
			
			pstmt = conn.prepareStatement(sql_selectAdmin);
			//select * from admin where member_id =?
			pstmt.setString(1, mvo.getMember_id());
			rs2 = pstmt.executeQuery();
			
			if(rs.next() && rs2.next()) {
				if(rs.getString("member_pw").equals(mvo.getMember_pw())) {
					System.out.println("Admin 비밀번호 일치");
					vo = new MemberVO();
					vo.setMember_id(rs.getString("member_id"));
					vo.setAuth(rs.getString("auth"));
				}
				else {
					System.out.println("Admin 비밀번호 불일치");
				}
			}
			else {
				System.out.println("Admin 아이디 불일치");
			}
			
		} catch (SQLException e) {
			System.out.println("MemberDAO adminLogin중 에러발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return vo;
	}
	
	/*public ConsumerVO detail(MemberVO mvo) { // 회원 상세보기 페이지에서 활용될 메서드
		// session에 저장된 회원의 member_id를 넘겨받아 상세 정보를 Controller에게 다시 넘겨준다.
		conn = JDBCUtil.connect();
		ConsumerVO cvo = null;
		try {
			pstmt = conn.prepareStatement(sql_selectOne); 
			// select * from member where member_id = ?
			pstmt.setString(1, mvo.getMember_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cvo = new ConsumerVO();
				cvo.setAddress(rs.getString("address"));
				cvo.setEmail("email");
				cvo.setNickname("nickname"); 
				cvo.setPhoneNumber("phoneNumber");
			}		
		} catch (SQLException e) {
			System.out.println("MemberDAO detail에서 예외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return cvo;
	}*/
	
	
	public boolean insert(ConsumerSet cs) { // 회원가입시 Member와 Consumer 테이블에 data 입력
		conn = JDBCUtil.connect();
		MemberVO mvo = cs.getMvo();
		ConsumerVO cvo = cs.getCvo();
		try {
			pstmt = conn.prepareStatement(sql_insertMVO);
			// insert into member(member_id,member_pw) values(?,?)
			pstmt.setString(1, mvo.getMember_id());
			pstmt.setString(2, mvo.getMember_id());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql_insertCVO);
			//insert into consumer values(?,?,?,?,?)
			pstmt.setString(1, cvo.getMember_id());
			pstmt.setString(2, cvo.getNickname());
			pstmt.setString(3, cvo.getAddress());
			pstmt.setString(4, cvo.getPhoneNumber());
			pstmt.setString(5, cvo.getEmail());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("MemberDAO insert(회원가입)진행 중 오류");
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean update(ConsumerSet cs) { // 비밀번호 정보까지 바꾸려면 member테이블까지 접근해야 하니, 현재는 id와 pw는 변경이 안되서 update코딩함(바뀔수있음)
		conn = JDBCUtil.connect();
		MemberVO mvo = cs.getMvo();
		ConsumerVO cvo = cs.getCvo();
		try {
			pstmt = conn.prepareStatement(sql_updateMem); // --> 비밀번호 변경
			//update member set member_pw = ? where member_id = ?
			pstmt.setString(1, mvo.getMember_pw());
			pstmt.setString(2, mvo.getMember_id());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql_updateCon);
			//UPDATE consumer SET nickname = ?, address = ?, phonenumber = ?, email = ? where member_id = ?
			pstmt.setString(1, cvo.getNickname());
			pstmt.setString(2, cvo.getAddress());
			pstmt.setString(3, cvo.getPhoneNumber());
			pstmt.setString(4, cvo.getEmail());
			pstmt.setString(5, cvo.getMember_id());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("MemberDAO update(정보수정)진행 중 오류");
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean delete(MemberVO mvo) { // 회원탈퇴에 쓰일 예정
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_delete); //delete from member where member_id = ?
			pstmt.setString(1, mvo.getMember_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("MemberDAO delete(회원탈퇴)진행 중 오류");
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
}








