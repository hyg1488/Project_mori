package com.mori.util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.domain.company.CompanyDao;
import com.mori.domain.user.UserDao;


@WebServlet("/idcheck")
public class UserIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("userid");
		
		
		// 아이디 길이 유효성 검사
		if (id.length() < 7) {
			response.getWriter().write(3+"");
			
		// 아이디 중복 체크	
		}else {
			
			// 기업 회원 이이디와 중복 체크
			CompanyDao dao = CompanyDao.getInstance();
			
			int row = dao.companyidCheck(id);
			
			// 기업 회원 아이디와 중복 없을 시 일반 회원 아이디에서 중복 확인
			if (row == 0) {
				UserDao userdao = UserDao.getInstance();
				row = userdao.useridCheck(id);
				
				response.getWriter().write(row+"");
				
			}else {
				response.getWriter().write(row+"");				
			}
		}
		
		
		
	}

}
