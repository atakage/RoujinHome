package com.jgm.roujin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class SalutariumVO {

	private long sequence;
	private String username;
	private String name;
	private String address;
	private String[] addressArr;
	private long fee;
	private String feature;
	private String[] featureArr;
	private String description;
	private long view;
	
	
	private String file_upload_name;
}
