package com.mori.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.domain.company.CompanyDao;
import com.mori.domain.company.CompanyVo;
import com.mori.domain.user.UserDao;
import com.mori.domain.user.UserVo;
import com.mori.service.Action;
import com.mori.util.SHA256Util;

public class UserEmailCheckPro implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		if (request.getParameter("companyid") != null) {
			String companyid = request.getParameter("companyid");
			String code = request.getParameter("code");

			CompanyDao dao = CompanyDao.getInstance();
			CompanyVo vo = dao.companyInfo(companyid);

			String hashemail = SHA256Util.getEncSHA256(vo.getEmail());

			PrintWriter pw = response.getWriter();

			int row = dao.emailChecked(companyid);

			if (row == 1) {
				pw.println("<script>");
				pw.println("alert('이미 인증되었습니다.')");
				pw.println("location.href='Company?cmd=company_list'");
				pw.println("</script>");

			} else {
				if (code.equals(hashemail)) {
					dao.emailChecking(companyid);
					pw.println("<script>");
					pw.println("alert('이메일 인증이 완료되었습니다.')");
					pw.println("location.href='Company?cmd=company_list'");
					pw.println("</script>");
				} else {
					pw.println("<script>");
					pw.println("alert('잘못된 접근입니다.')");
					pw.println("location.href='User?cmd=index'");
					pw.println("</script>");
				}

			}

		} else {
			String userid = request.getParameter("userid");

			String code = request.getParameter("code");

			UserDao dao = UserDao.getInstance();
			UserVo vo = dao.userInfo(userid);

			String hashemail = SHA256Util.getEncSHA256(vo.getEmail());

			PrintWriter pw = response.getWriter();

			int row = dao.emailChecked(userid);

			if (row == 1) {
				pw.println("<script>");
				pw.println("alert('이미 인증되었습니다.')");
				pw.println("location.href='Company?cmd=company_list'");
				pw.println("</script>");

			} else {
				if (code.equals(hashemail)) {
					dao.emailChecking(userid);
					pw.println("<script>");
					pw.println("alert('이메일 인증이 완료되었습니다.')");
					pw.println("location.href='Company?cmd=company_list'");
					pw.println("</script>");
				} else {
					pw.println("<script>");
					pw.println("alert('잘못된 접근입니다.')");
					pw.println("location.href='User?cmd=index'");
					pw.println("</script>");
				}

			}
		}
	}

}
