<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    

    
    
    
    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>



<style>

.selectBoxDiv{

	display: flex;
    background-color: yellowgreen;
    font-size: large;
    margin-bottom:10%;
}

.subtitle{
	text-align: center;
    margin-top: 10%;
    font-size: xx-large;
    font-weight: bold;

}

.listBoxDiv{
	display: flex;
    flex-wrap: wrap;
    text-align: center;
    
}

.listBox{
	width:30%;
	border: 5px solid rgba(154,205,50,0.5);
	border-radius:10px;
	margin: 10 auto;
}

.listBox:hover{
	border-color: yellowgreen;
	cursor: pointer;
}

.imgAndInfoBoxDiv{
	display:flex;
}

.listImg{
	max-width: 100%;
	max-height: 100%;
	border-radius: 10px;
}

.listBox{
	overflow: hidden;
    text-overflow: ellipsis;
}

.listName{
	font-size:larger;
	font-weight:bold;
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    margin:20;
}

.listView{
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    text-align: right;
}

.imgDiv{
	width: 50%;
}

.infoBox{
	width: 50%;
}

.listAddr{
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    margin: 50 auto;
}

.listFee{
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
	margin: 50 auto;
	color:deeppink;
}

</style>



<script>

$(function(){



	$('#todohuken').change(function(){

		var todohuken = $('#todohuken option:selected').val()
		

		if(todohuken == 'hokkaido'){

				$('#sikuchouson option').remove()
				$('#sikuchouson').append("<option value='sapporo'>札幌市</option>")
				$('#sikuchouson').append("<option value='nemuro'>根室市</option>")

		}else if(todohuken == 'tokyo'){


			$('#sikuchouson option').remove()
			$('#sikuchouson').append("<option value='kodaira'>小平市</option>")
			$('#sikuchouson').append("<option value='machida'>町田市</option>")

		}
		
		})




		$(document).on('click','.listBox',function(){


			document.location.href="${rootPath}/view?sequence="+$(this).find('.sequence').val()
			
			})

})



</script>

<body>



<div class="subtitle">
施設を探す
</div>




<div class="container-fluid selectBoxDiv">
<form action="${rootPath}/searchcenter" method="post" style="display: contents">
	<div>
		<select id="todohuken" name="todohuken">
			<option value="hokkaido">北海道</option>
			<option value="tokyo">東京都</option>
		</select>
		
	</div>
	<div>
		<select id="sikuchouson" name="sikuchouson">
			<option value='sapporo'>札幌市</option>
			<option value='nemuro'>根室市</option>
		</select>
	</div>
	<div>
		<button class="searchButton">探す</button>
	</div>
</form>	
	<div style="float:right;">
		検索結果:<span style="color: red; font-weight: bold">${RESULTCOUNT}</span>件
	</div>

</div>


<div class="listBoxDiv">

	<c:choose>
	
	
		<c:when test="${not empty SALLIST }">
		
		
		<c:forEach items="${SALLIST}" var="SALLIST" varStatus="status">
			
			<div class="listBox">
					<input class="sequence" type="hidden" value="${SALLIST.sequence }">
					<div class="listName">${SALLIST.name}</div>
					<div class="listView">${SALLIST.view}view</div>
			<div class="imgAndInfoBoxDiv">

				<c:if test="${empty SALLIST.file_upload_name}">
				<div class="imgDiv"><img class="listImg" src="${rootPath}/resources/img/no-image.png" width="300" height="200"></div>
				</c:if>
				<c:if test="${not empty SALLIST.file_upload_name}">
				<div class="imgDiv"><img class="listImg" src="${rootPath}/files/${SALLIST.file_upload_name}" width="300" height="200"></div>
				</c:if>
			
				<div class="infoBox">
				<div class="listAddr">${SALLIST.address}</div>
				<div class="listFee">${SALLIST.fee}円</div>
				</div>
				
			</div>
				</div>
		</c:forEach>
		
		
		</c:when>
		<c:otherwise>
		
			<div style="font-size: x-large;">情報がありません</div>
		
		</c:otherwise>
	
	
	</c:choose>

</div>


</body>