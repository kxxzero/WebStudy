package com.sist.dao;
/*
 * DBCP => 미리 Connection을 연결 => POOL 안에 저장
 * 사용 후에 다시 POOL 안에 반환 => 재사용
 * Connection 생성을 제한 => 연결 시간을 줄일 수 있음
 * 웹 개발을 하는 대부분의 업체는 DBCP를 사용
 * MyBtis / JPA의 기본은 DBCP
 */

import java.util.*;
import java.sql.*;
import javax.sql.*; // 데이터베이스에서 정보를 받아옴 => DataSource
import javax.naming.*; // Context : 이름으로 객체를 찾음

public class FoodDAO {
	// has-a => 포함 클래스
	private Connection conn; // 오라클 연결 객체
	// 오라클 서버와 연결하는 Socket
	private PreparedStatement ps; // 송수신 = > SQL을 전송하고 결과값을 받음
	// OutputStream / BufferedReader
	private static FoodDAO dao; // 클라이언트 1명당 1개만 사용 가능
	// 싱글턴 => 메모리 누수 방식 => DAO 싱글턴은 무조건 static(1개만 할당)을 사용
	// 미리 연결된 주소값 얻기
	
	// 메소드는 1개의 기능 수행 => 재사용, 반복 기능 제거
	// 메소드 여러 개가 반복적으로 사용되는 경우 => 클래스화 => jar
	/*
	 * 예약
	 * 	----------
	 * 	게스트하우스 1
	 * 	호텔 2
	 * 	맛집 3
	 * 	영화 4
	 * 	---------- 1개의 테이블 : 구분자 => 1개의 메소드로 모두 처리 가능
	 */
	public void getConnection()
	{
		try
		{
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {}
	}
	
	// 반환
	public void disConnection()
	{
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
	
	// 싱글턴
	public static FoodDAO newInstance()
	{
		if(dao==null)
		{
			dao=new FoodDAO();
		}
		return dao;
	}
	// => 여기까지가 DAO 제작의 필수 사항
	
	
	
	// 기능 설정
	public List<FoodVO> foodListData(int page)
	{
		List<FoodVO> list=new ArrayList<FoodVO>();
		try
		{
			// 1. 주소값을 얻어옴
			getConnection();
			
			// 2. SQL 문장
			String sql="SELECT fno, name, poster, num "
					+ "FROM (SELECT fno, name, poster, rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC(food_location pk_food_location) */ fno, name, poster "
					+ "FROM food_location)) "
					+ "WHERE num BETWEEN ? AND ?"; // 오라클에서 잘라서 페이지를 나누는 형식
			ps=conn.prepareStatement(sql); // 오라클로 전송
			int rowSize=12; // 1page => 1~12, 13~24...
			int start=(rowSize*page)-(rowSize-1); // rownum => 1번부터 시작
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			// 실행 요청
			ResultSet rs=ps.executeQuery();
			while(rs.next()) // 첫번째 row에서부터 읽어서 마지막까지 읽음
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				
				String poster=rs.getString(3);
				poster=poster.substring(0, poster.indexOf("^")); // 맨 앞의 사진 1장만 잘라옴
				
				vo.setPoster(poster);
				list.add(vo);
			}
		}catch(Exception ex) {
			// 에러 확인
			ex.printStackTrace();
		}
		finally {
			// 반환 => 재사용(다른 사람이 사용 가능)
			disConnection();
		}
		return list;
	}
	
	// 총 페이지
	public int foodTotalPage()
	{
		int total=0;
		try
		{
			// 주소 얻기
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					+ "FROM food_location";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally
		{
			// 반환
			disConnection();
		}
		return total;
	}
	
	// 상세보기 
    public FoodVO foodDetailData(int fno)
    {
	   FoodVO vo=new FoodVO();
	   try
	   {
		   getConnection();
		   String sql="UPDATE food_location SET "
				     +"hit=hit+1 "
				     +"WHERE fno="+fno;
		   ps=conn.prepareStatement(sql);
		   ps.executeUpdate(); // commit을 포함 => INSERT/UPDATE/DELETE
		   // SELECT => 실행된 결과를 읽어 온다 => executeQuery
		   // 실제 데이터를 가지고 온다 
		   sql="SELECT fno,name,score,address,tel,poster,type,price,parking,menu,time "
			  +"FROM food_location "
			  +"WHERE fno="+fno;
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setFno(rs.getInt(1));
		   vo.setName(rs.getString(2));
		   vo.setScore(rs.getDouble(3));
		   vo.setAddress(rs.getString(4));
		   vo.setPhone(rs.getString(5));
		   vo.setPoster(rs.getString(6));
		   vo.setType(rs.getString(7));
		   vo.setPrice(rs.getString(8));
		   vo.setParking(rs.getString(9));
		   vo.setMenu(rs.getString(10));
		   vo.setTime(rs.getString(11));
		   
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return vo;
    }
}
