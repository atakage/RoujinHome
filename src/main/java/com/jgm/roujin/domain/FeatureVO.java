package com.jgm.roujin.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FeatureVO {

	private String shift; //夜間有人
	private String callCare; //訪問看護
	private String singleRoom; //個室あり
	private String nurseCall; //ナースコール
	private String bathing; // 入浴週3回
	private String noSmoking; //館内禁煙
	private String transportation; //交通便利
	private String goOut; //外出自由
	private String drinking; //アルコール可
}
