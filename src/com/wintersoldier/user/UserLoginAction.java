package com.wintersoldier.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wintersoldier.domain.company.CompanyDAO;
import com.wintersoldier.domain.company.CompanyVo;
import com.wintersoldier.domain.user.UserDAO;
import com.wintersoldier.domain.user.UserVO;
import com.wintersoldier.service.Action;
import com.wintersoldier.util.SHA256Util;
import com.wintersoldier.util.checkbox;

public class UserLoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("userid") != null) {
			request.setCharacterEncoding("utf-8");
			int cnt = 0;
				String userid = request.getParameter("userid");
				String passwd = SHA256Util.getEncSHA256(request.getParameter("pass"));
				UserDAO dao = UserDAO.getInstance();
				int row = dao.userLogin(userid, passwd); // 1 = 성공 , 0 - 비번 오류 , -1 = id 오류
				request.setAttribute("row", row);
				if(row == 1) {
					UserVO vo = dao.userSelect(userid);
					checkbox ch = new checkbox();
					String chk = ch.check(vo.getInterestL());
					vo.setInterestHtml(chk);
					HttpSession session = request.getSession(); // 세션 객체 생성
					session.setAttribute("userinfo", vo); // 세션 정보 담기
					session.setMaxInactiveInterval(1800); // 30분간 유지
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
					dispatcher.forward(request, response);
				}else{
					
					CompanyDAO cdao = CompanyDAO.getInstance();
					row = cdao.companyLogin(userid, passwd);
					
					if(row == 1) {
						CompanyVo cvo = cdao.companyInfo(userid);
						System.out.println(cvo.getCeo());
						HttpSession session = request.getSession(); // 세션 객체 생성
						session.setAttribute("companyinfo", cvo); // 세션 정보 담기
						session.setMaxInactiveInterval(1800); // 30분간 유지
						
						RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
						dispatcher.forward(request, response);
						
					}else{
						cnt = 3;
						request.setAttribute("cnt", cnt);
						RequestDispatcher dispatcher = request.getRequestDispatcher("User/user_login.jsp");
						dispatcher.forward(request, response);
					}
					
				}
				
			}else {
			request.setCharacterEncoding("utf-8");
			
				RequestDispatcher dis = request.getRequestDispatcher("User/user_login.jsp");
				dis.forward(request, response);
		
			
		}

	}

}
