package com.mori.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mori.domain.company.CompanyDao;
import com.mori.domain.company.CompanyVo;
import com.mori.domain.user.UserDao;
import com.mori.domain.user.UserVo;
import com.mori.service.Action;
import com.mori.util.SHA256Util;

public class LoginActionPro implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		
		String id = request.getParameter("userid");
		String password = SHA256Util.getEncSHA256(request.getParameter("pass"));
		
		CompanyDao dao = CompanyDao.getInstance();
		UserDao userdao = UserDao.getInstance();
		
		
		if (dao.companyidCheck(id) == 1) {
			int row = dao.companyLogin(id, password);
			
			if (row == 1) {
				row = dao.emailChecked(id);
				
				if (row == 1) {
					CompanyVo vo = dao.companyInfo(id);
					HttpSession session = request.getSession();
					session.setAttribute("companyinfo", vo);
					pw.println("<script>");
					pw.println("location.href='Company?cmd=company_list'");
					pw.println("</script>");
				}else {
					pw.println("<script>");
					pw.println("alert('이메일 인증 후 이용해 주세요.')");
					pw.println("history.back()");
					pw.println("</script>");
				}
			}else if (row == 0) {
				pw.println("<script>");
				pw.println("alert('비밀번호가 일치하지 않습니다.');");
				pw.println("history.back();");
				pw.println("</script>");
			}
		}else if (userdao.useridCheck(id) == 1) {
			int row = userdao.userLogin(id, password);
			
			if (row == 1) {
				UserVo vo = userdao.userInfo(id);
				row = userdao.emailChecked(id);
				
				if (row == 1) {
					HttpSession session = request.getSession();
					session.setAttribute("userinfo", vo);
					pw.println("<script>");
					pw.println("location.href='Company?cmd=company_list'");
					pw.println("</script>");
				}else {
					pw.println("<script>");
					pw.println("alert('이메일 인증 후 이용해 주세요.')");
					pw.println("history.back()");
					pw.println("</script>");
				}
			}else if (row == 0) {
				pw.println("<script>");
				pw.println("alert('비밀번호가 일치하지 않습니다.');");
				pw.println("history.back();");
				pw.println("</script>");
			}
		}else {
			pw.println("<script>");
			pw.println("alert('존재하지 않는 아이디입니다.');");
			pw.println("history.back();");
			pw.println("</script>");
		}
		
	}

}
