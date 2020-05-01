package com.jgm.roujin.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class FileVO {

	private long sequence;
	private String file_code;
	private String file_origin_name;
	private String file_upload_name;
}
