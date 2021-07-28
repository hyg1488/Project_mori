package com.mori.service.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mori.domain.company.CompanyDao;
import com.mori.domain.company.CompanyVo;
import com.mori.service.Action;
import com.mori.util.SHA256Util;

public class CompanyModifyProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String companyid = request.getParameter("userid");
		String password = SHA256Util.getEncSHA256(request.getParameter("nowpass"));
		String newpass = SHA256Util.getEncSHA256(request.getParameter("newpass"));
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		String tell = request.getParameter("tel")+"-"+request.getParameter("tel2").substring(0,5)+request.getParameter("tel2").substring(6);
		String address = request.getParameter("addr");
		String homepage = request.getParameter("homepage");
		
		CompanyVo vo = new CompanyVo();
		vo.setCompanyid(companyid);
		vo.setPasswd(newpass);
		vo.setEmail(email);
		vo.setTell(tell);
		vo.setAddress(address);
		vo.setHomepage(homepage);
		
		CompanyDao dao = CompanyDao.getInstance();
		
		int row = dao.companyLogin(companyid, password);
		
		PrintWriter pw = response.getWriter();
		
		if (row == 0) {
			pw.println("<script>");
			pw.println("alert('현재 비밀번호가 일치하지 않습니다.')");
			pw.println("history.back()");
			pw.println("</script>");
		}else {
			row = dao.companyModify(vo);
			
			if (row==1) {
				HttpSession session = request.getSession();
				session.setAttribute("companyinfo", dao.companyInfo(companyid));
				
				pw.println("<script>");
				pw.println("alert('정보 수정이 완료되었습니다.')");
				pw.println("location.href='Company?cmd=company_list'");
				pw.println("</script>");
			}else {
				pw.println("<script>");
				pw.println("alert('문제가 발생하였습니다.')");
				pw.println("history.back()");
				pw.println("</script>");
			}
		}
		
	}

}
