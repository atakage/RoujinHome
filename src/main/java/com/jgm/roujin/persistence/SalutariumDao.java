package com.jgm.roujin.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
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


	List<SalutariumVO> findByAddress(@Param("todohuken") String todohuken, @Param("sikuchouson")String sikuchouson);

	@Select("SELECT * FROM tbl_salutarium")
	List<SalutariumVO> selectAll();

	@Select("SELECT * FROM tbl_salutarium LIMIT #{startList},#{listSize} ")
	List<SalutariumVO> selectByPagi(@Param("startList") int startList, @Param("listSize") int listSize);

	
	List<SalutariumVO> selectByPagiAddr(@Param("startList") int startList, @Param("listSize") int listSize, @Param("todohuken") String todohuken, @Param("sikuchouson") String sikuchouson);

	@Select("SELECT * FROM tbl_salutarium ORDER BY VIEW DESC LIMIT 3")
	List<SalutariumVO> getPopSal();

	@Select("SELECT * FROM tbl_salutarium WHERE username = #{username}")
	List<SalutariumVO> findByUsername(String username);


	int updateSal(SalutariumVO salVO);

	@Delete("DELETE FROM tbl_salutarium WHERE sequence = #{sequence}")
	int deleteSal(Long sequence);


	

}
