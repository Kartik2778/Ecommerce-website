package com.mycart.helper;

public class Helper {
	public static String get10words(String desc) {
		String[] str = desc.split(" ");
		if(str.length > 10 ) {
			String result = "";
			for(int i = 0; i < 10; i++) {
				result = result+str[i]+" ";
			}
			return result+" ...";
			
		}
		else {
			return (desc+" ...");
		}
	}
	public static String get6words(String title) {
		String[] str = title.split(" ");
		if(str.length > 6 ) {
			String result = "";
			for(int i = 0; i < 6; i++) {
				result = result+str[i]+" ";
			}
			return result+" ...";
			
		}
		else {
			return (title+" ...");
		}
	}
	
}
