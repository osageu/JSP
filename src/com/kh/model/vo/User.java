package com.kh.model.vo;

public class User {
	
	// field
	private int userNo;
	private String userName;
	private int age;
	private char gender;
	
	// constructor
	public User() {
		
	}
	public User(int userNo, String userName, int age, char gender) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.age = age;
		this.gender = gender;
	}
	
	// method
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userName=" + userName + ", age=" + age + ", gender=" + gender + "]";
	}
	
}

