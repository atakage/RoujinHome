package com.jgm.roujin.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.jgm.roujin.domain.AuthorityVO;

public interface AuthoritiesDao {

	@Select("SELECT * FROM authorities WHERE username = #{username}")
	List<AuthorityVO> findByUserName(String username);

}
