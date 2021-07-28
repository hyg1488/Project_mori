package com.mori.service.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.domain.company.CompanyInfoDao;
import com.mori.domain.company.CompanyInfoVo;
import com.mori.service.Action;

public class CompanyWModifyProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		int idx = Integer.parseInt(request.getParameter("idx"));
		
		String name = request.getParameter("name");
		String ceo = request.getParameter("ceo");
		String email = request.getParameter("email");
		String category = request.getParameter("category");
		String loc = request.getParameter("loc");
		int capital = Integer.parseInt(request.getParameter("capital"));
		int estyear = Integer.parseInt(request.getParameter("estyear"));
		int salary = Integer.parseInt(request.getParameter("salary"));
		int employeenum = Integer.parseInt(request.getParameter("employeenum"));
		String employtype = request.getParameter("employtype");
		String edulv = request.getParameter("edulv");
		String japaneselv = request.getParameter("japaneselv");
		String intro = request.getParameter("intro");
		String address = request.getParameter("address");
		String homepage = request.getParameter("homepage");
		
		CompanyInfoVo vo = new CompanyInfoVo();
		vo.setName(name);
		vo.setEmail(email);
		vo.setCeo(ceo);
		vo.setCategory(category);
		vo.setLoc(loc);
		vo.setCapital(capital);
		vo.setEstyear(estyear);
		vo.setSalary(salary);
		vo.setEmployeenum(employeenum);
		vo.setEmploytype(employtype);
		vo.setEdulv(edulv);
		vo.setJapaneselv(japaneselv);
		vo.setIntro(intro);
		vo.setAddress(address);
		vo.setHomepage(homepage);

		CompanyInfoDao dao = CompanyInfoDao.getInstance();

		int row = dao.companyInfoModify(idx, vo);
		
		System.out.println(row);

		PrintWriter pw = response.getWriter();

		if (row == 1) {
			pw.println("<script>");
			pw.println("alert('공고 수정이 완료되었습니다.')");
			pw.println("location.href='Company?cmd=company_list'");
			pw.println("</script>");
			pw.close();
		}else {
			pw.println("<script>");
			pw.println("alert('공고 수정이 실패하였습니다.')");
			pw.println("history.back();");
			pw.println("</script>");
			pw.close();
		}

	}

}
