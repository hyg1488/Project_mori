package com.wintersoldier.company;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wintersoldier.domain.company.CompanyDAO;
import com.wintersoldier.domain.company.CompanyVo;
import com.wintersoldier.service.Action;
import com.wintersoldier.util.SHA256Util;

public class CompanyDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CompanyDAO dao = CompanyDAO.getInstance();
		HttpSession session = request.getSession();
		CompanyVo vo = (CompanyVo) session.getAttribute("companyinfo");
		String companyid = vo.getCompanyid();
		String pass = request.getParameter("pass");
		int row = dao.companyDelete(companyid, new SHA256Util().getEncSHA256(pass));

		if(row==1) {
			session.invalidate();
		}
		request.setAttribute("row", row);
		RequestDispatcher dis = request.getRequestDispatcher("User/user_delete.jsp");
		dis.forward(request, response);

	}

}
