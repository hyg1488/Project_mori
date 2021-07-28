package com.mori.service.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.domain.company.CompanyDao;
import com.mori.domain.company.CompanyVo;
import com.mori.service.Action;
import com.mori.util.SHA256Util;

public class CompanyInsertProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		CompanyVo vo = new CompanyVo();
		CompanyDao dao = CompanyDao.getInstance();
		vo.setCompanyid(request.getParameter("userid"));
		vo.setPasswd(SHA256Util.getEncSHA256(request.getParameter("pass")));
		vo.setName(request.getParameter("companyname"));
		vo.setCeo(request.getParameter("ceooname"));
		vo.setEmail(request.getParameter("email1") + "@" + request.getParameter("email2"));
		vo.setTell(request.getParameter("tel") + "-" + request.getParameter("tel2").substring(0, 4) + "-"
				+ request.getParameter("tel2").substring(4));
		vo.setAddress(request.getParameter("addr"));
		vo.setHomepage(request.getParameter("homepage"));
		PrintWriter pw = response.getWriter();

		int row = dao.CompanyInsert(vo);

		if (row == 1) {
			request.setAttribute("companyvo", vo);
			
			RequestDispatcher rd = request.getRequestDispatcher("Company?cmd=emailck");
			rd.forward(request, response);
		} else {
			pw.println("<script>alert('회원가입에 실패하였습니다.\n관리자에게 문의해 주세요.'); history.back()';</script>");
			pw.close();
		}
	}
	
}