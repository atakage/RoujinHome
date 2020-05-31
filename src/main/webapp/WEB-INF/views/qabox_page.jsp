<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
 
<style>

.noQAMSG{
	font-size: large;
    width: 100%;
    margin: 0 auto;
    text-align: center;
    padding: 20px;
}

.questionBox{
	display: flex;
	border: 1px solid black;
	padding:20px;
}

.userProfile{
	border: 2px solid black;
    border-radius: 10px;
}

.picture{
	border: none;
    max-width: 100px;
}

.username{
	text-align: center;
    font-weight: bold;
    font-size: large;
    background-color: white;
}

.questionVal{


	position: relative;
    max-width: 100%;
    background: white;
    border-radius: 10px;
	margin-left:3%;
	padding:10px;
}

.questionVal:after{


	border-top: 15px solid white;
    border-left: 15px solid transparent;
    border-right: 0px solid transparent;
    border-bottom: 0px solid transparent;
    content: "";
    position: absolute;
    top: 10;
    left: -15;

}

.deleteBtn{
	font-size: large;
	font-weight: bold;
	align-self: flex-end
}

.deleteBtn:hover{
	cursor: pointer;
}


</style>
 
<div class="qaBox">

<c:if test="${empty QALIST}">
<div class="noQAMSG">質問がありません</div>
</c:if>

<c:if test="${not empty QALIST}">

	<c:forEach items="${QALIST}" var="QALIST">
	
	
	
	<div class="qaContentBox">
	
		<div class="questionBox">
			<div class="userProfile">
			<img class="img-thumbnail picture" src="${QALIST.picture}"/>
			<div class="username">${QALIST.username}</div>
			</div>
			<div class="questionVal">${QALIST.content}</div>
			<div class="deleteBtn">&times;</div>
		</div>
		<div class="answerBox">
			<div class="answerContent"></div><div class="concernProfile"></div>
		</div>
	</div>
	
	</c:forEach>
</c:if>

</div>