package net.review.db;

import java.sql.Date;

public class ReviewBean {
private int REVIEW_NUM;
private String REVIEW_ID;
private String REVIEW_SUBJECT;
private String REVIEW_CONTENT;
private String REVIEW_IMAGE;
private int READCOUNT;
private Date REVIEW_DATE;



public int getREVIEW_NUM() {
	return REVIEW_NUM;
}
public void setREVIEW_NUM(int rEVIEW_NUM) {
	REVIEW_NUM = rEVIEW_NUM;
}
public String getREVIEW_ID() {
	return REVIEW_ID;
}
public void setREVIEW_ID(String rEVIEW_ID) {
	REVIEW_ID = rEVIEW_ID;
}
public String getREVIEW_SUBJECT() {
	return REVIEW_SUBJECT;
}
public void setREVIEW_SUBJECT(String rEVIEW_SUBJECT) {
	REVIEW_SUBJECT = rEVIEW_SUBJECT;
}
public String getREVIEW_CONTENT() {
	return REVIEW_CONTENT;
}
public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
	REVIEW_CONTENT = rEVIEW_CONTENT;
}
public String getREVIEW_IMAGE() {
	return REVIEW_IMAGE;
}
public void setREVIEW_IMAGE(String rEVIEW_IMAGE) {
	REVIEW_IMAGE = rEVIEW_IMAGE;
}
public int getREADCOUNT() {
	return READCOUNT;
}
public void setREADCOUNT(int rEADCOUNT) {
	READCOUNT = rEADCOUNT;
}
public Date getREVIEW_DATE() {
	return REVIEW_DATE;
}
public void setREVIEW_DATE(Date rEVIEW_DATE) {
	REVIEW_DATE = rEVIEW_DATE;
}




}
