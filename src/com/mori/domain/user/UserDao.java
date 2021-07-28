package com.mori.domain.user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.mori.util.DBManager;

public class UserDao {
	private UserDao() {}

	private static UserDao instance = new UserDao();

	public static UserDao getInstance() {
		return instance;
	}

	public int UserInsert(UserVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "insert into tbl_user(idx,userid,nickname,passwd,name,email,tell,job,Interest,regdate) values(tbl_user_seq_idx.nextval,?,?,?,?,?,?,?,?,sysdate)";
		int row = 0;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getPasswd());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getTell());
			pstmt.setString(7, vo.getJob());
			pstmt.setString(8, vo.getInterest());

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

	// 기업 가입 시 인증 메일 확인 체크
	public int emailChecked(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select emailck from tbl_user where userid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
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
	public int emailChecking(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "update tbl_user set emailck = 1 where userid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			row = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return row;
	}

	// 아이디 중복 체크
	public int useridCheck(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select userid from tbl_user where userid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
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
	public int userLogin(String userid, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select passwd from tbl_user where userid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String passwd = rs.getString("passwd");
				if (password.equals(passwd)) {
//						sql = "update tbl_company set last_time = sysdate where companyid = ?";
//						pstmt = conn.prepareStatement(sql);
//						pstmt.setString(1, companyid);
//						pstmt.executeUpdate();

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

	// 일반 회원 정보
	public UserVo userInfo(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from tbl_user where userid = ?";

		UserVo vo = new UserVo();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setUserid(rs.getString("userid"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setEmail(rs.getString("email"));
				vo.setTell(rs.getString("tell"));
				vo.setInterest(rs.getString("interest"));
				vo.setJob(rs.getString("job"));
				vo.setEmployee(rs.getString("employee"));
				vo.setResidence(rs.getInt("residence"));
				vo.setTest(rs.getInt("test"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setRecent(rs.getString("recent"));
				vo.setFilename(rs.getString("filename"));
				vo.setEmailck(rs.getInt("emailck"));
				vo.setPoint(rs.getInt("point"));
				vo.setNickname(rs.getString("nickname"));
				vo.setAddress(rs.getString("address"));
				vo.setLv(rs.getInt("lv"));
				vo.setImg(rs.getString("img"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return vo;
	}

	// 일반 회원정보 수정
	public int userModify(UserVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "update tbl_user set nickname = ?, passwd = ?, email = ?, tell = ?, job = ?, interest = ? where userid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			row = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

	// 일반 회원 탈퇴
	public int userDelete(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "delete tbl_user where userid = ?";

		int row = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);

			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return row;
	}

	// 일반 회원 총 수
	public int userCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from tbl_user";

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

	// 검색 조건에 맞는 일반 회원 수를 구하는 메소드
	public int userCount(String s_sql) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from tbl_user " + s_sql;
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

	
	// 일반 회원 전체 목록을 구하는 메소드(페이지 처리, 검색 기능 없음)
	public List<UserVo> userList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<UserVo> list = new ArrayList<UserVo>();

		String sql = "select X.* from (select rownum as rnum, A.* from "
				+ "(select * from tbl_user order by idx desc) A " + " where rownum <= ?) X where X.rnum >=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				UserVo vo = new UserVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setUserid(rs.getString("userid"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setNickname(rs.getString("nickname"));
				vo.setEmail(rs.getString("email"));
				vo.setTell(rs.getString("tell"));
				vo.setAddress(rs.getString("address"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setRecent(rs.getString("recent"));
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
	public List<UserVo> userList(String s_sql, int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<UserVo> list = new ArrayList<UserVo>();

		String sql = "select X.* from (select rownum as rnum, A.* from "
				+ "(select * from tbl_user order by idx desc) A " + " where " + s_sql + " and rownum <= ?) X where "
				+ s_sql + " and X.rnum >=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				UserVo vo = new UserVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setUserid(rs.getString("userid"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setNickname(rs.getString("nickname"));
				vo.setEmail(rs.getString("email"));
				vo.setTell(rs.getString("tell"));
				vo.setAddress(rs.getString("address"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setRecent(rs.getString("recent"));
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

}