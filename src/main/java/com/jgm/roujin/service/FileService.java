package com.jgm.roujin.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jgm.roujin.domain.FileVO;
import com.jgm.roujin.domain.SalutariumVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FileService {

	@Autowired
	String winFilePath;

	public List<FileVO> filesUp(MultipartHttpServletRequest file, long sequence) {
		// TODO Auto-generated method stub
		
		if(file.getFile("file").getSize() < 1) return null;
		List<FileVO> fileList = new ArrayList<FileVO>();
		
		
		//  findby file_code(max) 
		
		
		try {
			
			for(MultipartFile mFile : file.getFiles("file")) {
				
				// originalName + UUID
				String upFileName = this.fileUp(mFile);
				
				// create file_code
				
				
				
				
				FileVO vo = FileVO.builder().file_origin_name(mFile.getOriginalFilename()).
						file_upload_name(upFileName).sequence(sequence).build();
				
				log.debug("FILEVO: " + vo.toString());
				
				fileList.add(vo);
				
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		return fileList;
		
	}

	
	private String fileUp(MultipartFile mFile) {
		// TODO Auto-generated method stub
		
		
		String originName = mFile.getOriginalFilename();
		
		
		if(mFile != null) {
			
			
			File dir = new File(winFilePath);
			
			
			
			if(!dir.exists()) {
				
				dir.mkdirs();
				log.debug("Folder Create!");
				
			}
			
			
			
			String strUUID = UUID.randomUUID().toString();
			strUUID += originName;
			
			
			log.debug("MFILE: " + mFile.toString());
			log.debug("ORIGINNAME: " + originName);
			log.debug("ORIGINUUID: "+ strUUID);
			
			File upLoadFile = new File(winFilePath,strUUID);
			
			try {
				
				
				mFile.transferTo(upLoadFile);
				
				return strUUID;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		
		
		
		return null;
	}
	

	
	
}
