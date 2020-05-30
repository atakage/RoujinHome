package com.jgm.roujin.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jgm.roujin.domain.UserDetailsVO;

public interface UserDao {

	@Select("SELECT * FROM tbl_user WHERE username = #{username}")
	UserDetailsVO findByUserName(String username);

	@Insert("INSERT INTO tbl_user(username, password, picture, enabled) VALUES(#{username}, #{password}, #{picture}, #{enabled})")
	int insert(UserDetailsVO userVO);

	List<UserDetailsVO> getAllUserList();

	@Update("UPDATE tbl_user SET enabled = #{enabled} WHERE username = #{username}")
	int enabledUser(@Param("username")String username, @Param("enabled")boolean enabled);

	@Select("SELECT picture FROM tbl_user WHERE username = #{username}")
	String findPicture(String username);

}
