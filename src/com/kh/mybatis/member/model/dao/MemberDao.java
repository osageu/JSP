package com.kh.mybatis.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.member.model.vo.Member;

public class MemberDao {
	
	public int insertMember(SqlSession sqlSession, Member m) {
		
		// sqlSession 객체에서 제공하는 어떤 메소드를 통해서 실행한 후 결과값 바로 받아냄
		// insert("sql",[?를 채울 객체]
		// 유의할 점 : 해당 mapper파일 mybatis-config문서에 등록되어야됨!!
		int result = sqlSession.insert("memberMapper.insertMember",m);
		return result;
	}
	
	public Member loginMember(SqlSession sqlSession, Member m) {
		Member loginUser = sqlSession.selectOne("memberMapper.loginMember",m);
		return loginUser;
	}
	
	
}
