package com.wintersoldier.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jslhrd.domain.community.CommunityDao;
import com.jslhrd.domain.community.CommunityDto;
import com.mori.domain.test.TestDao;
import com.mori.domain.test.TestDto;
import com.wintersoldier.domain.user.UserDAO;
import com.wintersoldier.domain.user.UserVO;
import com.wintersoldier.service.Action;
import com.wintersoldier.util.PageIndex;

public class UserInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cnt = request.getParameter("cnt");
		
		if(Integer.parseInt(cnt) == 3) {
			CommunityDao dao = CommunityDao.getInstance();
			int totcount = dao.CommunityCount();
			int nowpage = 1;	// 현재 페이지 초기화
			int maxlist = 10;	// 페이지당 글수 초기화
			int totpage = 1;	// 총 페이지 초기화
			
			if(request.getParameter("page") != null) nowpage = Integer.parseInt(request.getParameter("page"));
			
			if(totcount%maxlist == 0) totpage = totcount/maxlist;
			else totpage = (totcount/maxlist)+1; 	
			
			int startpage = (nowpage-1)*maxlist+1;//게시글 시작 번호
			int endpage = nowpage*maxlist;//게시글 끝 번호
			int listcount = totcount - (nowpage - 1)*maxlist;
			
			List<CommunityDto> list = null;
			
			list = dao.CommunityList(startpage, endpage);
			
			
			String pageSkip="";
			
			pageSkip = PageIndex.pageList(nowpage, totpage, "/User?cmd=user_info&cnt=3", "");
			
			request.setAttribute("page", nowpage);
			request.setAttribute("totpage", totpage);
			request.setAttribute("totcount", totcount);
			request.setAttribute("listcount", listcount);
			request.setAttribute("list", list);
			request.setAttribute("pageSkip", pageSkip);
			
			
			request.setAttribute("totcount", totcount);
			
		}else if(Integer.parseInt(cnt) == 5) {
			TestDao dao = TestDao.getInstance();
			HttpSession session = request.getSession();
			UserVO vo = (UserVO)session.getAttribute("userinfo");
			int idx = vo.getIdx();
			int totcount = dao.TestCount(idx);
			
			int nowpage = 1;	// 현재 페이지 초기화
			int maxlist = 10;	// 페이지당 글수 초기화
			int totpage = 1;	// 총 페이지 초기화
			
			if(request.getParameter("page") != null) nowpage = Integer.parseInt(request.getParameter("page"));
			
			if(totcount%maxlist == 0) totpage = totcount/maxlist;
			else totpage = (totcount/maxlist)+1; 	
			
			int startpage = (nowpage-1)*maxlist+1;//게시글 시작 번호
			int endpage = nowpage*maxlist;//게시글 끝 번호
			int listcount = totcount - (nowpage - 1)*maxlist;
			
			List<TestDto> list = null;
			
			list = dao.TestList(idx, startpage, endpage);
			
			
			String pageSkip="";
			
			pageSkip = PageIndex.pageList(nowpage, totpage, "/User?cmd=user_info&cnt=5", "");
			
			request.setAttribute("page", nowpage);
			request.setAttribute("totpage", totpage);
			request.setAttribute("totcount", totcount);
			request.setAttribute("listcount", listcount);
			request.setAttribute("list", list);
			request.setAttribute("pageSkip", pageSkip);
			
			
			request.setAttribute("totcount", totcount);
		}
		request.setAttribute("cnt", cnt);
		RequestDispatcher dis = request.getRequestDispatcher("/User/user_info.jsp");
		dis.forward(request, response);
	}

}
