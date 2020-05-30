package com.jgm.roujin.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jgm.roujin.domain.QaVO;


@Repository
public interface SalQADao extends JpaRepository<QaVO, Long>{

	
	// JPA repository underbar 認識不可能(sal_sequnece X!!)
	List<QaVO> findBySalSequence(long sal_sequence);

	

	
}
