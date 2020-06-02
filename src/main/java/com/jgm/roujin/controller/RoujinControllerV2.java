package com.jgm.roujin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.jgm.roujin.domain.CrawlVO;
import com.jgm.roujin.domain.QaVO;
import com.jgm.roujin.domain.SalutariumVO;
import com.jgm.roujin.persistence.SalQADao;
import com.jgm.roujin.service.KaigoQAService;
import com.jgm.roujin.service.SalQAService;
import com.jgm.roujin.service.SalutariumService;
import com.jgm.roujin.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@SessionAttributes("QAVO")
@Slf4j
@RequiredArgsConstructor
@RequestMapping(value="/v2")
@Controller
public class RoujinControllerV2 {

	
	private final KaigoQAService qaService;
	private final SalQAService salQAService;
	private final UserService uService;
	private final SalutariumService salService;
	
	@RequestMapping(value="/kaigoqa", method = RequestMethod.GET)
	public String kaigoQA(Model model) {
		
		CrawlVO crawlVO = qaService.startCrawl();
		
		
		model.addAttribute("CRAWLVO", crawlVO);
		
		
		return "kaigoqa";
	}

	/*
	 * 入力したデーター検証
	 */
	@ResponseBody
	@RequestMapping(value="/qainput", method = RequestMethod.POST)
	public String qaInput(QaVO qaVO, Model model) {
	
		List<? extends GrantedAuthority> authList = (List<? extends GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		
		log.debug("QAVO: " + qaVO);
		log.debug("AUTHLIST: " + authList.toString());
		
		if(!authList.get(0).getAuthority().equals("ROLE_user")) {
			return "ONLYUSER";
		}
		if(qaVO.getContent().length() > 2000) {
			return "MAXCONTENT";
		}
		
		String picture = uService.findPicture(SecurityContextHolder.getContext().getAuthentication().getName());
		
		qaVO.setPicture(picture);
		qaVO.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		qaVO.setGroupId(0);
		model.addAttribute("QAVO", qaVO);
		return "OK";
	}
	
	
	/*
	 * 検証したデーターをセーブ
	 */
	@RequestMapping(value="/qainputok", method=RequestMethod.POST)
	public String qaInputOK(@ModelAttribute("QAVO") QaVO qaVO, SessionStatus sessionStatus, Model model) {
		
		
		
		 qaVO = salQAService.input(qaVO);
		 qaVO.setPId(qaVO.getId());
		 salQAService.updateGroupId(qaVO);
		 
		 sessionStatus.setComplete();
		 
		 List<QaVO> qaList = salQAService.findBySeq(qaVO.getSalSequence());
		 log.debug("QALIST: "+ qaList.toString());
		 
		
		 model.addAttribute("QALIST",qaList);
		
		return "qabox_page";
	}
	
	
	@RequestMapping(value="/answerlist", method=RequestMethod.GET)
	public String answerList(Model model) {
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		
		// seq, name
		List<Long> salSeqList = salService.selectSeqByUserName(username);

		

		boolean complete = false;
		
		// 回答を待っている質問
		List<QaVO> noAnswerList = salQAService.findBySalSequenceInAndComplete(salSeqList,complete);
		
		//回答済み質問
		List<QaVO> AnswerCompleteList = salQAService.findByCompleteQA(salSeqList);
		
		
		log.debug("NOANSWERLIST: " + noAnswerList.toString());
		log.debug("ANSWERCOMPLETELIST: " + AnswerCompleteList.toString());
		
		model.addAttribute("NOANSWERLIST", noAnswerList);
		model.addAttribute("ANSWERCOMPLETELIST", AnswerCompleteList);
		
		return "answerlist_page";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/answerinput", method=RequestMethod.POST)
	public String answerInput(long id, String content) {
		
		log.debug("IDCONT: " + id +","+content);
		
		QaVO questionVO = salQAService.findById(id);
		
		
		// 質問が削除された場合に備えて
		if(questionVO != null) {
			
			String username = SecurityContextHolder.getContext().getAuthentication().getName();
			salQAService.input(QaVO.builder().PId(id).groupId(1).salSequence(questionVO.getSalSequence()).name(questionVO.getName()).username(username).content(content).complete(true).build());
			questionVO.setComplete(true);
			salQAService.input(questionVO);
			return "OK";
		}
		
		
		return "FAIL";
	}
}
