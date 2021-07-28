package service.test;

import java.sql.*;
import java.util.List;

import com.wintersoldier.util.DBManager;


public class WordDAO {
	private WordDAO() {
	}

	private static WordDAO instance = new WordDAO();

	public static WordDAO getInstance() {
		return instance;
	}
	public WordVO getword(int lv,int num) {
		WordVO vo = new WordVO();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select word,explan from tbl_word where lv=? , num=? ";
		try {
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lv);
			pstmt.setInt(2, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setWord(rs.getString(1));
				vo.setExplain(rs.getString(2));
			}
		}catch(Exception e) {
			try {
				DBManager.close(conn, pstmt, rs);
			}catch(Exception ee){}
			
		}
		
		return vo;
	}
	public void setword(List<String> word,List<String> explain,int lv) {
		WordVO vo = new WordVO();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="insert into tbl_word(num,word,explain,lv) values(tbl_word_sequence.nextval,?,?,?)";
		try {
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			for(int i=0; i<word.size(); i++) {
				pstmt.setString(1, word.get(i));
				pstmt.setString(2, explain.get(i));
				pstmt.setInt(3, lv);
			}
		
		}catch(Exception e) {
			try {
				DBManager.close(conn, pstmt, rs);
			}catch(Exception ee){}
			
		}
		
	}
}
