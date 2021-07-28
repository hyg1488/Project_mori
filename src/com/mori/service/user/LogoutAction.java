package com.mori.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mori.service.Action;

public class LogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		session.removeAttribute("companyinfo");
		session.removeAttribute("userinfo");
		
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("location.href='Company?cmd=company_list'");
		pw.println("</script>");
	}

}
