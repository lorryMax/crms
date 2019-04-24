package com.sxt.sys.utils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * springmvc的web常用对象获取工具类
 * @author LJH
 *
 */
public class WebUtils {

	/**
	 * 得到ServletRequestAttributes
	 * @return
	 */
	public static ServletRequestAttributes getServletRequestAttributes() {
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes();
		return requestAttributes;
	}

	/**
	 * 得到当前线程的HttpServletRequest
	 */
	public static HttpServletRequest getCurrentRequest() {
		HttpServletRequest request = getServletRequestAttributes().getRequest();
		return request;
	}

	/**
	 * 得到当前线程的HttpServletResponse
	 */
	public static HttpServletResponse getCurrentResponse() {
		HttpServletResponse response = getServletRequestAttributes()
				.getResponse();
		return response;
	}

	/**
	 * 得到当前线程的HttpSession
	 */
	public static HttpSession getCurrentSession() {
		return getCurrentRequest().getSession();
	}

	/**
	 * 得到当服务器的ServletContext
	 */
	public static ServletContext getServletContext() {
		return getCurrentRequest().getServletContext();
	}

}
