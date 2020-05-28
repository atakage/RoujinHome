package com.jgm.roujin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jgm.roujin.domain.CrawlVO;
import com.jgm.roujin.service.KaigoQAService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping(value="/v2")
@Controller
public class RoujinControllerV2 {

	
	private final KaigoQAService qaService;
	
	@RequestMapping(value="/kaigoqa", method = RequestMethod.GET)
	public String kaigoQA(Model model) {
		
		CrawlVO crawlVO = qaService.startCrawl();
		
		
		model.addAttribute("CRAWLVO", crawlVO);
		
		
		return "kaigoqa";
	}
}
