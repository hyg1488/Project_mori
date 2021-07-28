package com.wintersoldier.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wintersoldier.domain.user.UserDAO;
import com.wintersoldier.service.Action;
import com.wintersoldier.util.SHA256Util;

public class UserModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ck = 0;
		String passwd = SHA256Util.getEncSHA256(request.getParameter("pass"));
		String userid = request.getParameter("userid");
		UserDAO dao = UserDAO.getInstance();
		int row = dao.userLogin(userid, passwd);
		if(row==1) {
			String tell = request.getParameter("tel")+request.getParameter("tel2");
			String job = request.getParameter("job");
			String[] chb = request.getParameterValues("hobby");
			String interest = chb[0];
			if(chb.length>1) {
				for (int i = 1; i < chb.length; i++) {
						interest = interest+","+chb[i];				
				}
			}
			
			String newpass = SHA256Util.getEncSHA256(request.getParameter("passck"));
			ck = dao.userModify(newpass, tell, job, interest, userid);
			if(ck == 1) {
				HttpSession session = request.getSession();
				session.invalidate();
			}
			request.setAttribute("row", ck);
			RequestDispatcher dis = request.getRequestDispatcher("User/user_modify.jsp");
			dis.forward(request, response);
		}else {
			request.setAttribute("row", row);
			RequestDispatcher dis = request.getRequestDispatcher("User/user_modify.jsp");
			dis.forward(request, response);
		}
		
	}

}
