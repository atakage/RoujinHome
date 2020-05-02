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
		
		
		 int ret = salDao.insertSal(salutariumVO); 
		 
		 log.debug("sequence: " + salutariumVO.getSequence());
		 
		 
		 return salutariumVO.getSequence();
		
	}

}