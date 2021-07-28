package com.mori.domain.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mori.util.DBManager;

public class CompanyInfoDao {
	private CompanyInfoDao() {
	}

	private static CompanyInfoDao instance = new CompanyInfoDao();

	public static CompanyInfoDao getInstance() {
		return instance;
	}

	// 공고 글 작성
	public int CompanyInfoInsert(CompanyInfoVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "insert into tbl_company_info"
				+ "(idx,category,loc,capital,estyear,employeenum,employtype,edulv,japaneselv,intro,"
				+ "address,homepage,salary,name,email,ceo)"
				+ " values(tbl_company_info_seq_idx.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int row = 0;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getCategory());
			pstmt.setString(2, vo.getLoc());
			pstmt.setInt(3, vo.getCapital());
			pstmt.setInt(4, vo.getEstyear());
			pstmt.setInt(5, vo.getEmployeenum());
			pstmt.setString(6, vo.getEmploytype());
			pstmt.setString(7, vo.getEdulv());
			pstmt.setString(8, vo.getJapaneselv());
			pstmt.setString(9, vo.getIntro());
			pstmt.setString(10, vo.getAddress());
			pstmt.setString(11, vo.getHomepage());
			pstmt.setInt(12, vo.getSalary());
			pstmt.setString(13, vo.getName());
			pstmt.setString(14, vo.getEmail());
			pstmt.setString(15, vo.getCeo());
			
			row = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBManager.close(conn, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}


	// 기업 공고 뷰
	public CompanyInfoVo companyInfoView(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from tbl_company_info where idx = ?";

		CompanyInfoVo vo = new CompanyInfoVo();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setCategory(rs.getString("category"));
				vo.setLoc(rs.getString("loc"));
				vo.setCapital(rs.getInt("capital"));
				vo.setEstyear(rs.getInt("estyear"));
				vo.setEmployeenum(rs.getInt("employeenum"));
				vo.setEmploytype(rs.getString("employtype"));
				vo.setEdulv(rs.getString("edulv"));
				vo.setJapaneselv(rs.getString("japaneselv"));
				vo.setIntro(rs.getString("intro"));
				vo.setAddress(rs.getString("address"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setSalary(rs.getInt("salary"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setCeo(rs.getString("ceo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return vo;
	}
	

	// 공고 내용 수정
	public int companyInfoModify(int idx, CompanyInfoVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "update tbl_company_info "
				+ "set category = ?, loc = ?, capital = ?, estyear = ?, employeenum = ?, employtype = ?, edulv = ?, japaneselv = ?, intro = ?, "
				+ "address = ?, homepage = ?, salary = ?, name = ?, email = ?, ceo = ? where idx = ?";
		
		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCategory());
			pstmt.setString(2, vo.getLoc());
			pstmt.setInt(3, vo.getCapital());
			pstmt.setInt(4, vo.getEstyear());
			pstmt.setInt(5, vo.getEmployeenum());
			pstmt.setString(6, vo.getEmploytype());
			pstmt.setString(7, vo.getEdulv());
			pstmt.setString(8, vo.getJapaneselv());
			pstmt.setString(9, vo.getIntro());
			pstmt.setString(10, vo.getAddress());
			pstmt.setString(11, vo.getHomepage());
			pstmt.setInt(12, vo.getSalary());
			pstmt.setString(13, vo.getName());
			pstmt.setString(14, vo.getEmail());
			pstmt.setString(15, vo.getCeo());
			pstmt.setInt(16, idx);
			
			row = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

	// 특정 공고 삭제
	public int companyInfoDelete(String idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "delete tbl_company_info where idx = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);

			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

	// 공고 총 수
	public int companyInfoCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from tbl_company_info";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
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

	// 검색 조건에 맞는 기업 공고 수를 구하는 메소드
	public int companyInfoCount(String s_sql) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from tbl_company_info " + s_sql;
		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
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

	// 공고 목록을 구하는 메소드(페이지 처리, 검색 기능 없음)
	public List<CompanyInfoVo> companyInfoList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<CompanyInfoVo> list = new ArrayList<CompanyInfoVo>();

		String sql = "select X.* from (select rownum as rnum, A.* from "
				+ "(select * from tbl_company_info order by idx desc) A " + " where rownum <= ?) X where X.rnum >=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CompanyInfoVo vo = new CompanyInfoVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setCategory(rs.getString("category"));
				vo.setLoc(rs.getString("loc"));
				vo.setEmploytype(rs.getString("employtype"));
				vo.setEdulv(rs.getString("edulv"));
				vo.setJapaneselv(rs.getString("japaneselv"));
				vo.setSalary(rs.getInt("salary"));
				vo.setName(rs.getString("name"));
				
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;

	}

	// 공고 목록을 구하는 메소드(페이지 처리와 검색 기능)
	public List<CompanyInfoVo> companyInfoList(String s_sql, int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<CompanyInfoVo> list = new ArrayList<CompanyInfoVo>();

		String sql = "select X.* from (select rownum as rnum, A.* from "
				+ "(select * from tbl_company_info order by idx desc) A " + " where " + s_sql + " and rownum <= ?) X where "
				+ s_sql + " and X.rnum >=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CompanyInfoVo vo = new CompanyInfoVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setCategory(rs.getString("category"));
				vo.setLoc(rs.getString("loc"));
				vo.setEmploytype(rs.getString("employtype"));
				vo.setEdulv(rs.getString("edulv"));
				vo.setJapaneselv(rs.getString("japaneselv"));
				vo.setSalary(rs.getInt("salary"));
				vo.setName(rs.getString("name"));
				
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;

	}
	
	public List<CompanyInfoVo> companyList(String companyid, int startpage, int endpage) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      List<CompanyInfoVo> list = new ArrayList<CompanyInfoVo>();

	      String sql = "select X.* from (select rownum as rnum, A.* from "
	            + "(select * from tbl_company_info where companyid=? order by idx desc) A " + " where rownum <= ?) X where X.rnum >=?";

	      try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, companyid);
	         pstmt.setInt(2, endpage);
	         pstmt.setInt(3, startpage);
	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            CompanyInfoVo vo = new CompanyInfoVo();
	            vo.setIdx(rs.getInt("idx"));
	            vo.setCategory(rs.getString("category"));
	            vo.setLoc(rs.getString("loc"));
	            vo.setEmploytype(rs.getString("employtype"));
	            vo.setEdulv(rs.getString("edulv"));
	            vo.setJapaneselv(rs.getString("japaneselv"));
	            vo.setSalary(rs.getInt("salary"));
	            System.out.println();
	            list.add(vo);
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }
	      return list;

	   }
}
