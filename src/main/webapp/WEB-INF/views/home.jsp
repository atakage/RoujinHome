<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.img-thumbnail{
	border:none;
}


.carousel-indicators{

	position:relative;

}


.carousel-indicators li{
	
	background-color: yellowgreen;
	height:10px;
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


</style>




<body>




<div class="container-fluid popFacilityDiv">
<a style="font-size: xx-large;font-weight: bold;">人気の施設</a>
</div>


<div id="carouselDiv" class="carousel slide" data-ride="carousel">

	
	<div class="carousel-inner">
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