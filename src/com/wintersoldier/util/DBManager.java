package com.wintersoldier.util;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	public static Connection getConnection() {
		Connection conn = null;
//		String myDriver = "oracle.jdbc.driver.OracleDriver";
//		String myUrl = "jdbc:oracle:thin:@localhost:1521:xe";
//		String myId = "jslhrd46";
//		String myPass = "1234";
//		
//		try {
//			Class.forName(myDriver);
//			conn = DriverManager.getConnection(myUrl, myId, myPass);
//		}catch(Exception e){
//			e.printStackTrace();
//		}	
//		return conn;
		
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			
			conn = ds.getConnection();

		}catch(Exception e) {e.printStackTrace();}
		
		return conn;
	}
	
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
