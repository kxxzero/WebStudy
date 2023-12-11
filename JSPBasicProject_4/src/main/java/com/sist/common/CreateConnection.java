package com.sist.common;

import java.util.*;
import java.sql.*;
public class CreateConnection {

	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	public CreateConnection()
	{
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		
	}
	
	public Connection getConnection()
	{
		Connection conn=null;
		try
		{
			conn=DriverManager.getConnection(URL, "hr", "happy");
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		return conn;
	}
	
	public void disConnection(Connection conn, PreparedStatement ps)
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
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
	}
}
