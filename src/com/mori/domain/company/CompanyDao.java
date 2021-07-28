package com.mori.domain.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mori.util.DBManager;

public class CompanyDao {
	private CompanyDao() {
	}

	private static CompanyDao instance = new CompanyDao();

	public static CompanyDao getInstance() {
		return instance;
	}

	// 기업 회원가입
	public int CompanyInsert(CompanyVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "insert into tbl_company(idx,companyid,passwd,name,ceo,email,tell,"
				+ "address,homepage,regdate)"
				+ " values(tbl_company_seq_idx.nextval,?,?,?,?,?,?,?,?,sysdate)";
		int row = 0;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, vo.getCompanyid());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getCeo());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getTell());
			pstmt.setString(7, vo.getAddress());
			pstmt.setString(8, vo.getHomepage());
			
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


	// 기업 아이디 중복체크
	public int idCheck(String companyid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select companyid from tbl_company where companyid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companyid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				row = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

	// 기업 가입 시 인증 메일 확인 체크
	public int emailChecked(String companyid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select emailck from tbl_company where companyid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companyid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int result = rs.getInt("emailck");
				if (result == 1) {
					row = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return row;
	}

	// 메일 인증 회원 인증 컬럼 업데이트
	public int emailChecking(String companyid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "update tbl_company set emailck = 1 where companyid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companyid);
			row = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return row;
	}

	// 아이디 중복 체크
	public int companyidCheck(String companyid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select companyid from tbl_company where companyid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companyid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				row = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

	// 로그인 기능 구현
	public int companyLogin(String companyid, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select passwd from tbl_company where companyid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companyid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String passwd = rs.getString("passwd");
				if (password.equals(passwd)) {
//					sql = "update tbl_company set last_time = sysdate where companyid = ?";
//					pstmt = conn.prepareStatement(sql);
//					pstmt.setString(1, companyid);
//					pstmt.executeUpdate();

					row = 1; // 로그인 완료
				} else {
					row = 0; // 비밀번호 틀림
				}
			} else {
				row = -1; // 아이디 없음
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

	// 기업 회원 정보
	public CompanyVo companyInfo(String companyid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from tbl_company where companyid = ?";

		CompanyVo vo = new CompanyVo();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companyid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setCompanyid(rs.getString("companyid"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setCeo(rs.getString("ceo"));
				vo.setEmail(rs.getString("email"));
				vo.setTell(rs.getString("tell"));
				vo.setAddress(rs.getString("address"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setLastdate(rs.getString("lastdate"));
				vo.setEmailck(rs.getInt("emailck"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return vo;
	}

	// 기업 회원정보 수정
	public int companyModify(CompanyVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "update tbl_company set passwd = ?, email = ?, tell = ?, address = ?, homepage = ? where companyid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPasswd());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getTell());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getHomepage());
			pstmt.setString(6, vo.getCompanyid());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

	// 기업 회원 탈퇴
	public int companyDelete(String companyid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "delete tbl_company where companyid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companyid);

			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

	// 기업 회원 총 수
	public int companyCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from tbl_company";

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

	// 검색 조건에 맞는 기업 회원 수를 구하는 메소드
	public int companyCount(String s_sql) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from tbl_company " + s_sql;
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

	// 기업 회원 전체 목록을 구하는 메소드(페이지 처리, 검색 기능 없음)
	public List<CompanyVo> companyList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<CompanyVo> list = new ArrayList<CompanyVo>();

		String sql = "select X.* from (select rownum as rnum, A.* from "
				+ "(select * from tbl_company order by idx desc) A "
				+ " where rownum <= ?) X where X.rnum >=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CompanyVo vo = new CompanyVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setCompanyid(rs.getString("companyid"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setCeo(rs.getString("ceo"));
				vo.setEmail(rs.getString("email"));
				vo.setTell(rs.getString("tell"));
				vo.setAddress(rs.getString("address"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setLastdate(rs.getString("lastdate"));
				vo.setEmailck(rs.getInt("emailck"));

				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;

	}

	// 회원 전체 목록을 구하는 메소드(페이지 처리와 검색 기능)
	public List<CompanyVo> companyList(String s_sql, int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<CompanyVo> list = new ArrayList<CompanyVo>();

		String sql = "select X.* from (select rownum as rnum, A.* from "
				+ "(select * from tbl_company order by idx desc) A " + " where " + s_sql
				+ " and rownum <= ?) X where " + s_sql + " and X.rnum >=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CompanyVo vo = new CompanyVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setCompanyid(rs.getString("companyid"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setCeo(rs.getString("ceo"));
				vo.setEmail(rs.getString("email"));
				vo.setTell(rs.getString("tell"));
				vo.setAddress(rs.getString("address"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setLastdate(rs.getString("lastdate"));
				vo.setEmailck(rs.getInt("emailck"));


				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;

	}
	
	// 이메일 인증 여부
	public int emailck(String companyid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select emailck from tbl_company where companyid = ?";
		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companyid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				row = rs.getInt("emailck");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

}
