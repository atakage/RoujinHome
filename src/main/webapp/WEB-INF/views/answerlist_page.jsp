<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">

    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>


<style>

.answerListAllBoxDiv{

	width: 70%;
    margin: 0 auto;
    margin-top: 10%;
}

.title{
	background-color: limegreen;
	color: white;
	font-size: x-large;
	font-weight: bold;
	border-radius: 5px;
	padding:10px;
}

.borderDiv{
	border:2px solid limegreen;
	border-radius: 5px;
	width:98%;
	margin:0 auto;
	padding: 10px;
	
}

.btnDiv{
	text-align: right;
}

.noASNameAndUNameDiv{
	display: flex;
	justify-content: space-between;
}

.noASContent{
	text-align: center;
    padding: 50px;
    font-size: large;
}

.qBox{
	padding: 10px;
	margin-top:5%;
}

.qBox:after{
	content: "";
    display: block;
    width: 70%;
    border-bottom: 2px solid limegreen;
    margin:0 auto;
    margin-top:3%;
}

.btnDiv{
	display: flex;
    justify-content: space-between;
}
	

</style>



<script>
$(function(){


	$('.answerBtn').click(function(){


		if(confirm('回答しますか？')){


			
			
			var content = $(this).siblings('.noASAnswer').val()
			var id = $(this).siblings('.noASId').val()

			$.ajax({

				url:'${rootPath}/v2/answerinput', data:{id:id, content:content, '${_csrf.parameterName}':'${_csrf.token}'}, type:'post',
				success:function(result){

						if(result == 'OK'){
								alert('登録完了')
								document.location.replace('${rootPath}/v2/answerlist')
							}else{
								alert('登録に失敗しました')
								}
					}, error:function(){
							alert('サーバーエラー')
						}

				
				})

			}
		

		
		
	})
	
})


</script>


<div>



<div class="answerListAllBoxDiv">

	<div class="answerWaitBox">
		<div class="title">回答を待っている質問</div>
		<div class="borderDiv">
		
		<c:if test="${empty NOANSWERLIST }">
			回答を待っている質問がありません
		</c:if>
		<c:if test="${not empty NOANSWERLIST }">
			<c:forEach items="${ NOANSWERLIST}" var="NOANSWERLIST">
				<div class="qBox">
					
					<div class="noASNameAndUNameDiv">
					<div class="noASName">施設名:<b>${NOANSWERLIST.name}</b></div>
					<div class="noASUserName">質問者:<b>${NOANSWERLIST.username}</b></div>
					</div>
					<div class="noASContent"><b>${NOANSWERLIST.content}</b></div>
					<div class="answerEntranceDiv"></div>
					<div class="btnDiv">
					<input class="noASId" type="hidden" value="${NOANSWERLIST.id}">
					<textarea class="noASAnswer" rows="2" cols="50" placeholder="2000文字以内"></textarea>
					<button class="btn btn-danger answerBtn" type="button">回答する</button>
					</div>
				</div>
			</c:forEach>
		</c:if>
		</div>
	</div>


</div>




</div>