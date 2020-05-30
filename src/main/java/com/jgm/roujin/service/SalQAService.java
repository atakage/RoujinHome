package com.jgm.roujin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.QaVO;
import com.jgm.roujin.persistence.SalQADao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class SalQAService {
	
	private final SalQADao salQADao;
	
	





	public void input(QaVO qaVO) {
		// TODO Auto-generated method stub
		salQADao.save(qaVO);
		
		
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

	
}
