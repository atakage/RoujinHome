package com.jgm.roujin.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jgm.roujin.domain.FileVO;
import com.jgm.roujin.domain.SalutariumVO;
import com.jgm.roujin.domain.UserDetailsVO;
import com.jgm.roujin.service.FileService;
import com.jgm.roujin.service.SalutariumService;
import com.jgm.roujin.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@SessionAttributes("userVO")
@RequiredArgsConstructor
@Controller
public class RoujinController {
	

	private final UserService userService;
	private final FileService fileService;
	private final SalutariumService salService;
	
	
	@ModelAttribute("userVO")
	public UserDetailsVO newUser() {
		return new UserDetailsVO();
	}
	
	

	
	
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(@RequestParam("sequence") String sequence, Model model) {
		
		SalutariumVO salVO = salService.findBySeq(Long.valueOf(sequence));
		
		model.addAttribute("SALVO", salVO);
		
		return "view";
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
	
	
	
	/*
	 * MultipartHttpServletRequestは分けて受ける
	 */
	@RequestMapping(value="/inputsal", method=RequestMethod.POST)
	public String inputSal(SalutariumVO salutariumVO, MultipartHttpServletRequest file, Principal principal) {
		
		log.debug("salutariumVO: " + salutariumVO.toString());
		log.debug("FILE: " + file.toString());

		
		
		long sequence = salService.insertSal(salutariumVO, principal);
		
	
		
		
		List<FileVO> fileList = fileService.filesUp(file,sequence);
		
		
		if(fileList != null) {
		log.debug("FILELIST: " + fileList.toString());
		fileService.insert(fileList);
		}
		
		

		
		return "redirect:/";
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
	
	

	
	@RequestMapping(value="/searchcenter", method=RequestMethod.GET)
	public String searchCenter(Model model) {
		
		
		return "search_main";
	}

}
