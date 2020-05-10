package com.jgm.roujin.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jgm.roujin.domain.FileVO;
import com.jgm.roujin.domain.SalutariumVO;

public interface FileDao {

	
	@Select("SELECT MAX(file_code) FROM tbl_file")
	String findMaxCode();

	void insert(@Param("fileList") List<FileVO> fileList);

	@Select("SELECT * FROM tbl_file WHERE sequence = #{sequence} ORDER BY main_image DESC")
	List<FileVO> findBySeq(Long sequence);

	List<FileVO> findBySalList(@Param("salList") List<SalutariumVO> salList);

	
	@Delete("DELETE FROM tbl_file WHERE sequence = #{sequence} AND main_image = 1")
	void deleteMainImgBySeq(long sequence);

	@Insert("INSERT INTO tbl_file(sequence,file_code,file_origin_name,file_upload_name,main_image) VALUES(#{sequence},#{file_code},#{file_origin_name},#{file_upload_name},#{main_image})")
	void insertMainFile(FileVO fileVO);

	void deleteFile(String[] delFileList);

	


	
}
