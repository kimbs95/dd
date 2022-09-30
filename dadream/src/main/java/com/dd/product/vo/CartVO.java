package com.dd.product.vo;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {

	private int cart_Num;
	private int cart_BuytCount;
	private int product_Num;
	private String user_Id;

	public CartVO() {

	}

	public CartVO(int cart_Num, int cart_BuytCount, int product_Num, String user_Id) {
		super();
		this.cart_Num = cart_Num;
		this.cart_BuytCount = cart_BuytCount;
		this.product_Num = product_Num;
		this.user_Id = user_Id;
	}

	public int getCart_Num() {
		return cart_Num;
	}

	public void setCart_Num(int cart_Num) {
		this.cart_Num = cart_Num;
	}

	public int getCart_BuytCount() {
		return cart_BuytCount;
	}

	public void setCart_BuytCount(int cart_BuytCount) {
		this.cart_BuytCount = cart_BuytCount;
	}

	public int getProduct_Num() {
		return product_Num;
	}

	public void setProduct_Num(int product_Num) {
		this.product_Num = product_Num;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

}
