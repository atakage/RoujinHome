package com.jgm.roujin.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jgm.roujin.domain.FileVO;

public interface FileDao {

	
	@Select("SELECT MAX(file_code) FROM tbl_file")
	String findMaxCode();

	void insert(@Param("fileList") List<FileVO> fileList);

	@Select("SELECT * FROM tbl_file WHERE sequence = #{sequence}")
	List<FileVO> findBySeq(Long sequence);

	
}
