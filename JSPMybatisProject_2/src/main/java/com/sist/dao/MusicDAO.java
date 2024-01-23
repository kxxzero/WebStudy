package com.sist.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
// musicFindData
public class MusicDAO {
	private static SqlSessionFactory ssf;
	/* 	<bean id="ssf" class="SqlSessionFactory">
			<property name="config" value="Config.xml">
		</bean>
	 */
	
	// 초기화 => XML을 파싱(태그 안의 데이터를 가져오는 것)
	static { // static => 시작하자마자 자동으로 인식
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			// myBatis에서 제공하는 태그와 속성만 사용해야 함
			// 제공하는 태그는 dtd에 선언되어 있음
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public static List<MusicVO> musicFindData(Map map){
		SqlSession session=null;
		List<MusicVO> list=new ArrayList<MusicVO>();
		
		try {
			session=ssf.openSession();
			list=session.selectList("musicFindData", map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		
		return list;
	}
}
