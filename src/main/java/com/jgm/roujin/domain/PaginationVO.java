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
public class PaginationVO {
	
	// １ページにコンテンツ数
	private int listSize = 6;
	
	// 1ブロックにページ数
	private int rangeSize = 3;
	
	private int page;
	private int range;
	
	// コンテンツ数
	private int listCnt;
	
	private int pageCnt;
	private int startPage;
	
	// コンテンツindex
	private int startList;
	
	private int endPage;
	private boolean prev;
	private boolean next;
}
