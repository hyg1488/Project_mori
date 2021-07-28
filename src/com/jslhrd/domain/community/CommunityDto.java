package com.jslhrd.domain.community;

public class CommunityDto {
   private int idx;
   private String subject;
   private String contents;
   private String userid;
   private String passwd;
   private String regdate;
   private int readcnt;
   
   public int getIdx() {
      return idx;
   }
   public void setIdx(int idx) {
      this.idx = idx;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getContents() {
      return contents;
   }
   public void setContents(String contents) {
      this.contents = contents;
   }
   public String getUserid() {
      return userid;
   }
   public void setUserid(String userid) {
      this.userid = userid;
   }
   public String getPasswd() {
      return passwd;
   }
   public void setPasswd(String passwd) {
      this.passwd = passwd;
   }
   public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
   public int getReadcnt() {
      return readcnt;
   }
   public void setReadcnt(int readcnt) {
      this.readcnt = readcnt;
   }
}
