package com.wintersoldier.util;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("hongcode12@gmail.com", "aptl951^^");
	}
}
