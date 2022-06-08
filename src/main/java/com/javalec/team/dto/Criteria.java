package com.javalec.team.dto;

public class Criteria {
	/* ���� ������ */
	private int pageNum;
	
	/* �� ������ �� ������ �Խù� ���� */
	private int amount;
	
	private String q_email;
	
	public Criteria() {
		this(1, 10, null);
	}

	public Criteria(int pageNum, int amount, String q_email) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.q_email = q_email;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getQ_email() {
		return q_email;
	}

	public void setQ_email(String q_email) {
		this.q_email = q_email;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", q_email=" + q_email + "]";
	}
	
	
	

//    public class Criteria {
//    	/* ���� ������ */
//    	private int pageNum;
//    	
//    	/* �� ������ �� ������ �Խù� ���� */
//    	private int amount;
//    	
//    	
//    	/* �⺻ ������ -> �⺻ ���� : pageNum =1, amount = 10 */
//    	public Criteria() {
//    		this(1,10);
//    	}
//    	
//    	/* ������ => ���ϴ� pageNum, ���ϴ� amount */
//    	public Criteria(int pageNum, int amount) {
//    		this.pageNum = pageNum;
//    		this.amount = amount;
//    	}
//    	
//    	public int getPageNum() {
//    		return pageNum;
//    	}
//    	
//    	public void setPageNum(int pageNum) {
//    		this.pageNum = pageNum;
//    	}
//    	
//    	public int getAmount() {
//    		return amount;
//    	}
//    	
//    	public void setAmount(int amount) {
//    		this.amount = amount;
//    	}
//    	
//    	@Override
//    	public String toString() {
//    		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + "]";
//    	}
}