package crawling;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import model.common.JDBCUtil;

public class crawling {
	public static void main(String[] args) {
		String url = "https://www.melon.com/chart/index.htm";
		
		ArrayList<String> title = new ArrayList<String>();
		ArrayList<String> singer = new ArrayList<String>();
		ArrayList<String> album = new ArrayList<String>();
		ArrayList<String> album_img = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		String sql_insertProduct = "insert into product(product_id,product_name,price,product_pictureurl,product_category,stock) values((select nvl(max(product_id),0)+1 from product),?,?,?,?,?)";
		
		try {
			Document doc = Jsoup.connect(url).get();
			
			Elements ele = doc.select("div.wrap_song_info");
			
			Iterator<Element> itr = ele.select("div.rank01 > span > a").iterator();
			while(itr.hasNext()) {
				// System.out.println(itr.next().text());
				title.add(itr.next().text());
			}
			
			itr = ele.select("div.rank02 > a").iterator();
			while(itr.hasNext()) {
				// System.out.println(itr.next().text());
				singer.add(itr.next().text());
			}
			
			itr = ele.select("div.rank03 > a").iterator();
			while(itr.hasNext()) {
				// System.out.println(itr.next().text());
				album.add(itr.next().text());
			}
			
			ele = doc.select("div.wrap");
			itr = ele.select("a > img").iterator();
			while(itr.hasNext()) {
				// System.out.println(itr.next().attr("src"));
				album_img.add(itr.next().attr("src"));
			}
			
			for(int i = 0; i < title.size(); i++) {
				System.out.println("제목: " + title.get(i));
				System.out.println("가수: " + singer.get(i));
				System.out.println("앨범명: " + album.get(i));
				System.out.println("엘범 이미지 링크: " + album_img.get(i));
			}
			
			System.out.println(title.size());
			System.out.println(singer.size());
			System.out.println(album_img.size());
			
			conn = JDBCUtil.connect();
			for(int i = 0; i < title.size(); i++) {
				pstmt = conn.prepareStatement(sql_insertProduct);
				pstmt.setString(1, title.get(i));
				pstmt.setInt(2, 15000);
				pstmt.setString(3, album_img.get(i));
				pstmt.setString(4, "device");
				pstmt.setInt(5, 100);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
	}
}
