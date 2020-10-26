package com.kh.mybatis.board.model.vo;

public class SearchCondition {
	
	// field
	private String writer;
	private String title;
	private String content;
	
	// constructor
	public SearchCondition() {
		super();
	}
	public SearchCondition(String writer, String title, String content) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
	}
	
	// method
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "SearchCondition [writer=" + writer + ", title=" + title + ", content=" + content + "]";
	}
	
	
}
