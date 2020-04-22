package com.jgm.roujin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jgm.roujin.domain.UserVO;
import com.jgm.roujin.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class RoujinController {
	
	@Autowired
	private final UserService userService;
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value="/joinuser", method=RequestMethod.GET)
	public String joinUser(Model model) {
		
		model.addAttribute("JOINUSER", "JOINUSER");
		
		return "join";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/joinuser", method=RequestMethod.POST)
	public String joinUser(UserVO userVO) {
		
		log.debug("userVO: " + userVO.toString());
		
		String msg = userService.insert(userVO);
		
		return msg;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	public String idCheck(String id) {
		
		
		log.debug("id: "+ id);
		
		String msg = userService.findById(id);
		
		return msg;
		
	}
	
	
	@RequestMapping(value="/joinconcern", method=RequestMethod.GET)
	public String joinConcern(Model model) {
		
		model.addAttribute("JOINCONCERN", "JOINCONCERN");
		
		return "join";
	}
	
	@RequestMapping(value="/searchcenter", method=RequestMethod.GET)
	public String searchCenter(Model model) {
		
		
		return "search_main";
	}

}
