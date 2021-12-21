package model.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;
import model.member.ConsumerSet;
import model.member.ConsumerVO;

public class ProductDAO {
	// 1. ArrayList<ProductSet> 보내주기 - selectAll
	// 2. 클릭해서 특정 상품 보여주기 - selectOne
	// 3. 필터검색을 통해 보여주기  - search~~~~~
	//	 - '음원'인지 '상품'인지 먼저 product_category를 통해 분류 => product_category = ?
	//		--	최신순 버튼 클릭  => order by product_regdate desc
	//		--	오래된순 버튼 클릭 => order by product_regdate
	//		--	좋아요순 버튼 클릭 => order by favorite_count desc, product_name
	//		--	제목 검색위한 테스트 입력 => product_name like %~% --> pstmt.setString(1,"%"+pvo.getProduct_name()+"%")
	//
	// 4. 좋아요 클릭 - update (상품추가대신 favorite_count 증가로 변경)
	// 5. 상품에 대한 리뷰쓰기 - insertReview
	
	
	Connection conn = null;
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	String sql_selectAll = "select * from product where ROWNUM <= ?";
	String sql_selectAllReview = "select * from review where product_id = ? order by review_date desc";
	String sql_selectOne = "select * from product where product_id = ?";
	String sql_update = "update product set favorite_count = favorite_count + 1 where product_id = ?";
	String sql_insertReview = "insert into review(review_id,product_id,nickname,review_content) values((select nvl(MAX(review_id),0)+1 from review),?,?,?)";
	String sql_searchNewest = "select * from product where product_category = ? order by writedate desc";
	
	
	public ArrayList<ProductSet> selectAll(int mcnt) {
		ArrayList<ProductSet> datas = new ArrayList<>();
		
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_selectAll);
			//select * from product where ROWNUM <= ?
			pstmt.setInt(1, mcnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductSet ps = new ProductSet();
				ProductVO pvo = new ProductVO();
				ArrayList<ReviewVO> rdatas = new ArrayList<>();
				
				pvo.setProduct_id(rs.getInt("product_id"));
				pvo.setProduct_name(rs.getString("product_name"));
				pvo.setPrice(rs.getInt("price"));
				pvo.setProdcut_regdate(rs.getString("product_regdate"));
				pvo.setProduct_comment(rs.getString("product_comment"));
				pvo.setProduct_pictureurl(rs.getString("product_pictureurl"));
				pvo.setProduct_category(rs.getString("product_category"));
				pvo.setMusic_singer(rs.getString("music_singer"));
				pvo.setMusic_genre(rs.getString("music_genre"));
				pvo.setFavorite_count(rs.getInt("favorite_count"));
				pvo.setStock(rs.getInt("stock"));
				//어떤 제품정보가 메인페이지에서 필요한지는 몰라서 일단 전부 담아보냅니다.
				
				pstmt = conn.prepareStatement(sql_selectAllReview);
				//select * from review where product_id=? order by review_date desc;
				pstmt.setInt(1, rs.getInt("product_id"));
				rs2 = pstmt.executeQuery();
				
				while(rs2.next()) {
					ReviewVO rvo = new ReviewVO();
					rvo.setReview_id(rs2.getInt("review_id"));
					rvo.setProduct_id(rs2.getInt("product_id"));
					rvo.setNickname(rs2.getString("nickname"));
					rvo.setReview_content(rs2.getString("review_content"));
					rvo.setReview_date(rs2.getString("review_date"));
					rdatas.add(rvo);
				}
				pvo.setReviewcnt(rdatas.size());
				
				ps.setProduct(pvo);
				ps.setReviewdata(rdatas);
				datas.add(ps);
			}
			
		} catch (SQLException e) {
			System.out.println("ProdcutDAO selectAll중 예외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		
		return datas;
	}
	
	public ProductVO selectOne(ProductVO pvo) {
		conn = JDBCUtil.connect();
		ProductVO data = new ProductVO();
		try {
			pstmt = conn.prepareStatement(sql_selectOne);
			//select * from product where product_id = ?
			pstmt.setInt(1, pvo.getProduct_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				data.setProduct_id(rs.getInt("product_id"));
				data.setProduct_name(rs.getString("product_name"));
				data.setPrice(rs.getInt("price"));
				data.setProdcut_regdate(rs.getString("product_regdate"));
				data.setProduct_comment(rs.getString("product_comment"));
				data.setProduct_pictureurl(rs.getString("product_pictureurl"));
				data.setProduct_category(rs.getString("product_category"));
				data.setMusic_singer(rs.getString("music_singer"));
				data.setMusic_genre(rs.getString("music_genre"));
				data.setFavorite_count(rs.getInt("favorite_count"));
				data.setStock(rs.getInt("stock"));
			}
			
		} catch (SQLException e) {
			System.out.println("ProductDAO selectOne중 에외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return data;
	}
	
	public void searchNewest(ProductVO pvo, int mcnt) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_searchNewest);
			//select * from product where product_category = ? order by writedate desc
			pstmt.setString(1, pvo.getProduct_category());
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			System.out.println("ProductDAO searchNewest중 예외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		
	}
	
	
	public boolean update(ProductVO pvo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_update);
			//update product set favorite_count = favorite_count + 1 where product_id = ?
			pstmt.setInt(1, pvo.getProduct_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ProductDAO update(좋아요클릭)중 에외발생");
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean insertReview(ReviewVO rvo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_insertReview);
			//insert into review(review_id,product_id,nickname,review_content) values((select nvl(MAX(review_id),0) from review)+1,?,?,?)
			pstmt.setInt(1, rvo.getProduct_id());
			pstmt.setString(2, rvo.getNickname());
			pstmt.setString(3, rvo.getReview_content());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("ProductDAO insertReview중 예외발생");
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
}









