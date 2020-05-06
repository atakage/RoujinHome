package com.jgm.roujin.service;

import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.PaginationVO;
import com.jgm.roujin.persistence.PaginationDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class PaginationService {

	private final PaginationDao pagiDao;
	
	public PaginationVO pageInfo(PaginationVO pagiVO) {
		
		//PaginationVO newPagiVO = new PaginationVO();
		
		
		// Math.ceil:切り上げ
		pagiVO.setPageCnt((int)Math.ceil((double)pagiVO.getListCnt()/pagiVO.getListSize()));
		
		pagiVO.setStartPage((pagiVO.getRange() -1)*pagiVO.getRangeSize()+1);
		
		pagiVO.setEndPage(pagiVO.getRange()*pagiVO.getRangeSize());
		
		pagiVO.setStartList((pagiVO.getPage()-1) * pagiVO.getListSize());
		
		pagiVO.setPrev(pagiVO.getRange() == 1 ? false : true);
		
	
		
		pagiVO.setNext(pagiVO.getPageCnt() > pagiVO.getEndPage() ? true : false);
		
		//pagiVO.setNext(pagiVO.getEndPage() > pagiVO.getPageCnt() ? false:true);
	
		if(pagiVO.getEndPage() > pagiVO.getPageCnt()) {
			
			pagiVO.setEndPage(pagiVO.getPageCnt());
			pagiVO.setNext(false);
		
		}
		
	
		
		return pagiVO;
		
	}

	public int getListCnt() {
		// TODO Auto-generated method stub
		

		return pagiDao.getListCnt();
	}
}
