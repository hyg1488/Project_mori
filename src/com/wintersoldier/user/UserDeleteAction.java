package com.wintersoldier.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wintersoldier.domain.user.UserDAO;
import com.wintersoldier.domain.user.UserVO;
import com.wintersoldier.service.Action;
import com.wintersoldier.util.SHA256Util;

public class UserDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = UserDAO.getInstance();
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("userinfo");
		String userid = vo.getUserid();
		String pass = request.getParameter("pass");
		int row = dao.userDelete(userid, new SHA256Util().getEncSHA256(pass));
		if(row==1) {
			session.invalidate();
		}
		request.setAttribute("row", row);
		RequestDispatcher dis = request.getRequestDispatcher("User/user_delete.jsp");
		dis.forward(request, response);
	}

}
