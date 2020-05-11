package com.jgm.roujin.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.jgm.roujin.domain.UserDetailsVO;
import com.jgm.roujin.domain.UserVO;

public interface UserDao {

	@Select("SELECT * FROM tbl_user WHERE username = #{username}")
	UserDetailsVO findByUserName(String username);

	@Insert("INSERT INTO tbl_user(username, password, picture, enabled) VALUES(#{username}, #{password}, #{picture}, #{enabled})")
	int insert(UserDetailsVO userVO);

	List<UserDetailsVO> getAllUserList();

}
