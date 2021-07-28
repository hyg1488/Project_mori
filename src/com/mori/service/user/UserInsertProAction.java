package com.mori.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.domain.user.UserDao;
import com.mori.domain.user.UserVo;
import com.mori.service.Action;
import com.mori.util.SHA256Util;


public class UserInsertProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] hobbyarray = request.getParameterValues("hobby");
		
		String hobby = "";
		
		for (int x=0; x<hobbyarray.length; x++) {
			if (x == hobbyarray.length-1) {
				hobby = hobby + hobbyarray[x];
			
			}else {
				hobby = hobby + hobbyarray[x] + ",";
			}
		}
				
		UserVo vo = new UserVo();
		vo.setUserid(request.getParameter("userid"));
		vo.setNickname(request.getParameter("nick"));
		vo.setPasswd(SHA256Util.getEncSHA256(request.getParameter("pass")));
		vo.setName(request.getParameter("username"));
		vo.setEmail(request.getParameter("email1")+"@"+request.getParameter("email2"));
		vo.setTell(request.getParameter("tel")+"-"+request.getParameter("tel2").substring(0,4)+"-"+request.getParameter("tel2").substring(4));
		vo.setJob(request.getParameter("job"));
		vo.setInterest(hobby);
		
	
		UserDao dao = UserDao.getInstance();
		int row = dao.UserInsert(vo);
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = response.getWriter();

		
		if(row==1) {
			request.setAttribute("uservo", vo);
			
			RequestDispatcher rd = request.getRequestDispatcher("User?cmd=emailck");
			rd.forward(request, response);
			
		}else {
			writer.println("<script>alert('회원가입에 실패하였습니다.\n관리자에게 문의해 주세요.'); location.href='User?cmd=user_insert';</script>");
			writer.close();
		}
		
	}

}