<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    

    
    
    
    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>





<style>

.qaTitle{
	font-size: xx-large;
	margin: 0 auto;
    text-align: center;
    background-color: yellowgreen;
    font-weight: bold;
    color: white;
    margin-top: 5%;
}

.questionTitleBox{
	border-bottom: 2px solid yellowgreen;
	margin-top:10%;
	color:yellowgreen;
	font-weight: bold;
	font-size: x-large;
}

.answerTitleBox{
	border-bottom: 2px solid yellowgreen;
	margin-top:10%;
	color:yellowgreen;
	font-weight: bold;
	font-size: x-large;
}

.questionValue{
	font-size: large;
	font-weight:bold;
	padding:10px;
}

.answerValue{
	font-size: large;
	font-weight:bold;
	padding:10px;
}

.linkBox{
	margin-top:10%;
	text-align: right;
}

.link{
	color:hotpink;
	font-weight: bold;
}

</style>

<div class="qaTitle">介護に関するいろんなQ&A</div>


<div>
<c:if test="${CRAWLVO.questionTitle eq ''}">
	<div>データーが見つかりません</div>
</c:if>

<c:if test="${CRAWLVO.questionTitle ne ''}">
	<div class="questionTitleBox">
		<span class="q">Q.</span>
		<span class="questionTitle">${CRAWLVO.questionTitle}</span>
	</div>
	<div class="questionValue">${CRAWLVO.questionValue}</div>
	
	<div class="answerTitleBox">
		<span class="a">A.</span>
		<span class="answerTitle">${CRAWLVO.answerTitle}</span>
	</div>
	
	<div class="answerValue">${CRAWLVO.answerValue}</div>
	<div class="linkBox">
		<span style="font-weight: bold;">link:</span>
		<span class="link"><a href="${CRAWLVO.link}">${CRAWLVO.link}</a></span>
	</div>
</c:if>


</div>