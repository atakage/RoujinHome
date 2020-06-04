<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <c:set var="rootPath" value="${pageContext.request.contextPath}"/>
 
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
	border-bottom:none;
	padding:20px;
}

.answerBox{
	display: flex;
	border: 1px solid black;
	border-top:none;
	padding:20px;
	flex-direction: row-reverse;
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

.answerVal{
	position: relative;
    max-width: 100%;
    background: white;
    border-radius: 10px;
	margin-right:3%;
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

.answerVal:after{
	border-top: 15px solid white;
    border-left: 0px solid transparent;
    border-right: 15px solid transparent;
    border-bottom: 0px solid transparent;
    content: "";
    position: absolute;
    top: 10;
    right: -15;
}

.deleteBtn{
	font-size: large;
	font-weight: bold;
	align-self: flex-end
}

.deleteBtn:hover{
	cursor: pointer;
}

.displayQA{
	background-color: yellowgreen;
    font-size: larger;
    text-align: center;
    padding: 5px;
}

.displayQA:hover{
	cursor: pointer;
}


</style>


<script>
$(function(){



	$('.deleteBtn').click(function(){

		if(confirm('削除しますか？')){
		var id = $(this).siblings('.qa_id').val()

		$.ajax({

			url:'${rootPath}/v2/deleteqa', data:{id:id,'${_csrf.parameterName}':'${_csrf.token}'}, type:'post',
			success:function(result){
					if(result == 'OK'){
							alert('削除成功')
							document.location.reload()
						}else if(result == 'NOTMATCH'){
							alert('作成者だけ削除できます')
							return false
						}
					alert('削除失敗')
					return false
				},error:function(){
						alert('サーバーエラー')
					}
			
			})
			}
		})
	







	

	// 6件以上のQAがある時作動
	var boxIndex = 5
	var finalIndex
	$('.displayQA').click(function(){

			alert('BOXINDEX: ' + boxIndex)

			
			for(var i=boxIndex;i<boxIndex+5;i++){

				// tagの有無検証
				if( $('.boxIndex'+i).length > 0){
				
				$('.boxIndex'+i).css('display','block')	
				finalIndex = i

				}else{
					$('.displayQA').css('display','none')
					}
				
				}
		
			boxIndex = finalIndex
		})
	
})

</script>

 
<div class="qaBox">

<c:if test="${empty QALIST}">
<div class="noQAMSG">質問がありません</div>
</c:if>

<c:if test="${not empty QALIST}">

	<c:forEach items="${QALIST}" var="QALIST" varStatus="status">
	
	
	
	<div class="qaContentBox boxIndex${status.index}" style="<c:if test="${status.index > 4}">display:none</c:if>">
	<input class="boxIndex" type="hidden" value="${status.index}">	
		<div class="questionBox">
			<div class="userProfile">
			<img class="img-thumbnail picture" src="${QALIST.picture}"/>
			<div class="username">${QALIST.username}</div>
			</div>
			<div class="questionVal">${QALIST.content}</div>
			<div class="deleteBtn">&times;</div>
			<input class="qa_id" type="hidden" value="${QALIST.id}">
		</div>

	</div>
	
	
	
	
	</c:forEach>
	
	<c:if test="${fn:length(QALIST) > 5 }">
	<div class="displayQA">
	<b>QAさらに表示▼</b>
	</div>
	</c:if>
	
</c:if>

</div>