package com.jgm.roujin.domain;

import java.util.List;

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
	private long fee;
	private String[] feature;
	private FeatureVO featureList;
	private String description;
	private String file_origin_name;
	private String file_upload_name;
	private long view;
}
