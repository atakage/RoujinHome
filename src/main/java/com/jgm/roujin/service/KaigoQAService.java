package com.jgm.roujin.service;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.jgm.roujin.domain.CrawlVO;
import com.jgm.roujin.domain.QaVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KaigoQAService {

	
	
	private String questionTitle = "div.qa-question-detail h1";
	private String questionValue = "div.qa-question-detail p";
	private String answerTitle = "div.qa-answer-detail h2";
	private String answerValue = "div.qa-answer-detail p";
	
	
	
	public CrawlVO startCrawl() {
		
		int randomNum;
		String url;
		Document crawlDoc;
		Elements questionTitleEL;
		Elements questionValueEL;
		Elements answerTitleEL;
		Elements answerValueEL;
		CrawlVO crawlVO = new CrawlVO();
		
		
		while(true) {
		
		
		randomNum = (int)(Math.random()*54)+1;
		
		url = "https://www.minnanokaigo.com/qa/"+"no"+randomNum+"/";
		
		log.debug("CRAWLURL: " + url);
		
		crawlDoc = null;
		
		 try {
			crawlDoc = Jsoup.connect(url).get();
			questionTitleEL = crawlDoc.select(questionTitle);
			

			
			questionValueEL = crawlDoc.select(questionValue);
			answerTitleEL = crawlDoc.select(answerTitle);
			answerValueEL = crawlDoc.select(answerValue);
			
			log.debug("QUESTIONTITLEEL: " + questionTitleEL);
			log.debug("QUESTIONVALUEEL: " + questionValueEL);
			log.debug("ANSWERTITLEEL: " + answerTitleEL);
			log.debug("ANSWERVALUEEL: " + answerValueEL);

			
			crawlVO.setAnswerTitle(answerTitleEL.text());
			crawlVO.setAnswerValue(answerValueEL.text());
			crawlVO.setQuestionTitle(questionTitleEL.text());
			crawlVO.setQuestionValue(questionValueEL.text());
			crawlVO.setLink(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			continue;
			
		}

		 log.debug("CRAWLVO: " + crawlVO.toString());
		 return crawlVO;
		 
		}//while
		
	}



	
}
