package com.jgm.roujin.service;

import java.util.List;
import java.util.Optional;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jgm.roujin.domain.QaVO;
import com.jgm.roujin.persistence.SalQADao;
import com.jgm.roujin.persistence.SalQAMapperDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class SalQAService {
	
	private final SalQADao salQADao;
	private final SalQAMapperDao salQAMapperDao;
	





	public QaVO input(QaVO qaVO) {
		// TODO Auto-generated method stub
		return salQADao.save(qaVO);
		
		
	}



	public List<QaVO> selectAll() {
		// TODO Auto-generated method stub
		

		List<QaVO> qaList = salQADao.findAll();

		
		return qaList;
	}



	public List<QaVO> findBySeq(long sal_sequence) {
		// TODO Auto-generated method stub
		
		
		
		return salQADao.findBySalSequence(sal_sequence);
	}



	public List<QaVO> findBySalSequenceInAndComplete(List<Long> salSeqList, boolean complete) {
		// TODO Auto-generated method stub
		return salQADao.findBySalSequenceInAndComplete(salSeqList, complete);
	}



	public List<QaVO> selectASCompleteAsMapper() {
		// TODO Auto-generated method stub
		return salQAMapperDao.selectASCompleteAsMapper();
	}



	public void updateGroupId(QaVO qaVO) {
		// TODO Auto-generated method stub
		salQADao.save(qaVO);
	}



	public List<QaVO> findByCompleteQA(List<Long> salSeqList) {
		// TODO Auto-generated method stub
		boolean complete = true;
		return salQADao.findBySalSequenceInAndCompleteOrderByPIdDescGroupIdAsc(salSeqList ,complete);
	}



	public QaVO findById(long id) {
		// TODO Auto-generated method stub
		Optional<QaVO> qaVO = salQADao.findById(id);
		return qaVO.get();
	}



	public List<QaVO> findBySalSequenceAndComplete(Long salSequence, boolean complete) {
		// TODO Auto-generated method stub
		return salQADao.findBySalSequenceAndComplete(salSequence, complete);
	}



	public List<QaVO> findBySalSequenceAndCompleteOrderByPIdDescGroupIdAsc(Long salSequence, boolean complete) {
		// TODO Auto-generated method stub
		return salQADao.findBySalSequenceAndCompleteOrderByPIdDescGroupIdAsc(salSequence, complete);
	}


	
	public void deleteByIdOrPId(long id, long p_id) {
		// TODO Auto-generated method stub
		salQADao.deleteByIdOrPId(id, p_id);
	}


	
	
}
