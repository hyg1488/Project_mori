package com.wintersoldier.domain.user;

public class UserVO {
		private int idx;
		private String name;
		private String userid;
		private String passwd;
		private String tell;
		private String email;
		private String interest;
		private String job;
		private int test;
		private String employee;
		private int residence;
		private int point;
		private int emailck;
		private String regdate;
		private String recent;
		private String filename;
		private String nickname;
		private String address;
		private int lv;
		private int division;
		private String[] interestL;
		private String interestHtml;
		private int tellsize;
		
		
		
		public int getTellsize() {
			return tellsize;
		}
		public void setTellsize(int tellsize) {
			this.tellsize = tellsize;
		}
		public String getInterestHtml() {
			return interestHtml;
		}
		public void setInterestHtml(String interestHtml) {
			this.interestHtml = interestHtml;
		}
		public String[] getInterestL() {
			return interestL;
		}
		public void setInterestL(String[] interestL) {
			this.interestL = interestL;
		}
		public int getIdx() {
			return idx;
		}
		public void setIdx(int idx) {
			this.idx = idx;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
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
		public String getTell() {
			return tell;
		}
		public void setTell(String tell) {
			this.tell = tell;
			tellsize = tell.length();
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getInterest() {
			return interest;
		}
		public void setInterest(String interest) {
			this.interest = interest;
			interestL = interest.split(",");
		}
		public String getJob() {
			return job;
		}
		public void setJob(String job) {
			this.job = job;
		}
		public int getTest() {
			return test;
		}
		public void setTest(int test) {
			this.test = test;
		}
		public String getEmployee() {
			return employee;
		}
		public void setEmployee(String employee) {
			this.employee = employee;
		}
		public int getResidence() {
			return residence;
		}
		public void setResidence(int residence) {
			this.residence = residence;
		}
		public int getPoint() {
			return point;
		}
		public void setPoint(int point) {
			this.point = point;
		}
		public int getEmailck() {
			return emailck;
		}
		public void setEmailck(int emailck) {
			this.emailck = emailck;
		}
		public String getRegdate() {
			return regdate;
		}
		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}
		public String getRecent() {
			return recent;
		}
		public void setRecent(String recent) {
			this.recent = recent;
		}
		public String getFilename() {
			return filename;
		}
		public void setFilename(String filename) {
			this.filename = filename;
		}
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String adress) {
			this.address = adress;
		}
		public int getLv() {
			return lv;
		}
		public void setLv(int lv) {
			this.lv = lv;
		}
		public int getDivision() {
			return division;
		}
		public void setDivision(int division) {
			this.division = division;
		}
		
		
		
}