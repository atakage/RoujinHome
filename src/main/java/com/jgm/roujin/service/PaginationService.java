package com.jgm.roujin.service;

import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.PaginationVO;

@Service
public class PaginationService {

	
	public void pageInfo(PaginationVO pagiVO) {
		
		//PaginationVO newPagiVO = new PaginationVO();
		
		
		// Math.ceil:切り上げ
		pagiVO.setPageCnt((int)Math.ceil(pagiVO.getListCnt()/pagiVO.getListSize()));
		
		pagiVO.setStartPage((pagiVO.getRange() -1)*pagiVO.getRangeSize()+1);
		
		pagiVO.setEndPage(pagiVO.getRange()*pagiVO.getRangeSize());
		
		pagiVO.setStartList((pagiVO.getPage()-1) * pagiVO.getListSize());
		
		pagiVO.setPrev(pagiVO.getRange() == 1 ? false : true);
		
		pagiVO.setNext(pagiVO.getEndPage() > pagiVO.getPageCnt() ? false:true);
		
		if(pagiVO.getEndPage() > pagiVO.getPageCnt()) {
			
			pagiVO.setEndPage(pagiVO.getPageCnt());
			pagiVO.setNext(false);
		}
		
	}
}
