package com.jgm.roujin.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jgm.roujin.domain.SalutariumVO;
import com.jgm.roujin.domain.UserDetailsVO;
import com.jgm.roujin.domain.UserVO;
import com.jgm.roujin.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@SessionAttributes("userVO")
@RequiredArgsConstructor
@Controller
public class RoujinController {
	
	@Autowired
	private final UserService userService;
	
	
	@ModelAttribute("userVO")
	public UserDetailsVO newUser() {
		return new UserDetailsVO();
	}
	
	

	
	
	
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
	public String joinUser(@ModelAttribute("userVO") UserDetailsVO userVO) {
		
		log.debug("userVO: " + userVO.toString());
		
		String msg = userService.insert(userVO);
		
		return msg;
	}
	
	
	
	
	@RequestMapping(value="/inputsal", method=RequestMethod.GET)
	public String inputSal(Model model) {
		
		SalutariumVO salVO = new SalutariumVO();		
		model.addAttribute("SALVO",salVO);
		
		return "input_sal";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	public String idCheck(String username) {
		
		
		log.debug("id: "+ username);
		
		String msg = userService.findByUserName(username);
		
		return msg;
		
	}
	
	
	@RequestMapping(value="/joinconcern", method=RequestMethod.GET)
	public String joinConcern(Model model) {
		
		model.addAttribute("JOINCONCERN", "JOINCONCERN");
		
		return "join";
	}
	
	
//	@ResponseBody
//	@RequestMapping(value="/joinconcern", method=RequestMethod.POST)
//	public String joinConcern(@ModelAttribute("userVO") UserDetailsVO userVO) {
//		
//		log.debug("userVO: " + userVO.toString());
//		
//		String msg = userService.insertCon(userVO);
//		
//		return msg;
//	}
	
	@RequestMapping(value="/searchcenter", method=RequestMethod.GET)
	public String searchCenter(Model model) {
		
		
		return "search_main";
	}

}
