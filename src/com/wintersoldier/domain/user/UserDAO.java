package com.wintersoldier.domain.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.wintersoldier.util.DBManager;




public class UserDAO {
	private UserDAO() {}
	private static UserDAO instance = new UserDAO();
    
	public static UserDAO getInstance() {
		return instance;
	}

//	public int userInsert(UserVO vo) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		int row = 0;
//		String query = "insert into tbl_users_sec(name, userid, passwd, tel, email, first_time,accessnum) "
//				+ "values(?, ?,?,?,?,SYSDATE,4)";
//		try {
//			// conn = getConnection();
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, vo.getName());
//			pstmt.setString(2, vo.getUserid());
//			pstmt.setString(3, vo.getPasswd());
//			pstmt.setString(5, vo.getEmail());
//			row = pstmt.executeUpdate();
//			
//
//		}catch (Exception e) {
//			// TODO: handle exception
//		}finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//		
//		return row;
//	}
//	
//	public int userCheck(String userid) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		int row = 0;
//		String query = "select userid from tbl_users_sec where userid=?";
//			
//		try {
//			// conn = getConnection();
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, userid);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				row = 1;
//			}
//			
//		}catch (Exception e) {
//			// TODO: handle exception
//		}finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//		
//		return row;
//	}
	
	
	public int userLogin(String userid, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int row = 0;
		
//		String query = "select count(*) from tbl_users where userid=? and passwd=?";
		String query ="select passwd from tbl_user where userid=?";
			
		try {
			// conn = getConnection();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbpass = rs.getString("passwd");
				if(dbpass.equals(passwd)) {
					pstmt.close();
					UserDAO dao = UserDAO.getInstance();
					UserVO vo = dao.userSelect(userid);
					SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
					Date date = new Date();
					String time = format1.format(date).substring(0,10);
					String recent = "0";
					if(vo.getRecent() != null) {
						recent = vo.getRecent().substring(0,10);
					}
					if(recent.equals(time)) {
						
						query = "update tbl_user set recent=sysdate where userid=?";
					}else {
						System.out.println("오늘 최초 로그인, 포인트 + 50");
						query = "update tbl_user set recent=sysdate, point=point+50 where userid=?";
					}
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, userid);
					pstmt.executeUpdate();
					row = 1; // 성공
				}else {
					row = 0; // 비번 x
				}
			}else {
				row=-1; // id 존재 x
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return row;
	}
	
	public UserVO userSelect(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		UserVO vo = new UserVO();
		String query = "select * from tbl_user where userid=?";
			
		try {
			// conn = getConnection();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setUserid(rs.getString("userid"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setEmail(rs.getString("email"));
				vo.setAddress(rs.getString("address"));
				vo.setTell(rs.getString("tell"));
				vo.setJob(rs.getString("job"));
				vo.setTest(rs.getInt("test"));
				vo.setEmailck(rs.getInt("emailck"));
				vo.setPoint(rs.getInt("point"));
				vo.setEmployee(rs.getString("employee"));
				vo.setResidence(rs.getInt("residence"));
				vo.setEmployee(rs.getString("employee"));
				vo.setFilename(rs.getString("filename"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setRecent(rs.getString("recent"));
				vo.setLv(rs.getInt("lv"));
				vo.setInterest(rs.getString("interest"));
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	public String userSelect(String username, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String userid=null;
		String query = "select * from tbl_user where name=? and email=?";
			
		try {
			// conn = getConnection();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, username);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userid = rs.getString("userid");
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return userid;
	}
	
	public int userModify(String newpasswd, String tel, String job, String interest, String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int row = 0;
		String query = "update tbl_user set passwd=?,tell=?,job=?,interest=? where userid=?";
		try {
			// conn = getConnection();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newpasswd);
			pstmt.setString(2, tel);
			pstmt.setString(3, job);
			pstmt.setString(4, interest);
			pstmt.setString(5, userid);
			row = pstmt.executeUpdate();
			

		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return row;
	}
	
	public int userNewPass(String userid, String pass, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int row = 0;
		String query = "update tbl_user set passwd=? where userid=? and email=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pass);
			pstmt.setString(2, userid);
			pstmt.setString(3, email);
			row = pstmt.executeUpdate();
			System.out.println(row);

		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return row;
	}
	
	
	public int userDelete(String userid, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int row = 0;
		String query = "DELETE from tbl_user where userid=? and passwd=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, pass);
			row = pstmt.executeUpdate();
			System.out.println(row);

		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return row;
	}
	
}
