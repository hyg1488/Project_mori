package com.wintersoldier.util;

public class checkbox {
	public static String check(String[] interestL) {
		String result ="";
		int sports = 0;
		int web = 0;
		int trip = 0;
		int video = 0;
		int drama = 0;
		int game = 0;
		int movie = 0;
		for (int i = 0; i < interestL.length; i++) {
			if(interestL[i].equals("스포츠")) {
				result = result +"<input id=\"sports\" type=\"checkbox\" name=\"hobby\" value=\"스포츠\" checked>\r\n" + 
						"			<label for=\"sports\">스포츠</label>";
				sports = 1;
			}else if(interestL[i].equals("웹서핑")) {
				result = result+"<input id=\"web\"type=\"checkbox\" name=\"hobby\" value=\"웹서핑\" checked> <labelfor=\"web\">웹서핑</label>";
				web = 1;
			}else if(interestL[i].equals("영상")) {
				result = result+"<input id=\"video\" type=\"checkbox\" name=\"hobby\" value=\"영상\" checked><label for=\"video\">영상</label>";
				video = 1;
			}else if(interestL[i].equals("영화")) {
				result = result+"<input id=\"movie\" type=\"checkbox\" name=\"hobby\" value=\"영화\" checked> <label for=\"movie\">영화</label>";
				movie = 1;
			}else if(interestL[i].equals("드라마")) {
				result = result+"<input id=\"drama\" type=\"checkbox\" name=\"hobby\" value=\"드라마\" checked> <label for=\"drama\">드라마</label>";
				drama = 1;
			}else if(interestL[i].equals("게임")) {
				result = result+"<input id=\"game\" type=\"checkbox\" name=\"hobby\" value=\"게임\" checked><label for=\"game\">게임</label>";
				game = 1;
			}else if(interestL[i].equals("여행")) {
				result = result+"<input id=\"trip\" type=\"checkbox\" name=\"hobby\" value=\"여행\" checked> <label for=\"trip\">여행</label>";
				trip = 1;
			}
		}
		if(sports == 0) result = result+"<input id=\"sports\" type=\"checkbox\" name=\"hobby\" value=\"스포츠\"><label for=\"sports\">스포츠</label>";
		
		if(web == 0) result = result+"<input id=\"web\" type=\"checkbox\" name=\"hobby\" value=\"웹서핑\"><label for=\"web\">웹서핑</label>";
		if(trip == 0) result = result+"<input id=\"trip\" type=\"checkbox\" name=\"hobby\" value=\"여행\"> <label for=\"trip\">여행</label>";
		if(video == 0) result = result+"<input id=\"video\" type=\"checkbox\" name=\"hobby\" value=\"영상\"><label for=\"video\">영상</label>";
		if(movie == 0) result = result+"<input id=\"movie\" type=\"checkbox\" name=\"hobby\" value=\"영화\"> <label for=\"movie\">영화</label> ";
		if(drama == 0) result = result+"<input id=\"drama\" type=\"checkbox\"name=\"hobby\" value=\"드라마\"> <label for=\"drama\">드라마</label>";
		if(game == 0) result = result+"<input id=\"game\" type=\"checkbox\" name=\"hobby\" value=\"게임\"><label for=\"game\">게임</label>";
		
		return result;
	}
}
