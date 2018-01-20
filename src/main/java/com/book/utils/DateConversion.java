package com.book.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

/**
 * 用来过滤时间的工具类
 * @author siye
 *
 */
public class DateConversion extends StrutsTypeConverter{

	private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		if(arg1!=null&&arg1.length>0){
			if(arg1[0]!=null&&arg1[0].length()>0){
				try {
					return sdf.parse(arg1[0]);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		return sdf.format(arg1);
	}

}
