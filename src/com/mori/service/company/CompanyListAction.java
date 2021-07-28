package com.mori.service.company;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.domain.company.CompanyInfoDao;
import com.mori.domain.company.CompanyInfoVo;
import com.mori.domain.company.CompanyVo;
import com.mori.service.Action;
import com.mori.util.PageIndex;

public class CompanyListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");


		CompanyInfoDao dao = CompanyInfoDao.getInstance();
		String s_sql = "", search = "", key = "";
		int totcount = 0;

		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
			search = request.getParameter("search");
			s_sql = search + " like '%" + key + "%'";
			totcount = dao.companyInfoCount(s_sql);
		} else {
			totcount = dao.companyInfoCount();
		}

		int nowpage = 1;
		int maxlist = 9;
		int totpage = 1;

		if (totcount % maxlist == 0) {
			totpage = totcount / maxlist;
		} else {
			totpage = totcount / maxlist + 1;
		}

		if (request.getParameter("page") != null) {
			nowpage = Integer.parseInt(request.getParameter("page"));
		}

		int startpage = (nowpage - 1) * maxlist + 1;
		int endpage = nowpage * maxlist;
		int listcount = totcount - ((nowpage - 1) * maxlist);

		List<CompanyInfoVo> list = null;
		if (key.equals("")) {
			list = dao.companyInfoList(startpage, endpage);
		} else {
			list = dao.companyInfoList(s_sql, startpage, endpage);
		}

		String pageSkip = "";
		if (key.equals("")) {
			pageSkip = PageIndex.pageList(nowpage, totpage, "Company?cmd=company_list", "");
		} else {
			pageSkip = PageIndex.pageListHan(nowpage, totpage, "Company?cmd=company_list", search, key);
		}

		request.setAttribute("page", nowpage);
		request.setAttribute("totcount", totcount);
		request.setAttribute("totpage", totpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("list", list);
		request.setAttribute("pageSkip", pageSkip);
		request.setAttribute("search", search);
		request.setAttribute("key", key);
		
		RequestDispatcher rd = request.getRequestDispatcher("Company/company_list.jsp");
		rd.forward(request, response);
	}

}
