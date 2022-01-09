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
		ArrayList<String> device_img = new ArrayList<String>();
		ArrayList<String> device_name = new ArrayList<String>();
		ArrayList<Integer> device_price = new ArrayList<Integer>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		String sql_insertMusic = "insert into product(product_id,product_name,price,product_pictureurl,product_category,music_singer,music_genre,stock) values((select nvl(max(product_id),0)+1 from product),?,?,?,?,?,?,?)";
		String sql_insertProduct = "insert into product(product_id,product_name,price,product_pictureurl,product_category,stock) values((select nvl(max(product_id),0)+1 from product),?,?,?,?,?)";
		
		try {
			Document doc = Jsoup.connect(url).get();
			
			Elements ele = doc.select("div.wrap_song_info");
			
			Iterator<Element> itr = ele.select("div.rank01 > span > a").iterator();
			while(itr.hasNext()) {
				String tlt = itr.next().text();
				System.out.println(tlt);
				title.add(tlt);
			}
			
			itr = ele.select("div.rank02 > a").iterator();
			while(itr.hasNext()) {
				String singer_str = itr.next().text();
				System.out.println(singer_str);
				singer.add(singer_str);
			}
			
			itr = ele.select("div.rank03 > a").iterator();
			while(itr.hasNext()) {
				// System.out.println(itr.next().text());
				album.add(itr.next().text());
			}
			
			ele = doc.select("div.wrap");
			itr = ele.select("a > img").iterator();
			while(itr.hasNext()) {
				String img_src = itr.next().attr("src");
				System.out.println(img_src);
				album_img.add(img_src);
			}
			
			for(int i = 0; i < title.size(); i++) {
				System.out.println("제목: " + title.get(i));
				System.out.println("가수: " + singer.get(i));
//				System.out.println("앨범명: " + album.get(i));
				System.out.println("엘범 이미지 링크: " + album_img.get(i));
			}
			
			System.out.println(title.size());
			System.out.println(singer.size());
			System.out.println(album_img.size());
			
			conn = JDBCUtil.connect();
			for(int i = 0; i < title.size(); i++) {
				pstmt = conn.prepareStatement(sql_insertMusic);
				pstmt.setString(1, title.get(i));
				pstmt.setInt(2, 300);
				pstmt.setString(3, album_img.get(i));
				pstmt.setString(4, "music");
				pstmt.setString(5, singer.get(i));
				pstmt.setString(6, "발라드");
				pstmt.setInt(7, 100);
				pstmt.executeUpdate();
			}
			
			url = "http://www.fndaudio.co.kr/bbs/board.php?bo_table=gallery&sca=2%EC%B1%84%EB%84%90";
			
			doc = Jsoup.connect(url).get();
			
			ele = doc.select("div#bo_gall > div.tiles > div.tile > a.a");
			
			itr = ele.select("div.image>div.img").iterator();
			while(itr.hasNext()) {
				String attr = itr.next().attr("style");
				String link = attr.substring(attr.indexOf("http://"), attr.indexOf(")"));
				String result = link.substring(0, link.length() - 1);
				System.out.println(result);
				device_img.add(result);
			}
			
			itr = ele.select("div > div.tile_subject").iterator();
			while(itr.hasNext()) {
				String name = itr.next().text();
				System.out.println(name);
				device_name.add(name);
			}
			
			url = "http://www.fndaudio.co.kr/bbs/board.php?bo_table=gallery&sca=2.1%EC%B1%84%EB%84%90";
			
			doc = Jsoup.connect(url).get();
			
			ele = doc.select("div#bo_gall > div.tiles > div.tile > a.a");
			
			itr = ele.select("div.image>div.img").iterator();
			while(itr.hasNext()) {
				String attr = itr.next().attr("style");
				String link = attr.substring(attr.indexOf("http://"), attr.indexOf(")"));
				String result = link.substring(0, link.length() - 1);
				System.out.println(result);
				device_img.add(result);
			}
			
			itr = ele.select("div > div.tile_subject").iterator();
			while(itr.hasNext()) {
				String name = itr.next().text();
				System.out.println(name);
				device_name.add(name);
			}
			
			url = "http://www.fndaudio.co.kr/bbs/board.php?bo_table=gallery&sca=5.1%EC%B1%84%EB%84%90";
			
			doc = Jsoup.connect(url).get();
			
			ele = doc.select("div#bo_gall > div.tiles > div.tile > a.a");
			
			itr = ele.select("div.image>div.img").iterator();
			while(itr.hasNext()) {
				String attr = itr.next().attr("style");
				String link = attr.substring(attr.indexOf("http://"), attr.indexOf(")"));
				String result = link.substring(0, link.length() - 1);
				System.out.println(result);
				device_img.add(result);
			}
			
			itr = ele.select("div > div.tile_subject").iterator();
			while(itr.hasNext()) {
				String name = itr.next().text();
				System.out.println(name);
				device_name.add(name);
			}
			
			url = "http://www.fndaudio.co.kr/bbs/board.php?bo_table=gallery&sca=%ED%86%A8%EB%B3%B4%EC%9D%B4";
			
			doc = Jsoup.connect(url).get();
			
			ele = doc.select("div#bo_gall > div.tiles > div.tile > a.a");
			
			itr = ele.select("div.image>div.img").iterator();
			while(itr.hasNext()) {
				String attr = itr.next().attr("style");
				String link = attr.substring(attr.indexOf("http://"), attr.indexOf(")"));
				String result = link.substring(0, link.length() - 1);
				System.out.println(result);
				device_img.add(result);
			}
			
			itr = ele.select("div > div.tile_subject").iterator();
			while(itr.hasNext()) {
				String name = itr.next().text();
				System.out.println(name);
				device_name.add(name);
			}
			
			conn = JDBCUtil.connect();
			for(int i = 0; i < device_name.size(); i++) {
				pstmt = conn.prepareStatement(sql_insertProduct);
				pstmt.setString(1, device_name.get(i));
				pstmt.setInt(2, 15000);
				pstmt.setString(3, device_img.get(i));
				pstmt.setString(4, "device");
				pstmt.setInt(5, 999);
				pstmt.executeUpdate();
			}
			
			device_img = new ArrayList<String>();
			device_name = new ArrayList<String>();
			device_price = new ArrayList<Integer>();
			
			url = "https://brand.naver.com/bang-olufsen/category/39e23418ebee45a1a1fd19b771727b8b?cp=1";
			
			doc = Jsoup.connect(url).get();
			
			ele = doc.select("div#CategoryProducts > ul._1bijXwxRam");
			
			itr = ele.select("li._2txbrXXlXM > a._2stzi1AtUa > div._2nYI9WkxU9 > div._2Tr9BUxNo4 > div._2JNWBGd-04 > img").iterator();
			while(itr.hasNext()) {
				String img_src = itr.next().attr("src");
				device_img.add(img_src);
			}
			
			itr = ele.select("li._2txbrXXlXM > a._2stzi1AtUa > strong._3E2b29u49p").iterator();
			while(itr.hasNext()) {
				String name = itr.next().text();
				System.out.println(name);
				device_name.add(name);
			}
			
			itr = ele.select("li._2txbrXXlXM > a._2stzi1AtUa > div.ZAfIG5c7RT > strong > span._1mMufyjSsw").iterator();
			while(itr.hasNext()) {
				String price = itr.next().text();
				price = price.replace(",", "");
				System.out.println(price);
				int price_int = Integer.parseInt(price);
				device_price.add(price_int);
			}
			
			for(int i = 0; i < device_img.size(); i++) {
				System.out.println("이름: " + device_name.get(i));
				System.out.println("이미지 링크: " + device_img.get(i));
				System.out.println("가격: " + device_price.get(i));
			}
			
			System.out.println(device_name.size());
			System.out.println(device_img.size());
			System.out.println(device_price.size());
			
			url = "https://brand.naver.com/bang-olufsen/category/7a2cbd425b6e43c9a7a9acf7cbdf484c?cp=1";
			
			doc = Jsoup.connect(url).get();
			
			ele = doc.select("div#CategoryProducts > ul._1bijXwxRam");
			
			itr = ele.select("li._2txbrXXlXM > a._2stzi1AtUa > div._2nYI9WkxU9 > div._2Tr9BUxNo4 > div._2JNWBGd-04 > img").iterator();
			while(itr.hasNext()) {
				String img_src = itr.next().attr("src");
				device_img.add(img_src);
			}
			
			itr = ele.select("li._2txbrXXlXM > a._2stzi1AtUa > strong._3E2b29u49p").iterator();
			while(itr.hasNext()) {
				String name = itr.next().text();
				System.out.println(name);
				device_name.add(name);
			}
			
			itr = ele.select("li._2txbrXXlXM > a._2stzi1AtUa > div.ZAfIG5c7RT > strong > span._1mMufyjSsw").iterator();
			while(itr.hasNext()) {
				String price = itr.next().text();
				price = price.replace(",", "");
				System.out.println(price);
				int price_int = Integer.parseInt(price);
				device_price.add(price_int);
			}
			
			for(int i = 0; i < device_img.size(); i++) {
				System.out.println("이름: " + device_name.get(i));
				System.out.println("이미지 링크: " + device_img.get(i));
				System.out.println("가격: " + device_price.get(i));
			}
			
			System.out.println(device_name.size());
			System.out.println(device_img.size());
			System.out.println(device_price.size());
			
			conn = JDBCUtil.connect();
			for(int i = 0; i < device_name.size(); i++) {
				pstmt = conn.prepareStatement(sql_insertProduct);
				pstmt.setString(1, device_name.get(i));
				pstmt.setInt(2, device_price.get(i));
				pstmt.setString(3, device_img.get(i));
				pstmt.setString(4, "device");
				pstmt.setInt(5, 999);
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
