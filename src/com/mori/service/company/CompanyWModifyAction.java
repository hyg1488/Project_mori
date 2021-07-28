package com.mori.service.company;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.domain.company.CompanyInfoDao;
import com.mori.domain.company.CompanyInfoVo;
import com.mori.service.Action;

public class CompanyWModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		CompanyInfoDao dao = CompanyInfoDao.getInstance();
		
		CompanyInfoVo vo = dao.companyInfoView(idx);
		
		request.setAttribute("company", vo);
		
		RequestDispatcher rd = request.getRequestDispatcher("Company/company_w_modify.jsp");
		rd.forward(request, response);
	}

}
