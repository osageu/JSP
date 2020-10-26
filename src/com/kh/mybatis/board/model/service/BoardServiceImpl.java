package com.kh.mybatis.board.model.service;

import static com.kh.mybatis.common.Template.getSqlSession;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.board.model.dao.BoardDao;
import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.board.model.vo.Reply;
import com.kh.mybatis.board.model.vo.SearchCondition;
import com.kh.mybatis.common.vo.PageInfo;

public class BoardServiceImpl implements BoardService {

	private BoardDao bDao = new BoardDao();
	
	@Override
	public int selectListCount() {
		
		SqlSession sqlSession = getSqlSession();
		int listCount = bDao.selectListCount(sqlSession);
		sqlSession.close();
		return listCount;
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		SqlSession sqlSession = getSqlSession();
		ArrayList<Board> list = bDao.selectList(sqlSession,pi);
		sqlSession.close();
		return list;
	}

	@Override
	public int selectSearchListCount(SearchCondition sc) {
		
		SqlSession sqlSession = getSqlSession();
		int listCount = bDao.selectSearchListCount(sqlSession, sc);
		sqlSession.close();
		return listCount;
	}

	@Override
	public ArrayList<Board> selectSearchList(SearchCondition sc, PageInfo pi) {
		SqlSession sqlSession = getSqlSession();
		ArrayList<Board> list = bDao.selectSearchList(sqlSession, sc, pi);
		sqlSession.close();
		return list;
	}

	@Override
	public int updateCount(int bno) {
		SqlSession sqlSession = getSqlSession();
		int result = bDao.updateCount(sqlSession, bno);
		if(result > 0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}

	@Override
	public Board selectBoard(int bno) {
		SqlSession sqlSession = getSqlSession();
		Board b = bDao.selectBoard(sqlSession, bno);
		sqlSession.close();
		return b;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		SqlSession sqlSession = getSqlSession();
		ArrayList<Reply> list = bDao.selectReplyList(sqlSession, bno);
		sqlSession.close();
		return list;
	}
	
}
