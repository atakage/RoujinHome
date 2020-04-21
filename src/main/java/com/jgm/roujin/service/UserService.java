package com.jgm.roujin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.UserVO;
import com.jgm.roujin.persistence.UserDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {
	
	@Autowired
	private final UserDao userDao;
	
	public String findById(String id) {
		// TODO Auto-generated method stub
		
		UserVO userVO = userDao.findById(id);
		
		
		if(userVO != null) {
			return "exist";
		}
		
		
		return "null";
	}

}
