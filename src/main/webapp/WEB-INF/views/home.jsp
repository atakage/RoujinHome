<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>
<style>

.carousel-inner{
	width:50%;
	margin:0 auto;
}

.popFacilityDiv{
	text-align: center;
	margin-top:5%;
	margin-bottom:5%;
}

.carousel-item{
	text-align: center;
}


.item{
	border: 5px solid yellowgreen;
    border-radius: 5px;

}

.item:hover{
	cursor: pointer;
}

.img-thumbnail{
	border:none;
	width:1000px;
	height:600px;
}


.carousel-indicators{

	position:relative;

}


.carousel-indicators li{
	
	background-color: yellowgreen;
	height:20px;
}

.circle{
	cursor: pointer;
	padding:5px;
	font-size:xx-large;
}

.prevIcon{
	color:rgba(128,128,128,0.5);
	font-size:xx-large;
	font-weight:bold;
}
.nextIcon{
	color:rgba(128,128,128,0.5);
	font-size:xx-large;
	font-weight:bold;
}

.carousel-control-prev:hover .prevIcon{
	color:yellowgreen;
}
.carousel-control-prev:hover .item{
	border-color:yellowgreen;
}
.carousel-control-next:hover .nextIcon{
	color:yellowgreen;
}
.carousel-control-next:hover .item{
	border-color:yellowgreen;
}

.infoBoxDiv{
	background-color: yellowgreen;
	color: white;
    font-weight: bold;
    font-size: x-large;
}


.salName{
white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.salAddr{
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.salFee{
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

</style>


<script>


$(function(){




	$(document).on('click','.item',function(){



		document.location.href="${rootPath}/view?sequence="+$(this).find('.sequence').val()


		
		})
		

	
	
})

</script>


<body>




<div class="container-fluid popFacilityDiv">
<a style="font-size: xx-large;font-weight: bold;">人気の施設</a>
</div>


<div id="carouselDiv" class="carousel slide" data-ride="carousel">

	
	
	<div class="carousel-inner">
	
	<c:if test="${empty SALLIST}">
	
		<div class="carousel-item active">
			<div class="item">
				
				<img src="${rootPath}/resources/img/header_image.png" class="img-thumbnail"   alt="test">
				<div>
					ddd<br>
					ddd<br>
					ddd<br>
				</div>
			</div>	
		</div>
		<div class="carousel-item">
			<div class="item">
				
				<img src="${rootPath}/resources/img/header_image.png" class="img-thumbnail"   alt="test">
				<div>
					bbb<br>
					ddd<br>
					ddd<br>
				</div>
			</div>	
		</div>
		<div class="carousel-item">
			<div class="item">
				
				<img src="${rootPath}/resources/img/header_image.png" class="img-thumbnail"   alt="test">
				<div>
					ccc<br>
					ddd<br>
					ddd<br>
				</div>
			</div>	
		</div>
		
	</c:if>
	
	
	
	
	<c:if test="${not empty SALLIST }">
	
		<c:forEach items="${SALLIST}" var="SALLIST" varStatus="status">
		
		
		
		<div class="carousel-item<c:out value="${status.index == 0 ? ' active':''}"/>">
			<div class="item">
				<input class="sequence" type="hidden" value="${SALLIST.sequence}">
				<img src="${rootPath}/files/${SALLIST.file_upload_name}" class="img-thumbnail"   alt="test">
				<div class="infoBoxDiv">
					<div class="salName">${SALLIST.name}</div>
					<div class="salAddr">${SALLIST.address}</div>
					<div class="salFee">${SALLIST.fee}円</div>
				</div>
			</div>	
		</div>
		
		</c:forEach>
	
	
	</c:if>
		
	</div>
	
	

	
	<a class="carousel-control-prev" href="#carouselDiv" data-slide="prev">
		<span class="prevIcon">&lt;</span>
	</a>
	<a class="carousel-control-next" href="#carouselDiv" data-slide="next">
		<span class="nextIcon">&gt;</span>
	</a>
	
	
	<ul class="carousel-indicators">
    <li data-target="#carouselDiv" data-slide-to="0" class="active"></li>
    <li data-target="#carouselDiv" data-slide-to="1"></li>
    <li data-target="#carouselDiv" data-slide-to="2"></li>
  </ul>

</div>



</body>
</html>