package com.mori.controller.company;

import com.mori.service.Action;
import com.mori.service.company.CompanyInsertAction;
import com.mori.service.company.CompanyInsertProAction;
import com.mori.service.company.CompanyListAction;
import com.mori.service.company.CompanyModifyAction;
import com.mori.service.company.CompanyModifyProAction;
import com.mori.service.company.CompanyViewAction;
import com.mori.service.company.CompanyWModifyAction;
import com.mori.service.company.CompanyWModifyProAction;
import com.mori.service.company.CompanyWriteAction;
import com.mori.service.company.CompanyWriteProAction;
import com.mori.service.user.UserEmailAction;
import com.mori.service.user.UserEmailCheckPro;

public class CompanyActionFactory {
	private CompanyActionFactory() {}
	private static CompanyActionFactory instance = new CompanyActionFactory();
	
	public static CompanyActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String cmd) {
		Action action = null;
		System.out.println("들어온 요청 : " + cmd);
		
		
		// 기업 회원 리스트
		if (cmd.equals("company_list")) {
			action = new CompanyListAction();
			
		// 기업 회원 가입	
		}else if (cmd.equals("company_insert")) {
			action = new CompanyInsertAction();
		}else if (cmd.equals("company_insert_pro")) {
			action = new CompanyInsertProAction();
		
		// 기업 이메일 인증 메시지 발송
		}else if (cmd.equals("emailck")) {
			action = new UserEmailAction();
		
		
		// 이메일 인증	
		}else if (cmd.equals("emailcking")) {
			action = new UserEmailCheckPro();
		// 기업 정보 수정	
		}else if (cmd.equals("company_modify")) {
			action = new CompanyModifyAction();
		}else if (cmd.equals("company_modify_pro")) {
			action = new CompanyModifyProAction();
		// 공고 등록
		}else if (cmd.equals("company_write")) {
			action = new CompanyWriteAction();
		}else if (cmd.equals("company_write_pro")) {
			action = new CompanyWriteProAction();
		
		// 공고 수정	
		}else if (cmd.equals("company_wmodify")) {
			action = new CompanyWModifyAction();
		}else if (cmd.equals("company_wmodify_pro")) {
			action = new CompanyWModifyProAction();
			
		// 공고 뷰
		}else if (cmd.equals("company_view")) {
			action = new CompanyViewAction();
		}
		
		return action;
	}
}