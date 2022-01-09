package model.product;

public class ProductVO {
	private int product_id;
	private String product_name;
	private int price;
	private String prodcut_regdate;
	private String product_comment;
	private String product_pictureurl;
	private String product_category;
	private String music_singer;
	private String music_genre;
	private int favorite_count;
	private int stock;
	private int reviewcnt; // 칼럼상으로는 존재하지 않지만 로직적으로 필요한 속성
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdcut_regdate() {
		return prodcut_regdate;
	}
	public void setProdcut_regdate(String prodcut_regdate) {
		this.prodcut_regdate = prodcut_regdate;
	}
	public String getProduct_comment() {
		return product_comment;
	}
	public void setProduct_comment(String product_comment) {
		this.product_comment = product_comment;
	}
	public String getProduct_pictureurl() {
		return product_pictureurl;
	}
	public void setProduct_pictureurl(String product_pictureurl) {
		this.product_pictureurl = product_pictureurl;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getMusic_singer() {
		return music_singer;
	}
	public void setMusic_singer(String music_singer) {
		this.music_singer = music_singer;
	}
	public String getMusic_genre() {
		return music_genre;
	}
	public void setMusic_genre(String music_genre) {
		this.music_genre = music_genre;
	}
	public int getFavorite_count() {
		return favorite_count;
	}
	public void setFavorite_count(int favorite_count) {
		this.favorite_count = favorite_count;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
	public int getReviewcnt() {
		return reviewcnt;
	}
	public void setReviewcnt(int reviewcnt) {
		this.reviewcnt = reviewcnt;
	}
	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", product_name=" + product_name + ", price=" + price
				+ ", prodcut_regdate=" + prodcut_regdate + ", product_comment=" + product_comment
				+ ", product_pictureurl=" + product_pictureurl + ", product_category=" + product_category
				+ ", music_singer=" + music_singer + ", music_genre=" + music_genre + ", favorite_count="
				+ favorite_count + ", stock=" + stock + ", reviewcnt=" + reviewcnt + "]";
	}
	
	
	
	
}
