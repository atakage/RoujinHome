package com.jgm.roujin.persistence;

import org.apache.ibatis.annotations.Select;

public interface PaginationDao {

	@Select("SELECT COUNT(*) FROM tbl_salutarium;")
	int getListCnt();

	
}
