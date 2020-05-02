<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    

    
       
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>



<style>

.topBoxDiv{

	margin-top:5%;
	margin-bottom:5%;
	border-top:2px solid yellowgreen;
	border-bottom: 2px solid yellowgreen;

}

.nameAndviewBoxDiv{
	display:flex;
	margin-top:3%;
	margin-bottom:3%;

}

#name{
	width:80%;
	font-size: x-large;
	font-weight: bold;
}

#view{
	font-size: x-large;
}

.imgAndFeeAddrBoxDiv{
	display:flex;
	margin-bottom:1%;
}

#img{
	width:50%;

}

.feeAndAddrBoxDiv{
	width:50%;
	word-break: break-all;
    padding: 10px;
}

.subImgBoxDiv{
	width:50%;
	border:1px solid black;
	margin-bottom:3%;
	
}

.bottomBoxDiv{
	border:2px solid yellowgreen;
	border-radius: 5px;
}

.featureBoxDiv{
	
	width:90%;
	margin: 0 auto;
	margin-top:2%;
	margin-bottom:2%;
}

.titleDiv{
	margin: 0 auto;
    font-size: x-large;
    font-weight: bold;
    background-color: limegreen;
    color: white;
    padding: 5px;
    border-radius: 10px;
    margin-bottom:2%;
}


</style>



<div class="topBoxDiv">

	<div class="nameAndviewBoxDiv">
		<div id="name">NAMEmargin-top:3%;margin-top:3%;</div>
		<div id="view">5123view</div>
	</div>
	
	<div class="imgAndFeeAddrBoxDiv">
		<div id="img"><img class="img-thumbnail" style="border: none;" width="500" height="400" src="${rootPath }/resources/img/header_image.png"></div>
		<div class="feeAndAddrBoxDiv">
			<div style="line-height: 3;">
			<div style="font-size: larger;font-weight: bold;">費用(月額)</div>
			<div id="fee">400000円</div>
			<div style="font-size: larger;font-weight: bold;">住所</div>
			<div id="address">sadfsafeefjefefefjefefeffewfjefefeffewfwefefewfewfewf</div>
			</div>
		</div>
	
	</div>
	
	
	<div class="subImgBoxDiv">
	
		
	
	</div>
	


</div>


<div class="bottomBoxDiv">
	
	<div class="featureBoxDiv">
		<div class="titleDiv">~~~~~~~~の特徴</div>
		<div>asd asd asd asd asd asd asd asd asdasd</div>
		<div>description</div>
	</div>
	
	
	
	
	
</div>