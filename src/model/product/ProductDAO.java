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
	// 1. ArrayList<ProductVO> 보내주기 - selectAll
	// 2. 클릭해서 특정 상품 보여주기 - selectOne
	// 3. 필터검색을 통해 보여주기  - search~~~~~
	//	 - '음원'인지 '상품'인지 먼저 product_category를 통해 분류 => product_category = ?
	//		--	최신순 버튼 클릭 - searchNewest => order by product_regdate desc 
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
	String sql_searchFromNew = "select * from (select * from product where product_category = ? order by product_regdate desc) where ROWNUM <= ?";
	String sql_searchFromOld = "select * from (select * from product where product_category = ? order by product_regdate asc) where ROWNUM <= ?";
	String sql_searchFavorite = "select * from (select * from product where product_category = ? order by favorite_count desc) where ROWNUM <= ?";
	String sql_searchWord = "select * from (select * from product where product_category = ? and product_name like ?) where ROWNUM <= ?";
	String sql_stock = "update product set stock = stock - 1 where product_id = ?";
	String sql_insertProduct = "insert into product(product_id,product_name,price,product_comment,product_pictureurl,product_category,music_singer,music_genre) values(select nvl(max(product_id),0)+1 from product,?,?,?,?,?,?,?)";
	String sql_deleteReview = "delete from review where review_id = ?";
	
	public ArrayList<ProductVO> selectAll(int mcnt) { 
		ArrayList<ProductVO> datas = new ArrayList<>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_selectAll);
			//select * from product where ROWNUM <= ?
			pstmt.setInt(1, mcnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {				
				ProductVO pvo = new ProductVO();

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
				
				datas.add(pvo);
			}
			
		} catch (SQLException e) {
			System.out.println("ProdcutDAO selectAll중 예외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		
		return datas;
	}
	
	public ProductSet selectOne(ProductVO pvo) {
		conn = JDBCUtil.connect();
		ProductSet data = new ProductSet();
		try {
			pstmt = conn.prepareStatement(sql_selectOne);
			//select * from product where product_id = ?
			pstmt.setInt(1, pvo.getProduct_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ProductVO vo = new ProductVO();
				ArrayList<ReviewVO> rdatas = new ArrayList<>();
				
				vo.setProduct_id(rs.getInt("product_id"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setProdcut_regdate(rs.getString("product_regdate"));
				vo.setProduct_comment(rs.getString("product_comment"));
				vo.setProduct_pictureurl(rs.getString("product_pictureurl"));
				vo.setProduct_category(rs.getString("product_category"));
				vo.setMusic_singer(rs.getString("music_singer"));
				vo.setMusic_genre(rs.getString("music_genre"));
				vo.setFavorite_count(rs.getInt("favorite_count"));
				vo.setStock(rs.getInt("stock"));
				
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
				vo.setReviewcnt(rdatas.size());
				data.setProduct(vo);
				data.setReviewdata(rdatas);
			}
			
		} catch (SQLException e) {
			System.out.println("ProductDAO selectOne중 에외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return data;
	}
	
	public ArrayList<ProductVO> searchNewest(ProductVO pvo, int mcnt) {
		ArrayList<ProductVO> datas = new ArrayList<>(); 
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_searchFromNew);
			//select * from (select * from product where product_category = ? order by product_regdate desc) where ROWNUM <= ?
			pstmt.setString(1, pvo.getProduct_category());
			pstmt.setInt(2, mcnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProduct_id(rs.getInt("product_id"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setProdcut_regdate(rs.getString("product_regdate"));
				vo.setProduct_comment(rs.getString("product_comment"));
				vo.setProduct_pictureurl(rs.getString("product_pictureurl"));
				vo.setProduct_category(rs.getString("product_category"));
				vo.setMusic_singer(rs.getString("music_singer"));
				vo.setMusic_genre(rs.getString("music_genre"));
				vo.setFavorite_count(rs.getInt("favorite_count"));
				vo.setStock(rs.getInt("stock"));
				
				datas.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("ProductDAO searchNewest중 예외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public ArrayList<ProductVO> searchOldest(ProductVO pvo, int mcnt) {
		ArrayList<ProductVO> datas = new ArrayList<>(); 
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_searchFromOld);
			//select * from (select * from product where product_category = ? order by product_regdate asc) where ROWNUM <= ?
			pstmt.setString(1, pvo.getProduct_category());
			pstmt.setInt(2, mcnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProduct_id(rs.getInt("product_id"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setProdcut_regdate(rs.getString("product_regdate"));
				vo.setProduct_comment(rs.getString("product_comment"));
				vo.setProduct_pictureurl(rs.getString("product_pictureurl"));
				vo.setProduct_category(rs.getString("product_category"));
				vo.setMusic_singer(rs.getString("music_singer"));
				vo.setMusic_genre(rs.getString("music_genre"));
				vo.setFavorite_count(rs.getInt("favorite_count"));
				vo.setStock(rs.getInt("stock"));
				
				datas.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("ProductDAO searchOldest중 예외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public ArrayList<ProductVO> searchFavoriteCnt(ProductVO pvo, int mcnt) {
		ArrayList<ProductVO> datas = new ArrayList<>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_searchFavorite);
			//select * from (select * from product where product_category = ? order by favorite_count desc) where ROWNUM <= ?
			pstmt.setString(1, pvo.getProduct_category());
			pstmt.setInt(2, mcnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProduct_id(rs.getInt("product_id"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setProdcut_regdate(rs.getString("product_regdate"));
				vo.setProduct_comment(rs.getString("product_comment"));
				vo.setProduct_pictureurl(rs.getString("product_pictureurl"));
				vo.setProduct_category(rs.getString("product_category"));
				vo.setMusic_singer(rs.getString("music_singer"));
				vo.setMusic_genre(rs.getString("music_genre"));
				vo.setFavorite_count(rs.getInt("favorite_count"));
				vo.setStock(rs.getInt("stock"));
				
				datas.add(vo);
			}	
		} catch (SQLException e) {
			System.out.println("ProductDAO searchFavoriteCnt중 예외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public ArrayList<ProductVO> searchWord(ProductVO pvo, int mcnt) { //  String searchword 이부분을 pvo의 product_name으로 받아올 수도 있다.
		ArrayList<ProductVO> datas = new ArrayList<>();
		conn = JDBCUtil.connect();
		String filterWord = pvo.getProduct_name();
		if(filterWord==null) {
			 filterWord = "";
		}
		try {
			pstmt = conn.prepareStatement(sql_searchWord);
			//select * from (select * from product where product_category = ? and product_name like ?) where ROWNUM <= ?
			pstmt.setString(1, pvo.getProduct_category());
			pstmt.setString(2, "%"+filterWord+"%");
			pstmt.setInt(3, mcnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProduct_id(rs.getInt("product_id"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setProdcut_regdate(rs.getString("product_regdate"));
				vo.setProduct_comment(rs.getString("product_comment"));
				vo.setProduct_pictureurl(rs.getString("product_pictureurl"));
				vo.setProduct_category(rs.getString("product_category"));
				vo.setMusic_singer(rs.getString("music_singer"));
				vo.setMusic_genre(rs.getString("music_genre"));
				vo.setFavorite_count(rs.getInt("favorite_count"));
				vo.setStock(rs.getInt("stock"));
				
				datas.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		
		return datas;
	}
	
	public boolean clickFav(ProductVO pvo) {
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
	
	public boolean stock(ArrayList<ProductVO> pvo) {// 결제를 진행했을 때 stock(수량)이 빠지게끔 한다.
		conn = JDBCUtil.connect();
		try {			
			conn.setAutoCommit(false);
			for (ProductVO data : pvo) {
				int pid = data.getProduct_id();
				pstmt = conn.prepareStatement(sql_selectOne);
				//select * from product where product_id = ?
				pstmt.setInt(1, pid);
				rs = pstmt.executeQuery();
				rs.next();
				int stock = rs.getInt("stock");
				if(stock > 0) {
					pstmt = conn.prepareStatement(sql_stock);
					//update product set stock = stock - 1 where product_id = ?
					pstmt.setInt(1, pid);
					pstmt.executeUpdate();
				}
				else {
					conn.rollback(); // 장바구니에 담긴 물품 중 하나라도 수량이 부족하다면 전체 주문을 취소시킨다.
					return false;
				}			
			}
			conn.commit();
			
			
		} catch (SQLException e) {
			System.out.println("ProductDAO stock(결제수량체크)중 에외발생");
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
	
	public boolean insertProduct(ProductVO pvo) { //product_pictureurl, favorite_count, stock은 default값으로 지정
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_insertProduct); 
			//insert into product(product_id,product_name,price,product_comment,product_category,music_singer,music_genre) 
			//		values(select nvl(max(product_id),0)+1 from product,?,?,?,?,?,?)
			pstmt.setString(1, pvo.getProduct_name());
			pstmt.setInt(2, pvo.getPrice());
			pstmt.setString(3, pvo.getProduct_comment());
			pstmt.setString(4, pvo.getProduct_category());
			pstmt.setString(5, pvo.getMusic_singer());
			pstmt.setString(6, pvo.getMusic_genre());
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("ProductDAO insertProduct중 예외발생");
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean deleteReview(ReviewVO rvo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_deleteReview);
			//delete from review where review_id = ?
			pstmt.setInt(1, rvo.getReview_id());
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("ProductDAO deleteReview중 예외발생");
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public ArrayList<ProductVO> selectShopList(ArrayList<ProductVO> pvoList) { // Controller에서 중복을 제거한 후 넘겨줌
		conn = JDBCUtil.connect();
		ArrayList<ProductVO> datas = new ArrayList<>(); 
		ProductVO data = null;
		try {
			for (ProductVO pvo : pvoList) {
				data = new ProductVO();
				pstmt = conn.prepareStatement(sql_selectOne);
				//select * from product where product_id = ?
				pstmt.setInt(1, pvo.getProduct_id());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					data.setProduct_id(rs.getInt("product_id"));
					data.setProduct_name(rs.getString("product_name"));
					data.setPrice(rs.getInt("price"));
					data.setProduct_pictureurl(rs.getString("product_pictureurl"));
					data.setProduct_category(rs.getString("product_category"));
				}
				datas.add(data);
			}	
			
		} catch (SQLException e) {
			System.out.println("ProductDAO selectShopList중 예외발생");
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
}









