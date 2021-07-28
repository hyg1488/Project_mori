package com.wintersoldier.controller.user;
import com.wintersoldier.company.CompanyDeleteAction;
import com.wintersoldier.company.CompanyInfoAction;
import com.wintersoldier.service.Action;
import com.wintersoldier.user.UserDeleteAction;
import com.wintersoldier.user.UserEmailAction;
import com.wintersoldier.user.UserInfoAction;
import com.wintersoldier.user.UserLoginAction;
import com.wintersoldier.user.UserLogoutAction;
import com.wintersoldier.user.UserModifyAction;
import com.wintersoldier.user.UserQuestAction;
import com.wintersoldier.user.UserSearchAction;


public class UserActionFactory {
	private static UserActionFactory instance = new UserActionFactory();
	private UserActionFactory() {};
	public static UserActionFactory getInstance(){
		return instance;
	}
	
	public Action getAction(String cmd){
		Action action = null;
		
		if(cmd.equals("user_login")) {
			action = new UserLoginAction();
		}else if(cmd.equals("user_modify")) {
			action = new UserModifyAction();
		}else if(cmd.equals("user_logout")){
			action = new UserLogoutAction();
		}else if(cmd.equals("user_info")) {
			action = new UserInfoAction();
		}else if(cmd.equals("user_email")) {
			action = new UserEmailAction();
		}else if(cmd.equals("user_search")) {
			action = new UserSearchAction();
		}else if(cmd.equals("user_delete")) {
			action = new UserDeleteAction();
		}else if(cmd.equals("company_info")) {
			action = new CompanyInfoAction();
		}else if(cmd.equals("question")) {
			action = new UserQuestAction();
		}
		else if(cmd.equals("company_delete")) {
			action = new CompanyDeleteAction();
		}
		
		return action;
	}
	
}
