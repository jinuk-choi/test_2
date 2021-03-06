package com.test.project.domain;

public class Board {
	private int aIdx;
	private int uIdx;
	private String aTitle;
	private String aContent;
	private String aDate;
	private int rownum;
	private User user;
	private Pagination pagination;
	private int aGroup;
	private int aOrder;
	private int aDepth;
	
	
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
	public int getaGroup() {
		return aGroup;
	}
	public void setaGroup(int aGroup) {
		this.aGroup = aGroup;
	}
	public int getaOrder() {
		return aOrder;
	}
	public void setaOrder(int aOrder) {
		this.aOrder = aOrder;
	}
	public int getaDepth() {
		return aDepth;
	}
	public void setaDepth(int aDepth) {
		this.aDepth = aDepth;
	}
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	private int aCount;
	
	
	public int getaCount() {
		return aCount;
	}
	public void setaCount(int aCount) {
		this.aCount = aCount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getaIdx() {
		return aIdx;
	}
	public void setaIdx(int aIdx) {
		this.aIdx = aIdx;
	}
	public String getaTitle() {
		return aTitle;
	}
	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getaDate() {
		return aDate;
	}
	public void setaDate(String aDate) {
		this.aDate = aDate;
	}
	
	@Override
	public String toString() {
		return "Board [aIdx=" + aIdx + ", uIdx=" + uIdx + ", aTitle=" + aTitle + ", aContent=" + aContent + ", aDate="
				+ aDate + ", rownum=" + rownum + ", user=" + user + ", aGroup=" + aGroup + ", aOrder=" + aOrder
				+ ", aDepth=" + aDepth + ", aCount=" + aCount + "]";
	}

}
