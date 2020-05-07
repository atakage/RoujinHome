<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    

    
    
    
    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>


<style>

.headerTitle{

	margin-top:10%;
	margin-bottom:10%;
	text-align: center;
	font-weight: bold;
	font-size: xx-large;
}

.listBox{
	border: 3px solid rgba(154,205,50,0.5);
	border-radius: 10px;
	width:50%;
	margin:0 auto;
	margin-bottom: 5%;
}

.listBox:hover{
	border-color: yellowgreen;
	cursor: pointer;
}

.nameBox{
	padding:20px;
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.addrBox{
	padding:20px;
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.sub{
	font-size: x-large;
	font-weight: bold;
}

.salContent{
	font-size: larger;
}

</style>


<script>

$(function(){


	$(document).on('click','.listBox',function(){


		document.location.href="${rootPath}/updatesal?sequence="+$(this).find('.sequence').val()
		
		})
})

</script>

<div class="container-fluid">


<div class="headerTitle">登録した施設</div>


<c:if test="${empty SALLIST }">
	<div style="text-align: center;">登録した施設がありません</div>
</c:if>


<c:if test="${not empty SALLIST }">

	<c:forEach items="${SALLIST}" var="SALLIST">
		<div class="listBox">
			<input class="sequence" type="hidden" value="${SALLIST.sequence}">
		
			<div class="nameBox">
				<a class="sub">施設名:</a><a class="salContent">${SALLIST.name }</a>
			</div>
			<div class="addrBox">
				<a class="sub">住所:</a><a class="salContent">${SALLIST.address}</a>
			</div>
		
		</div>
	</c:forEach>
	
</c:if>
</div>
