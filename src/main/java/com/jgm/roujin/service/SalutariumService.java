package com.jgm.roujin.service;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.FileVO;
import com.jgm.roujin.domain.SalutariumVO;
import com.jgm.roujin.persistence.SalutariumDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class SalutariumService {
	
	
	
	private final SalutariumDao salDao; 

	public long insertSal(SalutariumVO salutariumVO, Principal principal) {
		// TODO Auto-generated method stub
		
		
	
		
		salutariumVO.setUsername(principal.getName());
		
		
		
		// checkbox null
		try {
			
			salutariumVO.setFeature(Arrays.toString(salutariumVO.getFeatureArr()));
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		salutariumVO.setView(0);
		
		 int ret = salDao.insertSal(salutariumVO); 
		 
		 log.debug("sequence: " + salutariumVO.getSequence());
		 
		 
		 return salutariumVO.getSequence();
		
	}

	public SalutariumVO findBySeq(Long sequence) {
		// TODO Auto-generated method stub
		
		
		SalutariumVO salVO =  salDao.findBySeq(sequence);
		
		
		
		// address分類
		
		salVO.setAddressArr(salVO.getAddress().split(","));
		salVO.setAddress(salVO.getAddress().replace(",", " "));
		
		// feature分類
		
		String featureDB = salVO.getFeature().replace("[", "");
		featureDB = featureDB.replace("]", "");
		salVO.setFeatureArr(featureDB.split(","));
		
		
		log.debug("SALVO: " + salVO.toString());
		
		return salVO;
	}

	public void countView(Long sequence) {
		// TODO Auto-generated method stub
		
		salDao.countView(sequence);
		
	}

	public List<SalutariumVO> findByAddress(String todohuken, String sikuchouson) {
		// TODO Auto-generated method stub
		
		
		return salDao.findByAddress(todohuken,sikuchouson);
	}

	public List<SalutariumVO> selectAll() {
		// TODO Auto-generated method stub
		return salDao.selectAll();
	}

}
