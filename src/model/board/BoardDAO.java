package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;

public class BoardDAO {
	//게시판과 관련된 CRUD  ---> 관리자만 insert, update, delete가능
	// 1. 전체 게시판을 보여주는 것 selectAll
	// 2. 해당 게시글을 클릭해서 보기 selectOne
	// 3. '관리자'가  게시글을 쓰기  insertBoard
	// 4. '관리자'가  게시글을 수정  updateBoard
	// 5. '관리자'가  게시글을 삭제  deleteBoard
	
	Connection conn = null;
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	
	String sql_selectAll = "select * from (select * from board order by writedate desc) where ROWNUM <= ?";
	String sql_selectOne = "select * from board where board_id = ?";
	String sql_insertBoard = "insert into board(board_id,title,board_content) values((select nvl(MAX(board_id),0)+1 from board),?,?)";
	String sql_updateBoard = "update board set title = ?, board_content = ?, writedate = sysdate where board_id = ?";
	String sql_deleteBoard = "delete from board where board_id = ?";
	
	public ArrayList<BoardVO> selectAll(int mcnt) { // 최근날짜순으로 게시판에 나열
		conn = JDBCUtil.connect();
		ArrayList<BoardVO> datas = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql_selectAll);
			pstmt.setInt(1, mcnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO data = new BoardVO(); 
				data.setBoard_id(rs.getInt("board_id")); // board_id는 사용자에게 노출이 안되게 처리필요
				data.setTitle(rs.getString("title")); 
				data.setWritedate(rs.getString("writedate"));// Date값을 String타입으로 받아옴
				datas.add(data);
			}
			
		} catch (SQLException e) {
			System.out.println("BoardDAO selectAll중 예외발생");
			e.printStackTrace();
			return datas;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public BoardVO selectOne(BoardVO bvo) { //게시글 상세보기
		conn = JDBCUtil.connect();
		BoardVO vo = null;
		try {
			pstmt = conn.prepareStatement(sql_selectOne);
			//select * from board where board_id = ?
			pstmt.setInt(1, bvo.getBoard_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVO();
				vo.setBoard_id(rs.getInt("board_id"));
				vo.setTitle(rs.getString("title"));
				vo.setBoard_content(rs.getString("board_content"));
				vo.setWritedate(rs.getString("writedate"));
			}
			
		} catch (SQLException e) {
			System.out.println("BoardDAO selectOne중 예외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		
		return vo;
	}
	
	public boolean insertBoard(BoardVO bvo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_insertBoard);
			//insert into board(board_id,title,board_content) values((select nvl(MAX(board_id),0) from board)+1,?,?)
			pstmt.setString(1, bvo.getTitle());
			pstmt.setString(2, bvo.getBoard_content());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("BoardDAO insertBoard중 예외발생");
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean updateBoard(BoardVO bvo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_updateBoard);
			//update board set title = ?, board_content = ?, writedate = sysdate where board_id = ?
			pstmt.setString(1, bvo.getTitle());
			pstmt.setString(2, bvo.getBoard_content());
			pstmt.setInt(3, bvo.getBoard_id());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("BoardDAO updateBoard중 예외발생");
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean deleteBoard(BoardVO bvo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_deleteBoard);
			//delete from board where board_id = ?
			pstmt.setInt(1, bvo.getBoard_id());
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			System.out.println("BoardDAO deleteBoard중 예외발생");
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	
	
}










