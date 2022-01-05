package model.product;

public class ReviewVO {
	private int review_id;
	private int product_id;
	private String nickname;
	private String review_content;
	private String review_date; // date타입이 아닌 String으로 받을 계획
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", product_id=" + product_id + ", nickname=" + nickname
				+ ", review_content=" + review_content + ", review_date=" + review_date + "]";
	}
	
	
}
