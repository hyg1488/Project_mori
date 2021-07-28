package com.wintersoldier.company;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mori.domain.company.CompanyInfoDao;
import com.mori.domain.company.CompanyInfoVo;
import com.wintersoldier.domain.company.CompanyVo;
import com.wintersoldier.service.Action;
import com.wintersoldier.util.PageIndex;

public class CompanyInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cnt = request.getParameter("cnt");
		if(Integer.parseInt(cnt) == 3) {
			CompanyInfoDao dao = CompanyInfoDao.getInstance();
			HttpSession session = request.getSession();
			CompanyVo cdao = (CompanyVo) session.getAttribute("companyinfo");
			String companyid = cdao.getCompanyid();
			int totcount = dao.companyInfoCount();
			int nowpage = 1;	// 현재 페이지 초기화
			int maxlist = 10;	// 페이지당 글수 초기화
			int totpage = 1;	// 총 페이지 초기화
			
			if(request.getParameter("page") != null) nowpage = Integer.parseInt(request.getParameter("page"));
			
			if(totcount%maxlist == 0) totpage = totcount/maxlist;
			else totpage = (totcount/maxlist)+1; 	
			
			int startpage = (nowpage-1)*maxlist+1;//게시글 시작 번호
			int endpage = nowpage*maxlist;//게시글 끝 번호
			int listcount = totcount - (nowpage - 1)*maxlist;
			
			List<CompanyInfoVo> list = null;
			
			list = dao.companyList(companyid, startpage, endpage);
			
			
			String pageSkip="";
			
			pageSkip = PageIndex.pageList(nowpage, totpage, "/User?cmd=user_info&cnt=3", "");
			
			request.setAttribute("page", nowpage);
			request.setAttribute("totpage", totpage);
			request.setAttribute("totcount", totcount);
			request.setAttribute("listcount", listcount);
			request.setAttribute("list", list);
			request.setAttribute("pageSkip", pageSkip);
			
			request.setAttribute("totcount", totcount);
			
		}
		
		request.setAttribute("cnt", cnt);
		RequestDispatcher dis = request.getRequestDispatcher("/Company/company_info.jsp");
		dis.forward(request, response);
	}

}