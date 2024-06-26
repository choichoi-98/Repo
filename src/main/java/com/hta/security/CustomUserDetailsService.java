package com.hta.security;

import java.util.ArrayList;
import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.mybatis.mapper.MemberMapper;


public class CustomUserDetailsService implements UserDetailsService {

	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);

	@Autowired
	private MemberMapper dao;

	@Override 
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException { 
	  logger.info("username 로그인 시 입력한 값 : " + username); 
	  Member users = dao.isId(username);
	  
	  if(users == null) { 
		  logger.info("username " + username + " not found"); 
		  throw new UsernameNotFoundException("username " + username + "not found"); 
	  }
	  
	  return users; 
	}
}