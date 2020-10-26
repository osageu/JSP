package com.kh.mybatis.board.model.service;

import java.util.ArrayList;

import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.board.model.vo.Reply;
import com.kh.mybatis.board.model.vo.SearchCondition;
import com.kh.mybatis.common.vo.PageInfo;

public interface BoardService {
	
	// 1. 총 게시글 조회
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	
	// 2. 검색 요청
	int selectSearchListCount(SearchCondition sc);
	ArrayList<Board> selectSearchList(SearchCondition sc, PageInfo pi);
	
	// 3. 게시판 상세조회
	int updateCount(int bno);
	Board selectBoard(int bno);
	ArrayList<Reply> selectReplyList(int bno);
	
	
}
