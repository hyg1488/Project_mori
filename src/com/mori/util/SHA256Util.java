package com.mori.util;

import java.security.MessageDigest;

public class SHA256Util {
	public static String getEncSHA256(String txt){
	    StringBuffer sbuf = new StringBuffer();
	    
	    MessageDigest mDigest = null;
	    try {
	    	mDigest = MessageDigest.getInstance("SHA-256");
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }

	   	mDigest.update(txt.getBytes());
	     
	   	byte[] msgStr = mDigest.digest() ;
	    for(int i=0; i < msgStr.length; i++){
	        byte tmpStrByte = msgStr[i];
	        String tmpEncTxt = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);
	         
	        sbuf.append(tmpEncTxt) ;
	    }
	     
	    return sbuf.toString();
	}
}
