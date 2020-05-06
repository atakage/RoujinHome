package com.jgm.roujin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jgm.roujin.domain.FileVO;
import com.jgm.roujin.domain.SalutariumVO;
import com.jgm.roujin.service.FileService;
import com.jgm.roujin.service.SalutariumService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class HomeController {
	
	private final SalutariumService salService;
	private final FileService fileService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<SalutariumVO> salList = salService.getPopSal();
			
		List<FileVO> fileList = fileService.findBySalList(salList);
		
		
		// 施設検索ページで見せる代表イメージをセットする作業
		for(int i=0; i <= salList.size()-1;i++) {
			
			
			for(int j=0; j <= fileList.size()-1; j++) {
				
				if(salList.get(i).getSequence() == fileList.get(j).getSequence()) {
					

					
					salList.get(i).setFile_upload_name(fileList.get(j).getFile_upload_name());
					break;
				}
			}
			
		}
		
		
		model.addAttribute("SALLIST", salList);
		
		
		return "home";
	}
	
}
