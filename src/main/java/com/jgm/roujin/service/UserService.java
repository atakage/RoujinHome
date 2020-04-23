package com.jgm.roujin.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.UserDetailsVO;
import com.jgm.roujin.domain.UserVO;
import com.jgm.roujin.persistence.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
	

	private final UserDao userDao;
	private final PasswordEncoder passwordEncoder;
	
	public String findByUserName(String username) {
		// TODO Auto-generated method stub
		
		UserDetailsVO userVO = userDao.findByUserName(username);
		
		
		if(userVO != null) {
			return "exist";
		}
		
		
		return "null";
	}

	public String insert(UserDetailsVO userVO) {
		// TODO Auto-generated method stub
		
		
		userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		
		//authority setting
		
		log.debug("password: " + userVO.getPassword());
		
		 int ret = userDao.insert(userVO);
		 
		 if(ret < 1) {
			 return "FAIL";
		 }
		return "SUCCESS";
	}

}
