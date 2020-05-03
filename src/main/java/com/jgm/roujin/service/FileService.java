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
import com.jgm.roujin.persistence.FileDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileService {

	@Autowired
	String winFilePath;
	
	
	private final FileDao fileDao;

	public List<FileVO> filesUp(MultipartHttpServletRequest file, long sequence) {
		// TODO Auto-generated method stub
		
		if(file.getFile("file").getSize() < 1) return null;
		List<FileVO> fileList = new ArrayList<FileVO>();
		
		String file_code = fileDao.findMaxCode();
		
		
		if(file_code == null) {
			
			file_code = "F0000";
		}
		
		
		
		
		
		try {
			
			for(MultipartFile mFile : file.getFiles("file")) {
				
				// originalName + UUID
				String upFileName = this.fileUp(mFile);
				
				// create file_code
				
					
					String file_code_subStr = file_code.substring(1);
					
					int file_code_plus = Integer.valueOf(file_code_subStr)+1;
					
					file_code = String.format("F%04d", file_code_plus);
				
				
				
				
				FileVO vo = FileVO.builder().file_origin_name(mFile.getOriginalFilename()).
						file_upload_name(upFileName).sequence(sequence).file_code(file_code).build();
				
				
				
				fileList.add(vo);
				log.debug("fileList: " + fileList.toString());
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.debug("FILES UP EXCEPTION");
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


	public void insert(List<FileVO> fileList) {
		// TODO Auto-generated method stub
		
		
		fileDao.insert(fileList);
		
	}


	public List<FileVO> findBySeq(Long sequence) {
		// TODO Auto-generated method stub
		
		
		return fileDao.findBySeq(sequence);
	}


	

	
	
}
