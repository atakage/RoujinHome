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
    margin-bottom: 5%;
    
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
	background-color:yellowgreen;
	border-radius:5px;
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

.pagiBoxDiv{
	display: flex;
}

.pagination{
	margin: 0 auto;
}

.page-item{
	border: 2px solid yellowgreen;
	
}

.page-link{
	color:yellowgreen;
	font-weight: bold;
}

.page-link:hover{
	color:darkgreen;
}

.page-item.active .page-link{
	background-color: forestgreen;
    border-color: forestgreen;
}

</style>



<script>

$(function(){



	if(${ADDRESSARR[0] == '東京都' }){

		// jqueryでは　　spring form tagが　append不可能
		
	
		$('#todohuken').append("<option value='北海道'>北海道</option>")
		
		if(${ADDRESSARR[1] == '小平市'}){
			$('#sikuchouson').append("<option value='町田市'>町田市</option>")
			}else if(${ADDRESSARR[1] == '町田市'}){
				$('#sikuchouson').append("<option value='小平市'>小平市</option>")	
				}
		}


	if(${ADDRESSARR[0] == '北海道' }){

		// jqueryでは　　spring form tagが　append不可能
		
		$('#todohuken').append("<option value='東京都'>東京都</option>")
		
		if(${ADDRESSARR[1] == '札幌市'}){
			$('#sikuchouson').append("<option value='根室市'>根室市</option>")
			}else if(${ADDRESSARR[1] == '根室市'}){
				$('#sikuchouson').append("<option value='札幌市'>札幌市</option>")
				}
		}


	



	if($('#resultcount').text().length > 0){

		$('.listAddr').css('font-weight','bold')
		}
	



	$('#todohuken').change(function(){

		var todohuken = $('#todohuken option:selected').val()
		

		if(todohuken == '北海道'){

				$('#sikuchouson option').remove()
				$('#sikuchouson').append("<option value='札幌市'>札幌市</option>")
				$('#sikuchouson').append("<option value='根室市'>根室市</option>")

		}else if(todohuken == '東京都'){


			$('#sikuchouson option').remove()
			$('#sikuchouson').append("<option value='小平市'>小平市</option>")
			$('#sikuchouson').append("<option value='町田市'>町田市</option>")

		}
		
		})




		$(document).on('click','.listBox',function(){


			document.location.href="${rootPath}/view?sequence="+$(this).find('.sequence').val()
			
			})



		$(document).on('click','.searchButton',function(){

			var todohuken = $('#todohuken option:selected').val()
			var sikuchouson = $('#sikuchouson option:selected').val()


			document.location.href="${rootPath}/searchcenteraddr?todohuken="+todohuken+"&sikuchouson="+sikuchouson
			})

})



</script>

<body>



<div class="subtitle">
施設を探す
</div>




<div class="container-fluid selectBoxDiv">
<form action="${rootPath}/searchcenter" method="post" style="display: contents">
	
	<c:if test="${empty ADDRESSARR }">
	
	<div>
		<select id="todohuken" name="todohuken">
			<option value="北海道">北海道</option>
			<option value="東京都">東京都</option>
		</select>
		
	</div>
	<div>
		<select id="sikuchouson" name="sikuchouson">
			<option value='札幌市'>札幌市</option>
			<option value='根室市'>根室市</option>
		</select>
	</div>
	
	</c:if>
	
	<c:if test="${not empty ADDRESSARR }">
		<div>
		<select id="todohuken">
			<option value="${ADDRESSARR[0]}">${ADDRESSARR[0]}</option>
		</select>
		</div>
		
		<div>
		<select id="sikuchouson">
			<option value="${ADDRESSARR[1]}">${ADDRESSARR[1]}</option>
		</select>
		</div>			
					
	
	</c:if>
	
	<div>
		<button type="button" class="searchButton">探す</button>
	</div>
</form>	
	<div style="float:right;">
		検索結果:<span id="resultcount" style="color: red; font-weight: bold">${RESULTCOUNT}</span>件
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



<div class="pagiBoxDiv">



<ul class="pagination">

	<c:if test="${empty RESULTCOUNT}">
	
	<c:if test="${PAGIVO.prev == false}">
    <li class="page-item"><a class="page-link" href="#">Prev</a></li>
    </c:if>
    <c:if test="${PAGIVO.prev == true}">
    <li class="page-item"><a class="page-link" href="${rootPath}/searchcenter?page=${((PAGIVO.range-2)*PAGIVO.rangeSize)+1}&range=${PAGIVO.range-1}">Prev</a></li>
    </c:if>
    
    
    <c:forEach  var="idx" begin="${PAGIVO.startPage}" end="${PAGIVO.endPage}" >
    
    <li class="page-item<c:out value="${PAGIVO.page == idx ? ' active':''}"/>"><a class="page-link" href="${rootPath}/searchcenter?page=${idx}&range=${PAGIVO.range}">${idx}</a></li>
    
    
    </c:forEach>

    
    
    
    
    <c:if test="${PAGIVO.next == false}">
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </c:if>
    <c:if test="${PAGIVO.next == true}">
    <li class="page-item"><a class="page-link" href="${rootPath}/searchcenter?page=${(PAGIVO.range * PAGIVO.rangeSize)+1}&range=${PAGIVO.range+1}">Next</a></li>
    </c:if>
    
    
  
    
    </c:if>
    
    
    
    
    
    
    
    
    
    
    
    <c:if test="${ not empty RESULTCOUNT}">

    
    <c:if test="${PAGIVO.prev == false}">
    <li class="page-item"><a class="page-link" href="#">Prev</a></li>
    </c:if>
    <c:if test="${PAGIVO.prev == true}">
    <li class="page-item"><a class="page-link" href="${rootPath}/searchcenteraddr?page=${((PAGIVO.range-2)*PAGIVO.rangeSize)+1}&range=${PAGIVO.range-1}&todohuken=${TODOHUKEN}&sikuchouson=${SIKUCHOUSON}">Prev</a></li>
    </c:if>
    
    
    <c:forEach  var="idx" begin="${PAGIVO.startPage}" end="${PAGIVO.endPage}" >
    
    <li class="page-item<c:out value="${PAGIVO.page == idx ? ' active':''}"/>"><a class="page-link" href="${rootPath}/searchcenteraddr?page=${idx}&range=${PAGIVO.range}&todohuken=${TODOHUKEN}&sikuchouson=${SIKUCHOUSON}">${idx}</a></li>
    
    
    </c:forEach>

    
    
    
    
    <c:if test="${PAGIVO.next == false}">
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </c:if>
    <c:if test="${PAGIVO.next == true}">
    <li class="page-item"><a class="page-link" href="${rootPath}/searchcenteraddr?page=${(PAGIVO.range * PAGIVO.rangeSize)+1}&range=${PAGIVO.range+1}&todohuken=${TODOHUKEN}&sikuchouson=${SIKUCHOUSON}">Next</a></li>
    </c:if>
    

    
    </c:if>
    
 </ul>
 
     

</div>


</body>