package com.wintersoldier.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wintersoldier.domain.user.UserDAO;
import com.wintersoldier.service.Action;

public class UserSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("username") != null) {
			if(request.getParameter("username").equals("")) {
				String cnt = request.getParameter("cnt");
				
				request.setAttribute("cnt", cnt);
				RequestDispatcher dis = request.getRequestDispatcher("/User/user_search.jsp");
				dis.forward(request, response);
			}else {
				String username = request.getParameter("username");
				String email = request.getParameter("email1")+"@"+request.getParameter("email2");
				String cnt = "0";
				UserDAO dao = UserDAO.getInstance();
				String userid= dao.userSelect(username, email);
				if(userid == null) {
					cnt = "4";
				}
//				else if(request.getParameter("cnt").equals("5")) {
//					cnt="5";
//				}
				else{
					cnt = "3";
				}
				request.setAttribute("cnt", cnt);
				request.setAttribute("userid", userid);
				RequestDispatcher dis = request.getRequestDispatcher("/User/user_search.jsp");
				dis.forward(request, response);
			}
		}else{
			String cnt = request.getParameter("cnt");
			
			request.setAttribute("cnt", cnt);
			RequestDispatcher dis = request.getRequestDispatcher("/User/user_search.jsp");
			dis.forward(request, response);
		}
	}

}
