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
public class CrawlVO {
	
	
 
  private String questionTitle;//qa-question-detail
  private String answerTitle;
  private String answerValue;
  private String questionValue;
  private String link;
}
