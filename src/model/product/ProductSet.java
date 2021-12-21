package model.product;

import java.util.ArrayList;

public class ProductSet {
	private ProductVO product;
	private ArrayList<ReviewVO> reviewdata;
	
	public ProductVO getProduct() {
		return product;
	}
	public void setProduct(ProductVO product) {
		this.product = product;
	}
	public ArrayList<ReviewVO> getReviewdata() {
		return reviewdata;
	}
	public void setReviewdata(ArrayList<ReviewVO> reviewdata) {
		this.reviewdata = reviewdata;
	}
	@Override
	public String toString() {
		return "ProductSet [product=" + product + ", reviewdata=" + reviewdata + "]";
	}
		
}
