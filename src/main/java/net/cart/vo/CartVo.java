package net.cart.vo;

public class CartVo {
	
	
	private String	USER_ID;
	private int cart_num;
	private int CART_QUANTITY;
	private int cart_price;
	private int cart_seq;
	private String	PRO_NAME;
	private String	PRO_KIND;
	private int		PRO_PRICE;
	private String	PRO_CONTENT;
	private String	PRO_IMAGE;
	private int		PRO_SEQ;
	private int 	PRO_NUM;
	
	
	
	
	public int getCART_QUANTITY() {
		return CART_QUANTITY;
	}
	public void setCART_QUANTITY(int cART_QUANTITY) {
		CART_QUANTITY = cART_QUANTITY;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public int getPRO_NUM() {
		return PRO_NUM;
	}
	public void setPRO_NUM(int pRO_NUM) {
		PRO_NUM = pRO_NUM;
	}
	public String getPRO_NAME() {
		return PRO_NAME;
	}
	public void setPRO_NAME(String pRO_NAME) {
		PRO_NAME = pRO_NAME;
	}
	public String getPRO_KIND() {
		return PRO_KIND;
	}
	public void setPRO_KIND(String pRO_KIND) {
		PRO_KIND = pRO_KIND;
	}
	public int getPRO_PRICE() {
		return PRO_PRICE;
	}
	public void setPRO_PRICE(int pRO_PRICE) {
		PRO_PRICE = pRO_PRICE;
	}
	public String getPRO_CONTENT() {
		return PRO_CONTENT;
	}
	public void setPRO_CONTENT(String pRO_CONTENT) {
		PRO_CONTENT = pRO_CONTENT;
	}
	public String getPRO_IMAGE() {
		return PRO_IMAGE;
	}
	public void setPRO_IMAGE(String pRO_IMAGE) {
		PRO_IMAGE = pRO_IMAGE;
	}
	public int getPRO_SEQ() {
		return PRO_SEQ;
	}
	public void setPRO_SEQ(int pRO_SEQ) {
		PRO_SEQ = pRO_SEQ;
	}
	public int getCart_num() {
		return cart_num;
	}


	public int getCart_price() {
		return cart_price;
	}
	public int getCart_seq() {
		return cart_seq;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	

	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
	public void setCart_seq(int cart_seq) {
		this.cart_seq = cart_seq;
	}
	
}
