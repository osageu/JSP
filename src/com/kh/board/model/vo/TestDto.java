package com.kh.board.model.vo;

public class TestDto {
	
	// field
	private int testNo;
	private String testName;
	private String testPhone;
	
	// constructor
	public TestDto() {
		
	}
	public TestDto(int testNo, String testName, String testPhone) {
		super();
		this.testNo = testNo;
		this.testName = testName;
		this.testPhone = testPhone;
	}
	
	// method
	public int getTestNo() {
		return testNo;
	}
	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public String getTestPhone() {
		return testPhone;
	}
	public void setTestPhone(String testPhone) {
		this.testPhone = testPhone;
	}
	@Override
	public String toString() {
		return "TestDto [testNo=" + testNo + ", testName=" + testName + ", testPhone=" + testPhone + "]";
	}
}
