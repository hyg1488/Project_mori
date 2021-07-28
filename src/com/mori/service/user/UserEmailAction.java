package com.mori.service.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mori.domain.company.CompanyVo;
import com.mori.domain.user.UserVo;
import com.mori.service.Action;
import com.mori.util.Gmail;
import com.mori.util.SHA256Util;

public class UserEmailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getAttribute("companyvo") != null) {
			CompanyVo vo = (CompanyVo) request.getAttribute("companyvo");

			String host = "http://localhost:8088/";

			// 발송자 메일 (자기 지메일 계정과 일치해야 함)
			String from = "suhan0427@gmail.com";

			// 받는 사람 메일 설정
			String to = vo.getEmail();

			// 메일 제목
			String subject = "일본 기업 정보 사이트 '모리'입니다.";

			// 메일 내용
			String contents = "다음 링크에 클릭하여 이메일 인증을 완료해 주세요." + "<a href='" + host + "Company?cmd=emailcking&companyid="
					+ vo.getCompanyid() + "&code=" + new SHA256Util().getEncSHA256(to) + "'>이메일 인증하기</a>";

			// 아무 것도 건들지 말 것
			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			try {
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address formAddr = new InternetAddress(from);
				msg.setFrom(formAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(contents, "text/html; charset=utf-8");
				Transport.send(msg);

			} catch (Exception e) {
				e.printStackTrace();
				PrintWriter pw = response.getWriter();
				pw.println("<script>");
				pw.println("alert('오류가 발생했습니다.')");
				pw.println("history.back()");
				pw.println("</script>");
				pw.close();
			}

			// emailSend 페이지에 접근하기 못하게 하기 위해 email값 하나를 생성해서 링크로 넘어가지 못하게 함
			request.setAttribute("email", "email");

			RequestDispatcher rd = request.getRequestDispatcher("User/emailmessage.jsp");
			rd.forward(request, response);

		} else {
			UserVo vo = (UserVo) request.getAttribute("uservo");

			String host = "http://localhost:8088/";

			// 발송자 메일 (자기 지메일 계정과 일치해야 함)
			String from = "suhan0427@gmail.com";

			// 받는 사람 메일 설정
			String to = vo.getEmail();

			// 메일 제목
			String subject = "일본 기업 정보 사이트 '모리'입니다.";

			// 메일 내용
			String contents = "다음 링크에 클릭하여 이메일 인증을 완료해 주세요." + "<a href='" + host + "User?cmd=emailcking&userid="
					+ vo.getUserid() + "&code=" + new SHA256Util().getEncSHA256(to) + "'>이메일 인증하기</a>";

			// 아무 것도 건들지 말 것
			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			try {
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address formAddr = new InternetAddress(from);
				msg.setFrom(formAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(contents, "text/html; charset=utf-8");
				Transport.send(msg);

			} catch (Exception e) {
				e.printStackTrace();
				PrintWriter pw = response.getWriter();
				pw.println("<script>");
				pw.println("alert('오류가 발생했습니다.')");
				pw.println("history.back()");
				pw.println("</script>");
				pw.close();
			}

			// emailSend 페이지에 접근하기 못하게 하기 위해 email값 하나를 생성해서 링크로 넘어가지 못하게 함
			request.setAttribute("email", "email");

			RequestDispatcher rd = request.getRequestDispatcher("User/emailmessage.jsp");
			rd.forward(request, response);
		}

	}

}