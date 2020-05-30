package com.jgm.roujin.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jgm.roujin.domain.FileVO;
import com.jgm.roujin.domain.PaginationVO;
import com.jgm.roujin.domain.QaVO;
import com.jgm.roujin.domain.SalutariumVO;
import com.jgm.roujin.domain.UserDetailsVO;
import com.jgm.roujin.service.FileService;
import com.jgm.roujin.service.PaginationService;
import com.jgm.roujin.service.SalQAService;
import com.jgm.roujin.service.SalutariumService;
import com.jgm.roujin.service.UserService;
import com.jgm.roujin.socket.EchoHandler;

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
	private final EchoHandler handler;
	private final SalQAService salQAService;
	
	
	@ModelAttribute("userVO")
	public UserDetailsVO newUser() {
		return new UserDetailsVO();
	}
	
	

	
	
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(@RequestParam("sequence") String sequence, Model model) {
		
		SalutariumVO salVO = salService.findBySeq(Long.valueOf(sequence));
		salService.countView(Long.valueOf(sequence));
		
		List<FileVO> fileList = fileService.findBySeq(Long.valueOf(sequence));
		
		List<QaVO> qaList = salQAService.findBySeq(Long.valueOf(sequence));

		 
		
		
		log.debug("SALVO: " + salVO.toString());
		
		model.addAttribute("SALVO", salVO);
		model.addAttribute("FILELIST", fileList);
		model.addAttribute("QALIST",qaList);
		
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
	public String inputSal(SalutariumVO salutariumVO, MultipartFile mainFile,  MultipartHttpServletRequest file, Principal principal, RedirectAttributes redirectAttributes) {
		
		log.debug("salutariumVO: " + salutariumVO.toString());
		log.debug("FILE: " + file.toString());

		
		
		long sequence = salService.insertSal(salutariumVO, principal);
		
	
		
		//メインイメージアップロード
		FileVO fileVO =  fileService.mainFileUp(mainFile, sequence);
		if(fileVO != null) {
		fileService.insertMainFile(fileVO);
		}
		
		
		
		List<FileVO> fileList = fileService.filesUp(file,sequence);
		
		
		if(fileList != null) {
		log.debug("FILELIST: " + fileList.toString());
		fileService.insert(fileList);
		}
		
		
		handler.insertNotify(salutariumVO.getName());
		
		
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
		
		if(salList.size() > 0) {
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
		}
		
		
		model.addAttribute("SALLIST", salList);
		model.addAttribute("PAGIVO", pagiVO);

		
		return "search_main";
	}
	
	
	
	
	@RequestMapping(value="/searchcenteraddr", method=RequestMethod.GET)
	public String searchCenterAddr(@RequestParam("todohuken") String todohuken, @RequestParam("sikuchouson") String sikuchouson, Model model,
			@RequestParam(required =false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		
		
		log.debug("todosiku: " + todohuken + sikuchouson);
		
		
		List<SalutariumVO> salListForCnt = salService.findByAddress(todohuken, sikuchouson);
		int resultCount = salListForCnt.size();
		
		PaginationVO pagiVO = new PaginationVO();
		pagiVO.setListCnt(resultCount);
		pagiVO.setPage(page);
		pagiVO.setRange(range);
		

		pagiVO = pagiService.pageInfo(pagiVO);
		
		
		List<SalutariumVO> salList =  salService.selectByPagiAddr(pagiVO.getStartList(), pagiVO.getListSize(),todohuken, sikuchouson);
		
		if(salList.size() > 0) {
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
		}
		
		
		String[] addressArr = {todohuken,sikuchouson};
		
		model.addAttribute("RESULTCOUNT", resultCount);
		model.addAttribute("SALLIST", salList);
		model.addAttribute("PAGIVO", pagiVO);

		model.addAttribute("ADDRESSARR",addressArr);

		
		return "search_main";
	}
	
	
	
	
	@RequestMapping(value="/modianddelsal", method=RequestMethod.GET)
	public String modiAndDelSal(Principal principal, Model model) {
		
		String username = principal.getName();
		
		List<SalutariumVO> salList = salService.findByUsername(username);
		
		model.addAttribute("SALLIST", salList);
		
		return "modidel_sal";
	}
	
	
	
	@RequestMapping(value="/updatesal", method=RequestMethod.GET)
	public String updateSal(@RequestParam("sequence") String sequence, Principal principal, Model model) {
		
		
		
		
		SalutariumVO salVO = salService.findBySeq(Long.valueOf(sequence));
		
		
		if(!principal.getName().equals(salVO.getUsername())) {

			return "redirect:/";
		}
		
		
		salVO = salService.refinSalVO(salVO);
		
		List<FileVO> fileList = fileService.findBySeq(salVO.getSequence());
		
		
		model.addAttribute("SALVO", salVO);
		model.addAttribute("FILELIST", fileList);
		
		return "update_sal";
	}
	
	
	
	
	@RequestMapping(value="/updatesal", method=RequestMethod.POST)
	public String updateSal(SalutariumVO salVO, MultipartFile mainFile, String[] delFileList, MultipartHttpServletRequest file, Principal principal) {
		
		
		log.debug("SALVO: "+ salVO.toString());
		log.debug("MAINFILE: "+mainFile.getOriginalFilename());
		
		
		SalutariumVO checkSalVO = salService.findBySeq(Long.valueOf(salVO.getSequence()));
		
		if(!principal.getName().equals(checkSalVO.getUsername())) {
	
			return "redirect:/";
		}
		
		
		
		long sequence = salService.updateSal(salVO, principal);
		
		//メインイメージアップロード
		FileVO fileVO =  fileService.mainFileUp(mainFile, sequence);
		if(fileVO != null) {
		fileService.insertMainFile(fileVO);
		}
		
		//既存イメージ削除
		if(delFileList != null) {
			fileService.deleteFile(delFileList);
		}
		
		
		
		List<FileVO> fileList = fileService.filesUp(file,sequence);
		if(fileList != null) {
		log.debug("FILELIST: " + fileList.toString());
		fileService.insert(fileList);
		}
		
		
		
		
		
		
		
		return "redirect:/";
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deletesal", method=RequestMethod.POST, produces = "application/text;charset=utf8")
	public String deleteSal(String sequence, Principal principal) {
		
		SalutariumVO salVO = salService.findBySeq(Long.valueOf(sequence));
		
		if(!principal.getName().equals(salVO.getUsername())) {
			return "redirect:/";
		}
		
		String resultMSG = salService.deleteSal(Long.valueOf(sequence));
		
		return resultMSG;
	}
	
	
	
	
	@RequestMapping(value="/adminpage", method=RequestMethod.GET)
	public String adminPage(Authentication authentication, Model model) {
		
		// authorityは複数
		List<? extends GrantedAuthority> authorityList = (List<? extends GrantedAuthority>) authentication.getAuthorities();	
		GrantedAuthority authority = authorityList.get(0);
		
		if(!authority.getAuthority().equals("ROLE_admin")) {
			return "redirect:/";
		}
		
		
		List<UserDetailsVO> userList = userService.getAllUserList();

		for(int i=0; i < userList.size(); i++) {
			UserDetailsVO vo = userList.get(i);
			if(vo.getAuthority().equals("ROLE_admin")) {
				userList.remove(i);
				break;
			}
		}
		
		model.addAttribute("USERLIST", userList);
		
		return "admin_page";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/userenabled", method=RequestMethod.POST, produces = "application/text;charset=utf8")
	public String userEnabled(String username, String enabled) {

		String resultMSG = userService.enabledUser(username,enabled);
		
		log.debug("RESULTMSG: " + resultMSG);
		
		return resultMSG;
	}


}
