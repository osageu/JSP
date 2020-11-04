package com.kh.spring.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PageInfo {
	
	// field
	private int listCount;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int maxPage;
	private int pageLimit;
	private int boardLimit;
	
	
	
	
	
	
	
	
	
	
	
}
