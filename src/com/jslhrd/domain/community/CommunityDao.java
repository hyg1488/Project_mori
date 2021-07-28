package com.jslhrd.domain.community;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wintersoldier.util.DBManager;


public class CommunityDao{

   private CommunityDao() {
   }

   private static CommunityDao instance = new CommunityDao();

   public static CommunityDao getInstance() {
      return instance;
   }

   // 커뮤니티 카운트
   public int CommunityCount() {
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      int row = 0;
      String query = "select count(*) from tbl_community";

      try {
         conn = DBManager.getConnection();
         psmt = conn.prepareStatement(query);
         rs = psmt.executeQuery();
         if (rs.next()) {
            row = rs.getInt(1);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, psmt, rs);
      }
      return row;
   }

   // 조건 카운트
   public int CommunityCount(String s_query) {
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      int row = 0;
      String query = "select count(*) from tbl_community where " + s_query;

      try {
         conn = DBManager.getConnection();
         psmt = conn.prepareStatement(query);
         rs = psmt.executeQuery();
         if (rs.next()) {
            row = rs.getInt(1);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, psmt, rs);
      }
      return row;
   }

   // 커뮤니티 조회수
   public void CommunityReadcnt(int idx) {
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      String query = "update tbl_community set readcnt=readcnt+1 where idx=? ";

      try {
         conn = DBManager.getConnection();
         psmt = conn.prepareStatement(query);
         psmt.setInt(1, idx);
         
         psmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, psmt, rs);
      }
   }

   // 커뮤니티 리스트
   public List<CommunityDto> CommunityList(int startpage, int endpage) {
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      List<CommunityDto> list = new ArrayList<CommunityDto>();
      CommunityDto community = null;

      String query = "select X.* from (select rownum as rnum, A.* from (select * from tbl_community order by idx desc) A where rownum<=?) X where rnum>=? ";

      try {
         conn = DBManager.getConnection();
         psmt = conn.prepareStatement(query);
         psmt.setInt(1, endpage);
         psmt.setInt(2, startpage);
         rs = psmt.executeQuery();
         while (rs.next()) {
            community = new CommunityDto();
            community.setIdx(rs.getInt("idx"));
            community.setUserid(rs.getString("userid"));
            community.setSubject(rs.getString("subject"));
            community.setRegdate(rs.getString("regdate"));
            community.setReadcnt(rs.getInt("readcnt"));
            list.add(community);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, psmt, rs);
      }
      return list;
   }

   public List<CommunityDto> CommunityList(String s_query, int startpage, int endpage) {
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      List<CommunityDto> list = new ArrayList<CommunityDto>();
      CommunityDto community = null;

      String query = "select X.* from (select rownum as rnum, A.* from (select * from tbl_community order by idx desc) "
            + " A where " + s_query + "and rownum>=?) X where " + s_query + " and rnum>=?";

      try {
         conn = DBManager.getConnection();
         psmt = conn.prepareStatement(query);
         psmt.setInt(1, endpage);
         psmt.setInt(2, startpage);
         rs = psmt.executeQuery();
         while (rs.next()) {
            community = new CommunityDto();
            community.setIdx(rs.getInt("idx"));
            community.setUserid(rs.getString("userid"));
            community.setSubject(rs.getString("subject"));
            community.setRegdate(rs.getString("regdate"));
            community.setReadcnt(rs.getInt("readcnt"));

            list.add(community);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, psmt, rs);
      }
      return list;
   }

   // 커뮤니티 글쓰기
   public int CommunityWrite(CommunityDto community) {
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      int row = 0;
      String query = "insert into tbl_community(idx,userid,subject,contents,regdate) values(tbl_community_seq_idx.nextval,?,?,?,sysdate) ";

      try {
         conn = DBManager.getConnection();
         psmt = conn.prepareStatement(query);
         psmt.setString(1, community.getUserid());
         psmt.setString(2, community.getSubject());
         psmt.setString(3, community.getContents());

         row = psmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, psmt, rs);
      }
      return row;
   }

   public CommunityDto CommunityView(int idx) {
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      CommunityDto community = null;
      String query = "select * from tbl_community where idx=?";

      try {
         conn = DBManager.getConnection();
         psmt = conn.prepareStatement(query);
         psmt.setInt(1, idx);
         rs = psmt.executeQuery();
         while (rs.next()) {
            community = new CommunityDto();
            community.setUserid(rs.getString("userid"));
            community.setSubject(rs.getString("subject"));
            community.setContents(rs.getString("contents"));
            community.setRegdate(rs.getString("regdate"));
            community.setReadcnt(rs.getInt("readcnt"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, psmt, rs);
      }
      return community;
   }

   public int CommunityModify(int idx, CommunityDto community) {
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      int row = 0;
      String query = "update tbl_community set subject=?, contents=? where idx=? ";

      try {
         conn = DBManager.getConnection();
         psmt = conn.prepareStatement(query);
         psmt.setString(1, community.getSubject());
         psmt.setString(2, community.getContents());
         psmt.setInt(3, idx);
         
         row = psmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, psmt, rs);
      }
      return row;
   }

   public int CommunityDelete(int idx) {
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      int row = 0;
      String query = "delete tbl_community where idx=?";
      
      try{
         conn = DBManager.getConnection();
         psmt = conn.prepareStatement(query);
         psmt.setInt(1, idx);
         row = psmt.executeUpdate();
      }catch (Exception e) {
         e.printStackTrace();
      }finally {
         DBManager.close(conn, psmt, rs);
      }
      return row;
   }
}
