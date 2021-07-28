package com.wintersoldier.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.wintersoldier.domain.user.UserDAO;
import com.wintersoldier.domain.user.UserVO;
import com.wintersoldier.service.Action;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.wintersoldier.util.Gmail;
import com.wintersoldier.util.SHA256Util;

import java.util.Properties;
import java.util.Random;

public class UserEmailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserDAO dao = UserDAO.getInstance();
		String userID = null;
		String mail = null;
		int row = 0;
		HttpSession session = request.getSession(); // 세션 객체 생성
		if(session.getAttribute("userinfo") != null) {
			UserVO vo = (UserVO) session.getAttribute("userinfo");
			userID = vo.getUserid();
			mail = vo.getEmail();
		}else {
			userID = request.getParameter("userid");
			mail = request.getParameter("email01")+"@"+request.getParameter("email02");
		}
		
		System.out.println(mail);
		System.out.println(userID);
		
		
		String host = "http://localhost:8089/WinterSoldier/";
		String from = "hongcode12@gmail.com";
		String to = mail;
		String subject = "귀하의 모리 계정 - 이메일 인증입니다.";
		String contents = "";
		if(session.getAttribute("userinfo")!=null) {
			contents = "다음 링크에 접속하여 이메일 인증을 진행하세요. <a href='"+host+"emailCheckAction.jsp?code="+
					new SHA256Util().getEncSHA256(to)+"'> 이메일 인증하기 </a>";
		}else {
			Random rnd = new Random();
			String randomStr = "M";
			for (int i = 0; i <= 2; i++) {
				randomStr = randomStr+String.valueOf((char) ((int) (rnd.nextInt(26)) + 65));
			}for (int i = 0; i <= 3; i++) {
				randomStr = randomStr+String.valueOf(rnd.nextInt(10));
			}	
			System.out.println(new SHA256Util().getEncSHA256(randomStr));
			contents = "임시 비밀번호 : <strong>"+randomStr+"</strong> <br> 해당 비밀번호로 로그인 하여 비밀번호를 재설정 해주세요.";
			row = dao.userNewPass(userID, new SHA256Util().getEncSHA256(randomStr), mail);
			
			if(row==1) {
				Properties p = new Properties();
				p.put("mail.smtp.user", from);
				p.put("mail.smtp.host",	"smtp.googlemail.com");
				p.put("mail.smtp.port", "465");
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.smtp.auth", "true");
				p.put("mail.smtp.debug", "true");
				p.put("mail.smtp.socketFactory.port", "465");
				p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				p.put("mail.smtp.socketFactory.fallback", "false");
				
				try {
					Authenticator auth = new Gmail();
					Session ses = Session.getInstance(p,auth);
					ses.setDebug(true);
					MimeMessage msg = new MimeMessage(ses);
					msg.setSubject(subject);
					Address fromAddr = new InternetAddress(from);
					msg.setFrom(fromAddr);
					Address toAddr = new InternetAddress(to);
					msg.addRecipient(Message.RecipientType.TO, toAddr);
					msg.setContent(contents, "text/html; charset=UTF8");
					Transport.send(msg);
				}catch(Exception e) {
					row=12;
				}
			}
		}
		

		if(session.getAttribute("userinfo") != null) {
			RequestDispatcher dis = request.getRequestDispatcher("Index");
			dis.forward(request, response);
		}else {
			if(row == 1) {
				RequestDispatcher dis = request.getRequestDispatcher("User?cmd=user_search&cnt=1");
				dis.forward(request, response);
			}else {
				RequestDispatcher dis = request.getRequestDispatcher("User?cmd=user_search&cnt=5");
				dis.forward(request, response);
			}
		}
		
	}

}
