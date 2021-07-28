package com.mori.controller.japanese;

import com.mori.service.Action;
import com.mori.service.japanese.JapaneseAction;
import com.mori.service.japanese.JapaneseResultAction;

public class JapaneseActionFactory {
	private JapaneseActionFactory() {}
	private static JapaneseActionFactory instance = new JapaneseActionFactory();
	
	public static JapaneseActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String cmd) {
		Action action = null;
		System.out.println("들어온 요청 : " + cmd);
		
		if (cmd.equals("test")) {
			action = new JapaneseAction();
		}else if(cmd.equals("result")) {
			action = new JapaneseResultAction();
		}
		
		return action;
	}
}