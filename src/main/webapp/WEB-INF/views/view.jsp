<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    

    
       
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/textfit/2.4.0/textFit.min.js" integrity="sha256-FVX67V27BmQoXxFOU8Jx4+C9fDK6FLl4k/j5UhSsC88=" crossorigin="anonymous"></script>

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
    margin-bottom:3%;
}

.featureContent{
	width: 50px;
    height: 50px;
    font-weight: 900;
 
    text-align: center;
    color: yellowgreen;
    border: 3px solid yellowgreen;
    margin: 2px;
    border-radius: 10px;
}

.featureContent:hover{
	cursor: help;
}

.subImg{
	border: 2px solid white;
}

.subImg:hover{
	cursor: pointer;
}




</style>








<script>


$(function(){



	$('.subImgBoxDiv .subImg:first-child').css('border-color','limegreen')

	
	
	$(document).on('click','.subImg',function(){


			$(this).siblings().css('border-color','white')
			$(this).css('border-color','limegreen')
			
			
			
			$('.mainImg').attr('src', $(this).attr('src'))
		})






	


	// div sizeに合わせて文字のサイズを自動設定(library)
	textFit($('.featureContent'))
	
	$('[data-toggle="tooltip"]').tooltip()
	
	
	
	
	
	$('.featureContent').each(function(index){ 


		
		if($(this).text().trim() == '夜間有人'){
			$(this).attr('data-original-title','夜もスタッフが常駐している施設')

		
		}else if($(this).text().trim() == '訪問看護'){
			$(this).attr('data-original-title','訪問看護を利用できる施設')
		}else if($(this).text().trim() == '個室あり'){
			$(this).attr('data-original-title','個室がある施設')
		}else if($(this).text().trim() == 'ナースコール'){
			$(this).attr('data-original-title','居室内に緊急通報装置、ナースコールが設置された施設')
		}else if($(this).text().trim() == '入浴週3回'){
			$(this).attr('data-original-title','週3回以上入浴できる施設')
		}else if($(this).text().trim() == '館内禁煙'){
			$(this).attr('data-original-title','館内では禁煙が明示された施設')
		}else if($(this).text().trim() == '交通便利'){
			$(this).attr('data-original-title','駅から徒歩圏内の交通が便利な施設')
		}else if($(this).text().trim() == '外出自由'){
			$(this).attr('data-original-title','外出が自由な施設')
		}else if($(this).text().trim() == 'アルコール可'){
			$(this).attr('data-original-title','アルコール飲料が許可されている施設')
		}
			
		
		})
		
})


</script>



<div class="topBoxDiv">

	<div class="nameAndviewBoxDiv">
		<div id="name">${SALVO.name}</div>
		<div id="view">${SALVO.view}view</div>
	</div>
	
	<div class="imgAndFeeAddrBoxDiv">
		<c:if test="${not empty FILELIST}">
		<div id="img"><img class="img-thumbnail mainImg" style="border: none;" width="500" height="400" src="${rootPath}/files/${FILELIST[0].file_upload_name}"></div>
		</c:if>
		<c:if test="${empty FILELIST}">
		<div id="img"><img class="img-thumbnail mainImg" style="border: none;" width="500" height="400" src="${rootPath}/resources/img/no-image.png"></div>
		</c:if>
		<div class="feeAndAddrBoxDiv">
			<div style="line-height: 3;">
			<div style="font-size: larger;font-weight: bold;">費用(月額)</div>
			<div id="fee">${SALVO.fee}円</div>
			<div style="font-size: larger;font-weight: bold;">住所</div>
			<div id="address">${SALVO.address}</div>
			</div>
		</div>
	
	</div>
	
	
	<div class="subImgBoxDiv">
	
	<c:if test="${not empty FILELIST}">
	
		<c:forEach items="${FILELIST}" var="fileList">
			<img class="img-thumbnail subImg" width="50" height="50" src="${rootPath}/files/${fileList.file_upload_name}">
		</c:forEach>
	
	</c:if>
		
	
	</div>
	


</div>


<div class="bottomBoxDiv">
	
	<div class="featureBoxDiv">
		<div class="titleDiv">${SALVO.name}の特徴</div>
		
		<c:if test="${SALVO.featureArr[0] != 'null'}">
		
		<div style="display:flex; margin-bottom: 5%;">
			<c:forEach items="${SALVO.featureArr}" var="featureArr" >	
			<div class="featureContent" data-toggle="tooltip">${featureArr}</div>
			</c:forEach>
		</div>
		
		</c:if>
		
		<div style="font-size:larger; font-weight:bold;"><pre style="white-space: pre-wrap;">${SALVO.description}</pre></div>
	</div>
	
	
	
<script>



</script>	
	
</div>