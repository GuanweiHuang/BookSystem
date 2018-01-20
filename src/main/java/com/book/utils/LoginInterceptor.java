package com.book.utils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 构建一个是否登录的拦截器
 * @author siye
 *
 */
public class LoginInterceptor extends MethodFilterInterceptor{

	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		if(arg0.getInvocationContext().getSession().get("LoginUser")==null){
			arg0.getInvocationContext().getSession().put("errorMessage", "请先登录");
			return "login";
		}
		return arg0.invoke();
	}

}
