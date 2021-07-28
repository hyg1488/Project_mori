package com.mori.domain.japanese;


public class JapaneseVo {
	
	// 문제 고유 번호
	private int idx;
	
	// 문제 질문
	private String que;
	
	// 문제 선택지
	private String sel1;
	private String sel2;
	private String sel3;
	private String sel4;
	
	
	// 답
	private int correct;


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getQue() {
		return que;
	}


	public void setQue(String que) {
		this.que = que;
	}


	public String getSel1() {
		return sel1;
	}


	public void setSel1(String sel1) {
		this.sel1 = sel1;
	}


	public String getSel2() {
		return sel2;
	}


	public void setSel2(String sel2) {
		this.sel2 = sel2;
	}


	public String getSel3() {
		return sel3;
	}


	public void setSel3(String sel3) {
		this.sel3 = sel3;
	}


	public String getSel4() {
		return sel4;
	}


	public void setSel4(String sel4) {
		this.sel4 = sel4;
	}


	public int getCorrect() {
		return correct;
	}


	public void setCorrect(int correct) {
		this.correct = correct;
	}
}