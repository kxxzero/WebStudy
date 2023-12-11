package com.sist.dbcp;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;
public class CreateDBCPConnection {

	// 미리 연결된 Connection 주소를 찾아옴
	public Connection getConnection()
	{
		Connection conn=null; // 지역 변수이기 때문에 초기화 필요 / 전역 변수는 자동 초기화
		try
		{
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {}	
		return conn;
	}
	
	// 반환
	public void disConnection(Connection conn, PreparedStatement ps)
	{
		try {
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
}
