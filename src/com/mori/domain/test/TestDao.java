package com.mori.domain.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jslhrd.domain.community.CommunityDto;
import com.wintersoldier.util.DBManager;

public class TestDao {
	private TestDao() {

	}

	private static TestDao instance = new TestDao();

	public static TestDao getInstance() {
		return instance;
	}

	public int TestCount(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int row = 0;
		String query = "select count(*) from tbl_test where idx=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				row = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}
	
	
	public List<TestDto> TestList(int idx, int startpage, int endpage) {
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;

	      List<TestDto> list = new ArrayList<TestDto>();
	      TestDto dto = null;

	      String query = "select X.* from (select rownum as rnum, A.* from (select * from tbl_test where idx=? order by idx desc) A where rownum<=?) X where rnum>=?";
	      try {
	         conn = DBManager.getConnection();
	         psmt = conn.prepareStatement(query);
	         psmt.setInt(1, idx);
	         psmt.setInt(2, endpage);
	         psmt.setInt(3, startpage);
	         rs = psmt.executeQuery();
	         while (rs.next()) {
	        	dto = new TestDto();
	            dto.setRnum(rs.getInt("rnum"));
	            dto.setLv(rs.getString("lv"));
	            dto.setScore(rs.getInt("score"));
	            dto.setDay(rs.getString("day"));
	            list.add(dto);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, psmt, rs);
	      }
	      return list;
	   }
}
