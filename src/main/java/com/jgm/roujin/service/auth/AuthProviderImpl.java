package com.jgm.roujin.service.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.jgm.roujin.domain.UserDetailsVO;

public class AuthProviderImpl implements AuthenticationProvider{

	
	@Autowired
	@Qualifier("userDetailsService")
	private UserDetailsService udService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		
		
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		
		UserDetailsVO userVO =  (UserDetailsVO) udService.loadUserByUsername(username);
		
		
		if(!passwordEncoder.matches(password, userVO.getPassword())) {
			throw new BadCredentialsException("パスワードが違います");
		}
		
		
		
		if(!userVO.isEnabled()) {
			throw new BadCredentialsException(username+"権限なし");
		}
		
		
		
		
		
		return new UsernamePasswordAuthenticationToken(userVO, null, userVO.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}

	
	
	
	
}
