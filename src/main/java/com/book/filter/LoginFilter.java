package com.book.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 验证用户登录的过滤器
 * @author siye
 */
public class LoginFilter implements Filter {

    public LoginFilter() {
    }

	public void destroy() {
	}

	private String allowPath = "/index.jsp,/css/bootstrap.css," +
			"/iconfont/style.css,/images/main_bg.png,/images/bg.jpg" +
			"/js/jquery-1.7.2.min.js,userAction_doLogin.action";
	
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		response.setContentType("text/html;charset=utf-8");
		
		if(request.getSession().getAttribute("LoginUser") == null && allowPath.indexOf(request.getServletPath()) < 0){
			response.getWriter().print("<script>alert('请先登录');location.href='"+request.getContextPath()+"/index.jsp';</script>");
			response.getWriter().close();
		}else{
			chain.doFilter(arg0, arg1);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}
}
