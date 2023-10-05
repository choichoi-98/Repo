package com.hta.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		logger.info("로그인 성공 : LoginSuccessHandler ");
		
		//String MEMBER_ID = request.getParameter("id");
		
		HttpSession session = request.getSession();
		//session.setAttribute("loginUser", authentication.getName());
		//session.setAttribute("MEMBER_ID", MEMBER_ID);
		session.removeAttribute("loginfail");
		
		String url = request.getContextPath() +  "/main";
		response.sendRedirect(url);
	}

}
