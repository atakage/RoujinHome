package com.jgm.roujin.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import com.jgm.roujin.domain.FileVO;
import com.jgm.roujin.domain.SalutariumVO;

public interface SalutariumDao {

	int insertSal(SalutariumVO salutariumVO);

	
	void insertFile(List<FileVO> fileList, long file_code);

}
