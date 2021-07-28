package com.mori.service.japanese;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.service.Action;

public class JapaneseResultAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		
		int que1 = 0;
		if (request.getParameter("Q1") != null) {
			que1 = Integer.parseInt(request.getParameter("Q1"));
			
		}
		
		int que2 = 0;
		if (request.getParameter("Q2") != null) {
			que2 = Integer.parseInt(request.getParameter("Q2"));
			
		}
		
		int que3 = 0;
		if (request.getParameter("Q3") != null) {
			que3 = Integer.parseInt(request.getParameter("Q3"));
			
		}
		
		
		int qr1 = Integer.parseInt(request.getParameter("QR1"));
		int qr2 = Integer.parseInt(request.getParameter("QR2"));
		int qr3 = Integer.parseInt(request.getParameter("QR3"));
		
		int totcount = 0;
		
		if (que1 == qr1) {
			totcount++;
		}
		if (que2 == qr2) {
			totcount++;
		}
		if (que3 == qr3) {
			totcount++;
		}
		
		request.setAttribute("totcount", totcount);

		RequestDispatcher rd = request.getRequestDispatcher("Japanese/japanese_result.jsp");
		rd.forward(request, response);
	}

}
