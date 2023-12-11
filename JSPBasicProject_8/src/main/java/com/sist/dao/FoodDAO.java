package com.sist.dao;
// Food 관련 DAO 모음
import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.*;

public class FoodDAO {

	// 1. 연결 객체
	private Connection conn;
	
	// 2. SQL 송수신
	private PreparedStatement ps;
	
	// 3. DBCP
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	
	// 4. Singleton
	private static FoodDAO dao;
	
	// ===== 기능 =====
	
	// 1. 카테고리 읽기
	public List<FoodCategoryVO> food_category_data()
	{
		List<FoodCategoryVO> list=new ArrayList<FoodCategoryVO>();
		
		try
		{
			// 1. 주소값 읽어오기(오라클 연결)
			conn=dbconn.getConnection();
			
			// 2. SQL => 문장 설정
			String sql="SELECT cno, subject, title, poster "
					+ "FROM food_category "
					+ "ORDER BY cno ASC";
			
			// 3. SQL 전송
			ps=conn.prepareStatement(sql);
			
			// 4. 실행 요청 후 => 결과값 요청
			ResultSet rs=ps.executeQuery();
			
			// 5. 저장된 데이터를 모음 => 브라우저로 전송
			while(rs.next()) // 출력한 첫번째 위치에 커서를 이동 (기본적으로 맨 마지막 데이터에 커서가 위치하고 있기 때문) => 데이터가 없을 때까지 읽기
			{
				FoodCategoryVO vo=new FoodCategoryVO();
				vo.setCno(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setPoster(rs.getString(4));
				list.add(vo);
				// ROW => 매칭(VO, Bean)
			}
			rs.close();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();	
		}
		finally
		{
			// 반환
			dbconn.disConnection(conn, ps);
		}
		
		return list;
	}
	
	// 2. 로그인 => Session(핵심)
	
	// 3. 메뉴 변경 => Session
	
	// 4. 전체 데이터 읽기
	public List<FoodVO> foodAllData(int page)
	{
		List<FoodVO> list=new ArrayList<FoodVO>();
		
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT fno, name, poster, num "
					+ "FROM (SELECT fno, name, poster, rownum as num "
					+ "FROM (SELECT fno, name, poster "
					+ "FROM food_menu_house ORDER BY fno ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);				
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			dbconn.disConnection(conn, ps);
		}
		
		return list;
	}
	
	// 5. 전체 데이터 총 페이지
	public int foodAllTotalPage()
	{
		int total=0;
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					+ "FROM food_menu_house";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			dbconn.disConnection(conn, ps);
		}
		return total;
	}
	
	// 6. 검색 데이터 읽기
	
	// 7. 검색 데이터 총 페이지
	
}
