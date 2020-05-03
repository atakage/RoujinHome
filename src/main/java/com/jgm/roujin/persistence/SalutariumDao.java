package com.jgm.roujin.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jgm.roujin.domain.FileVO;
import com.jgm.roujin.domain.SalutariumVO;

public interface SalutariumDao {

	int insertSal(SalutariumVO salutariumVO);

	
	void insertFile(List<FileVO> fileList, long file_code);

	@Select("SELECT * FROM tbl_salutarium WHERE sequence = #{sequence}")
	SalutariumVO findBySeq(Long sequence);


	@Update("UPDATE tbl_salutarium SET view = view+1 WHERE sequence = #{sequence}")
	void countView(Long sequence);

}
