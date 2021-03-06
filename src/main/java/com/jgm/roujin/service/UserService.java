package com.jgm.roujin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.AuthorityVO;
import com.jgm.roujin.domain.UserDetailsVO;
import com.jgm.roujin.persistence.AuthoritiesDao;
import com.jgm.roujin.persistence.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
	

	private final UserDao userDao;
	private final AuthoritiesDao authDao;
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
		userVO.setEnabled(true);
		
		
		
		
		log.debug("password: " + userVO.getPassword());
		
		
		//referenced テーブル
		 int ret = userDao.insert(userVO);
		 
		 
		 List<AuthorityVO> authList = new ArrayList();
		 if(userVO.getPicture().equals("none")) {
			 
			 // DBにauthority入れる時は必ずROLE_をつけてセーブ!!
			 authList.add(AuthorityVO.builder().username(userVO.getUsername()).authority("ROLE_concern").build());
		 }else {
			 authList.add(AuthorityVO.builder().username(userVO.getUsername()).authority("ROLE_user").build());
		 }
		 //Foreign Key Constraintのため参照されるデーターは後でINSERT
		 authDao.insert(authList);
		 
		 if(ret < 1) {
			 return "FAIL";
		 }
		return "SUCCESS";
	}

	public List<UserDetailsVO> getAllUserList() {
		// TODO Auto-generated method stub
		return userDao.getAllUserList();
	}

	public String enabledUser(String username, String enabledStr) {
		// TODO Auto-generated method stub
		boolean enabled;
		if(enabledStr.equals("true")) {
			enabled = false;
			enabledStr = "false";
		}else{
			enabled = true;
			enabledStr = "true";
		}
		
		
		log.debug("ENABLED: " + enabled);
		
		int ret = userDao.enabledUser(username, enabled);
		
		if(ret > 0) {
			return enabledStr;
		}
		
		return "権限設定失敗";
	}

	public String findPicture(String username) {
		// TODO Auto-generated method stub
		
		return userDao.findPicture(username);
		
	}

}
