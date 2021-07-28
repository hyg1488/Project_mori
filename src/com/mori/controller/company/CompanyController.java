package com.mori.controller.company;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.service.Action;

@WebServlet("/Company")
public class CompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CompanyController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		
		CompanyActionFactory caf = CompanyActionFactory.getInstance();
		
		Action action = caf.getAction(cmd);
		
		if (action != null) {
			action.execute(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
