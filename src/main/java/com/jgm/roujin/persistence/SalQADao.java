package com.jgm.roujin.persistence;

import java.util.List;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jgm.roujin.domain.QaVO;


@Repository
public interface SalQADao extends JpaRepository<QaVO, Long>{

	
	// JPA repository underbar 認識不可能(sal_sequnece X!!)
	List<QaVO> findBySalSequence(long sal_sequence);

	List<QaVO> findBySalSequenceInAndPIdAndComplete(List<Long> salSeqList, long p_id, boolean complete);

	
	
	//List<QaVO> selectASCompleteAsMapper();

	//List<QaVO> findAllBySalSequenceAndPIdAndComplete(List<Long> salSeqList,long 0, boolean false);

	
}
