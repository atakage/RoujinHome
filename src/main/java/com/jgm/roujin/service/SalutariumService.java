package com.jgm.roujin.service;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

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
			log.debug("inputsal: " + salutariumVO.getFeature());
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
		log.debug("FEATURE: " +salVO.getFeature());
		String featureDB = salVO.getFeature().replace("[", "");
		featureDB = featureDB.replace("]", "");
		
		log.debug("FEATURE: " +featureDB);
		
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

	public List<SalutariumVO> selectByPagi(int startList, int listSize) {
		// TODO Auto-generated method stub
		
		
		
		return salDao.selectByPagi(startList, listSize);
	}

	public List<SalutariumVO> selectByPagiAddr(int startList, int listSize, String todohuken, String sikuchouson) {
		// TODO Auto-generated method stub
		return salDao.selectByPagiAddr(startList, listSize, todohuken, sikuchouson);
	}

	public List<SalutariumVO> getPopSal() {
		// TODO Auto-generated method stub
		return salDao.getPopSal();
	}

	public List<SalutariumVO> findByUsername(String username) {
		// TODO Auto-generated method stub
		return salDao.findByUsername(username);
	}

	public SalutariumVO refinSalVO(SalutariumVO salVO) {
		// TODO Auto-generated method stub
		
	    String[] addrArr = salVO.getAddress().trim().split(" ");
	    salVO.setAddressArr(addrArr);
	    
	    String featureDB = salVO.getFeature().replace("[", "").replace(" ","");
		featureDB = featureDB.replace("]", "");
		salVO.setFeatureArr(featureDB.split(","));
		String[] imsi = salVO.getFeatureArr();
		
	    
	    
	     
		return salVO;
	}

	public long updateSal(SalutariumVO salVO, Principal principal) {
		// TODO Auto-generated method stub
		
		
		
		salVO.setUsername(principal.getName());
		
		
		
		// checkbox null
		try {
			
			
			
			
			log.debug("updatesal1: " + salVO.getFeature());
			if(salVO.getFeatureArr().length > 0) {
			salVO.setFeature(Arrays.toString(salVO.getFeatureArr()));
			log.debug("updatesal2: " + salVO.getFeature());
			}else {
				salVO.setFeature("null");	
			}
				
			
		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		log.debug("SALVOBEFOREUPDATE: " + salVO.toString());
		
		 int ret = salDao.updateSal(salVO); 
		 
		 log.debug("sequence: " + salVO.getSequence());
		 
		 
		 
		
		
		 return salVO.getSequence();
	}

	public String deleteSal(Long sequence) {
		// TODO Auto-generated method stub
		
		int ret = salDao.deleteSal(sequence);
		
		
		if(ret > 0) {
			return "削除成功";
		}else {
			return "削除失敗";
		}
		
	
	}

	public List<Long> selectSeqByUserName(String username) {
		// TODO Auto-generated method stub
		
		return salDao.selectSeqByUserName(username);
	}

}
