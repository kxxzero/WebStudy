package com.sist.dao;

import java.util.*;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.SeoulVO;

import java.sql.*;
public class SeoulDAO {

	private Connection conn; // 데이터베이스 연결
	private PreparedStatement ps; // SQL 전송 후 결과값 받기
	private static SeoulDAO dao;
	
	// DBCP 라이브러리
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	
	private final int ROWSIZE=12;
	
	// 1. 기능 : 명소 => seoul_location
	public List<SeoulVO> seoulLocationListData(int page, String tab)
	{
		List<SeoulVO> list=new ArrayList<SeoulVO>();
		
		try
		{
			// 1. 연결
			conn=dbconn.getConnection();
			
			// 2. SQL 문장 전송
			String sql="SELECT no, title, poster, num "
					+ "FROM (SELECT no, title, poster, rownum as num "
					+ "FROM (SELECT no, title, poster "
					+ "FROM "+tab+" ORDER BY no ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			
			// 3. 미리 전송
			ps=conn.prepareStatement(sql);
			
			// 4.
			int start= (ROWSIZE*page)-(ROWSIZE-1);
			int end=ROWSIZE*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			// 5. 실행 후 결과값을 받음
			ResultSet rs=ps.executeQuery();
			while(rs.next()) // 출력 1번째 위치부터 읽기 시작
			{
				SeoulVO vo=new SeoulVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			// 에러 출력
			ex.printStackTrace();
		}finally{
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int seoulLocationTotalPage(String tab)
	{
		int total=0;
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					+ "FROM "+tab;
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
	
	// 2. 기능 : 자연 => seoul_nature
	
	// 3. 기능 : 쇼핑 => seoul_shop
}
