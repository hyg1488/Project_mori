package com.mori.service.japanese;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.domain.japanese.JapaneseDao;
import com.mori.domain.japanese.JapaneseVo;
import com.mori.service.Action;

public class JapaneseAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JapaneseDao dao = JapaneseDao.getInsance();
		
		List<JapaneseVo> list = dao.getJapaneseTest();
		
		request.setAttribute("test1", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("Japanese/japanese.jsp");
		rd.forward(request, response);
	}

}
