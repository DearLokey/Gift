package com.gift.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OPTime {

	public static String getTime(){
		String time;
		SimpleDateFormat smdFormat=new SimpleDateFormat("yyyyMMdd");
		time=smdFormat.format(new Date());
		return time;
	}
}
