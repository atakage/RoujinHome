package com.jgm.roujin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.UserVO;
import com.jgm.roujin.persistence.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
	

	private final UserDao userDao;
	//private final PasswordEncoder passwordEncoder;
	
	public String findById(String id) {
		// TODO Auto-generated method stub
		
		UserVO userVO = userDao.findById(id);
		
		
		if(userVO != null) {
			return "exist";
		}
		
		
		return "null";
	}

	public String insert(UserVO userVO) {
		// TODO Auto-generated method stub
		
		
		//userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		userVO.setGrade("user");
		
		log.debug("password: " + userVO.getPassword());
		
		 int ret = userDao.insert(userVO);
		 
		 if(ret < 1) {
			 return "FAIL";
		 }
		return "SUCCESS";
	}

}
