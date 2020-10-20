package com.kh.mybatis.member.model.service;

import com.kh.mybatis.member.model.vo.Member;

public interface MemberService { // 모든 필드 == 상수 필드, 모든 메소드 == 추상 메소드
	
	// MemberService라는 인터페이스를 실체화(implements)하는 자식 클래스에서 본격적으로 완성 시켜야 됨
	
	// 1. 회원가입
	int insertMember(Member m);
	
	// 2. 로그인 
	Member loginMember(Member m);
	
	// 3. 회원정보수정 
	int updateMember(Member m);
	
	// 4. 회원탈퇴 
	int deleteMember(Member m);
	
	// 5. id찾기 
	
	
	// 6. pwd변경  
	
	
	
	
	
	
	
	
}
