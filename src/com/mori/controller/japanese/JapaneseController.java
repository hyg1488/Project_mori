package com.mori.controller.japanese;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.service.Action;

@WebServlet("/Japanese")
public class JapaneseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JapaneseController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		
		JapaneseActionFactory caf = JapaneseActionFactory.getInstance();
		
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
