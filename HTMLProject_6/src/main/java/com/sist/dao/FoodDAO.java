package com.sist.dao;

import java.util.*;
import java.sql.*; // Connection, ResultSet, PreparedStatement
import javax.sql.*; // 데이터베이스 정보 => DataSource
import javax.naming.*; // 문자열로 객체를 찾는 경우 => Context

// 이름으로 찾기
/*
 * = lookup() => getBean() (Spring) => 객체 찾기
 * 				=> 클래스 관리자(생성 ~ 소멸)
 * 				=> 자바 기반 => Kotlin
 * 				selectList() => SQL
 * 				=> SQL관리자 => Mapper 
 */

// JDBC => DBCP => ORM(2차 프로젝트 : MyBatis / 3차 프로젝트 : JPA)
// 1차 프로그램
/*
 * JDBC : 단점 => 속도가 느림(연결 = 해제 반복)
 * 						===== 오라클 연결 시 소모되는 시간이 많음
 * 		=> 연결 시간 줄이는 프로그램
 * 			===== 미리 Connection을 오라클 연결한 다음에 수행
 * 					=========================
 * 						저장 => POOL
 * 		=> Connection : 톰캣에 의해 관리
 * DBCP : DataBase Connection Pool
 * 		=> 연결(getConnection)
 * 		=> MyBatis / JPA => DBCP
 * 	1. 등록 : server.xml => 일반 개발자가 볼 수 없기 때문에 보안이 뛰어남
 * 		1) Connection을 연결
 * 			=> driverName, username, password, url
 * 			=> Connection을 몇 개 설정할 것인가 => maxIdle
 * 				=> 인원이 많아지는 경우 어떻게 처리할 것인가 => maxActive
 * 				=> 반환 => 재사용 => 기다리는 시간 => maxWait(음수면 무한정)
 * 	2. 동작 => 생성된 Connection 객체를 POOL(저장 장소)에 저장
 * 		1) 미리 생성된 Connection 객체를 POOL 안에서 얻어옴
 * 			=> POOL(JNDI : Java Naming Directory Interface => 이름으로 탐색기를 생성해 놓은 것)
 * 					=> 루트(C드라이버) => java://comp/env
 * 									====================
 * 										jdcb/orcle
 * 			// 탐색기를 열어줌
 * 			Context init=new InitialContext(); 
 * 			Context c=(Context)init.lookup("java://comp/env");
 * 			DataSource ds=(DataSource)c.lookip("java://comp/env");
 *			Connection conn=ds.getConnection();
 *
 *			// conn 사용
 *
 *			// conn 사용 후에 반환 => POOL
 *		
 *		*** 사용 목적
 *			- Conncetion의 생성 횟수를 줄일 수 있음 => 관리가 편함
 *			- 오라클 연결 시간을 줄암
 *			- Conncetion 생성을 제한할 수 있음 => 웹 서버가 쉽게 무너지지 않음
 *			- 웹 프로그램에서 DB 연결에 기본이 됨
 *			
 *			==============================
 *			new Connection() false => true
 *			==============================
 *			new Connection() false
 *			==============================
 *			new Connection() false
 *			==============================
 *		
 *
 * 			 
 */
public class FoodDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao; // 싱글턴 => 객체 1개
	// 메모리 누수 현상 방지 => GC
	
	// 1. 미리 생성된 Connection 주소 얻기
	public void getConnection()
	{
		try
		{
			Context init=new InitialContext();
			// POOL 연결
			Context c=(Context)init.lookup("java://comp/env");
			// DataBase의 정보를 얻어옴
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			// 연결
			conn=ds.getConnection();
		}catch(Exception ex) {}
	}
	
	// 2. 반환(재사용 가능)
	public void disConnection()
	{
		// 반환 => ps.close(), conn.close()
		// commons-dbcp, commons-pool
		try
		{
			if(ps!=null)
			{
				ps.close();
			}
			if(conn!=null)
			{
				conn.close();
			}
		}catch(Exception ex) {}
	}
	
	// 3. 싱글턴 생성
	// newInstance(), getInstance() => Singleton
	// => 메소드 호출 : 사용자가 보내둔 URL에 따라 자동 호출 => invoke()
	// => 메소드마다 구분 필요(인덱스) => 자바에서 어노테이션 
	public static FoodDAO newInstance()
	{
		if(dao==null)
		{
			dao=new FoodDAO();
		}
		return dao;
	}
	// =========================> 공통 사항
	// 4. 기능 처리 : SQL
	public List<CategoryVO> categoryListData(int cno)
	{
		List<CategoryVO> list=new ArrayList<CategoryVO>();
		
		try
		{
			getConnection();
			int start=0, end=0;
			// 믿고보는 맛집 리스트
			if(cno==1)
			{
				start=1;
				end=12;
			}
			// 지역별 맛집 리스트
			else if(cno==2)
			{
				start=13;
				end=18;
			}
			// 메뉴별 맛집 리스트
			else if(cno==3)
			{
				start=19;
				end=30;
			}
			
			String sql="SELECT con, title, poster, subject "
					+ "FROM food_category "
					+ "WHERE cno BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				CategoryVO vo=new CategoryVO();
				vo.setCno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setSubject(rs.getString(4));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		
		return list;
	}
	
	// 카테고리별 맛집 출력
	public CategoryVO categoryInfoData(int cno)
	{
		CategoryVO vo=new CategoryVO();
		try
		{
			// 주소 얻기
			getConnection();
			// SQL 문장 제작
			String sql="SELECT title, subject "
					+ "FROM food_category "
					+ "WHERE cno="+cno;
			// SQL 문장 전송
			ps=conn.prepareStatement(sql);
			// 결과값을 받음
			ResultSet rs=ps.executeQuery();
			rs.next();
			// vo에 저장 => 브라우저로 전송
			vo.setTitle(rs.getString(1));
			vo.setSubject(rs.getString(2));
			rs.close();			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		finally
		{
			// 반환
			disConnection();
		}
		return vo;
	}
	
	// 실제 카데고리별 맛집 읽기
	public List<FoodVO> foodListData(int cno)
	{
		List<FoodVO> list=new ArrayList<FoodVO>();
		try
		{
			getConnection();
			String sql="SELECT fno, cno, poster, name, score, address, phone, type "
					+ "FROM food_house "
					+ "WHERE cno="+cno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setCno(rs.getInt(2));
				String poster=rs.getString(3);
				poster=poster.substring(0, poster.indexOf("^"));
				vo.setPoster(poster);
				vo.setName(rs.getString(4));
				vo.setScore(rs.getDouble(5));
				String addr=rs.getString(6);
				addr=addr.substring(0, addr.indexOf("지번"));
				vo.setAddress(addr.trim());
				vo.setPhone(rs.getString(7));
				vo.setType(rs.getString(8));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return list;
	}
}
