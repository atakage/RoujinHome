package com.jgm.roujin.service.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.AuthorityVO;
import com.jgm.roujin.domain.UserDetailsVO;
import com.jgm.roujin.persistence.AuthoritiesDao;
import com.jgm.roujin.persistence.UserDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService{

	
	private final AuthoritiesDao authDao;
	private final UserDao userDao;
	
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		
		UserDetailsVO userVO = userDao.findByUserName(username);
		
		if(userVO == null) {
			throw new UsernameNotFoundException("IDが存在しません");
		}
		
		
		
		userVO.setAccountNonExpired(true);
		userVO.setAccountNonLocked(true);
		userVO.setCredentialsNonExpired(true);
		
		
		userVO.setAuthorities( this.getAuthorities(username));
		
		return userVO;
	}



	private Collection<GrantedAuthority> getAuthorities(String username) {
		// TODO Auto-generated method stub
		
		
		List<AuthorityVO> authList = authDao.findByUserName(username);
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		
		for(AuthorityVO authVO : authList) {
			SimpleGrantedAuthority sAuth = new SimpleGrantedAuthority(authVO.getAuthority());
			authorities.add(sAuth);
		}
		
		return authorities;
	}
	
	
	
}
