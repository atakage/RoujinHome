package com.jgm.roujin.persistence;

import java.util.List;

import javax.persistence.OneToMany;
import javax.transaction.Transactional;

import org.hibernate.annotations.OrderBy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jgm.roujin.domain.QaVO;


@Repository
public interface SalQADao extends JpaRepository<QaVO, Long>{

	
	// JPA repository underbar 認識不可能(sal_sequnece X!!)
	List<QaVO> findBySalSequence(long sal_sequence);

	List<QaVO> findBySalSequenceInAndComplete(List<Long> salSeqList, boolean complete);

	List<QaVO> findBySalSequenceAndComplete(Long salSequence, boolean complete);
	
	
	List<QaVO> findBySalSequenceInAndCompleteOrderByPIdDescGroupIdAsc(List<Long> salSeqList , boolean complete);
	
	List<QaVO> findBySalSequenceAndCompleteOrderByPIdDescGroupIdAsc(Long salSequence , boolean complete);

	@Transactional
	void deleteByIdOrPId(long id, long p_id);
	
	
	//List<QaVO> selectASCompleteAsMapper();

	//List<QaVO> findAllBySalSequenceAndPIdAndComplete(List<Long> salSeqList,long 0, boolean false);

	
}
