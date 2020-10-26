package com.kh.mybatis.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.board.model.vo.Reply;
import com.kh.mybatis.board.model.vo.SearchCondition;
import com.kh.mybatis.common.vo.PageInfo;

public class BoardDao {
	
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> selectList(SqlSession sqlSession, PageInfo pi){
		
		// JSP/Servlet에서는 쿼리문에서 오라클에서 제공하는 ROWNUM 컬럼을 통해서 조회했다면
		// 마이바티스에서는 페이징 처리를 위해 RowBounds라는 클래스를 제공함
		// RowBounds => offset과 limit값을 넘겨 받아 페이징 처리를 보다 쉽게 구현할 객체
		
		// * offset : 조회할 때 몇개의 게시글을 건너뛰고 조회할지에 대한 수
		// * limit : 몇개씩 조회할껀지 (pi.getBoardLimit() == 5)
		
		//						   offset				  limit
		// currentPage=1	1~5		"0"개의 게시글 건너뛰고 1부터 "5"개 조회
		// currentPage=2	6~10	"5"개의 게시글 건너뛰고 6부터 "5"개 조회
		// currentPage=3	11~15	"10"개의 게시글 건너뛰고 11부터 "5"개 조회
		// currentPage=4	16~20	"15"개의 게시글 건너뛰고 16부터 "5"개 조회
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
		return list;
		
	}           
	
	public int selectSearchListCount(SqlSession sqlSession, SearchCondition sc) {
		
		return sqlSession.selectOne("boardMapper.selectSearchListCount",sc);
		
	}
	
	public ArrayList<Board> selectSearchList(SqlSession sqlSession, SearchCondition sc, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", sc, rowBounds);
		return list;
		
	}
	
	public int updateCount(SqlSession sqlSession, int bno) {
		
		return sqlSession.update("boardMapper.updateCount", bno);
				
	}
	
	public Board selectBoard(SqlSession sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.selectBoard",bno);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSession sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList",bno);
	}
	
	
	
}
