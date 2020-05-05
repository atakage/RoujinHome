package com.jgm.roujin.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jgm.roujin.domain.FileVO;
import com.jgm.roujin.domain.PaginationVO;
import com.jgm.roujin.domain.SalutariumVO;
import com.jgm.roujin.domain.UserDetailsVO;
import com.jgm.roujin.service.FileService;
import com.jgm.roujin.service.PaginationService;
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
	private final PaginationService pagiService;
	
	
	@ModelAttribute("userVO")
	public UserDetailsVO newUser() {
		return new UserDetailsVO();
	}
	
	

	
	
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(@RequestParam("sequence") String sequence, Model model) {
		
		SalutariumVO salVO = salService.findBySeq(Long.valueOf(sequence));
		salService.countView(Long.valueOf(sequence));
		
		List<FileVO> fileList = fileService.findBySeq(Long.valueOf(sequence));
		
		
		
		
		model.addAttribute("SALVO", salVO);
		model.addAttribute("FILELIST", fileList);
		
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
	public String searchCenter(Model model, @RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		
		log.debug("page,range: " + page +","+ range);
		
		
		int listCnt = pagiService.getListCnt();
		
		log.debug("LISTCOUNT: " + listCnt);
		
		PaginationVO pagiVO = new PaginationVO();
		pagiVO.setListCnt(listCnt);
		pagiVO.setPage(page);
		pagiVO.setRange(range);
		

		pagiVO = pagiService.pageInfo(pagiVO);
		

		
		//List<SalutariumVO> salList =  salService.selectAll();
		
		log.debug("st,ls: "+pagiVO.getStartList() +",,,," +pagiVO.getListSize());
		
		List<SalutariumVO> salList =  salService.selectByPagi(pagiVO.getStartList(), pagiVO.getListSize());
		List<FileVO> fileList = fileService.findBySalList(salList);
		
		
		log.debug("PAGIVO: " + pagiVO.toString());
		log.debug("SALLIST: "+salList.toString() );
		log.debug("ENDPAGE: "+pagiVO.getEndPage() );
		
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
		model.addAttribute("PAGIVO", pagiVO);

		
		return "search_main";
	}
	
	
	
	
	@RequestMapping(value="/searchcenter", method=RequestMethod.POST)
	public String searchCenter(String todohuken, String sikuchouson, Model model) {
		
		
		// post submitのとき文字化けのため
		if(todohuken.equals("hokkaido")) {
			todohuken = "北海道";
		}else if(todohuken.equals("tokyo")) {
			todohuken = "東京都";
		}
		
		if(sikuchouson.equals("sapporo")) {
			sikuchouson = "札幌市";
		}else if(sikuchouson.equals("nemuro")) {
			sikuchouson = "根室市";
		}else if(sikuchouson.equals("kodaira")) {
			sikuchouson = "小平市";
		}else if(sikuchouson.equals("machida")) {
			sikuchouson = "町田市";
		}
		
		List<SalutariumVO> salList = salService.findByAddress(todohuken, sikuchouson);
		int resultCount = salList.size();
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
		
		
		
		
		
		
		
		model.addAttribute("RESULTCOUNT", resultCount);
		model.addAttribute("SALLIST", salList);
		
		
		return "search_main";
	}

}
