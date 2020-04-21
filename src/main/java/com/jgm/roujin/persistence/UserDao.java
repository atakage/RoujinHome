package com.jgm.roujin.persistence;

import org.apache.ibatis.annotations.Select;

import com.jgm.roujin.domain.UserVO;

public interface UserDao {

	@Select("SELECT * FROM tbl_user WHERE id = #{id}")
	UserVO findById(String id);

}
