package com.mori.domain.japanese;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.mori.util.DBManager;

public class JapaneseDao {
	private JapaneseDao() {}
	private static JapaneseDao instance = new JapaneseDao();
	
	public static JapaneseDao getInsance() {
		return instance;
	}
	
	
	// 문제 추가
	public int setJapaneseTest(String que, String sel1, String sel2, String sel3, String sel4, int correct) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "insert into tbl_japanese(idx, que, sel1, sel2, sel3, sel4, correct) values(tbl_japanese_test1_idx_seq.nextval,"
				+ "?, ?, ?, ?, ?, ?)";
		
		
		int row = 0;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, que);
			pstmt.setString(2, sel1);
			pstmt.setString(3, sel2);
			pstmt.setString(4, sel3);
			pstmt.setString(5, sel4);
			pstmt.setInt(6, correct);
			row = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}return row;
	}
	
	
	// 저장된 문제 총 수 가져오기
	public int getJapaneseCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from tbl_japanese";
		
		int row = 0;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				row = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}return row;
	}
	
	
	// 문제  가져오기
	public JapaneseVo getJapanese(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from tbl_japanese where idx = ?";
		
		JapaneseVo vo = new JapaneseVo();
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setQue(rs.getString("que"));
				vo.setSel1(rs.getString("sel1"));
				vo.setSel2(rs.getString("sel2"));
				vo.setSel3(rs.getString("sel3"));
				vo.setSel4(rs.getString("sel4"));
				vo.setCorrect(rs.getInt("correct"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}return vo;
	}
	
	
	// 문제 랜덤으로 가져오기
	public List<JapaneseVo> getJapaneseTest() {
		
		List<JapaneseVo> list = new ArrayList<JapaneseVo>();
		
		Random random = new Random();
		
		JapaneseDao dao = JapaneseDao.getInsance();
		int totcount = dao.getJapaneseCount();
		
		int que1 = 0;
		int que2 = 0;
		int que3 = 0;
		
		while(true) {
			que1 = random.nextInt(totcount) +1;
			que2 = random.nextInt(totcount) +1;
			que3 = random.nextInt(totcount) +1;
			if(que1 != que2 && que1 != que3 && que2 != que3) {
				break;
			}
		}
		
		System.out.println(que1);
		System.out.println(que2);
		System.out.println(que3);
		
		JapaneseVo vo1 = dao.getJapanese(que1);
		JapaneseVo vo2 = dao.getJapanese(que2);
		JapaneseVo vo3 = dao.getJapanese(que3);
		
		list.add(vo1);
		list.add(vo2);
		list.add(vo3);
		
		return list;
		
	}
}
