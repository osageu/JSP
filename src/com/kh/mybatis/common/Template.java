package com.kh.mybatis.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template {

	public static SqlSession getSqlSession() {
		
		SqlSession sqlSession = null;
		
		// 읽어들이고자하는 외부문서 (mybatis-config.xml)와의 통로
		// mybatis에서 제공하는 util class인 Resources라는 클래스를 가지고 파일 불러오기
		try {
			InputStream stream = Resources.getResourceAsStream("/mybatis-config.xml");
			sqlSession = new SqlSessionFactoryBuilder().build(stream).openSession(false);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return sqlSession;
		
	}
	
}
