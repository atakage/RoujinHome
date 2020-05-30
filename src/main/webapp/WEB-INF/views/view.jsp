<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>   

    
       
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
	width:50%;
	font-size: x-large;
	font-weight: bold;
	padding-left: 30px;
}

#view{
	font-size: x-large;
	width:50%;
	text-align: center;
}

.imgAndFeeAddrBoxDiv{
	display:flex;
	margin-bottom:1%;
}

#img{
	width:50%;
	text-align: center;

}

.feeAndAddrBoxDiv{
	width:50%;
	word-break: break-all;
    padding: 10px;
}

.subImgBoxDiv{
	width:50%;
	margin-bottom:3%;
	text-align: center;
	
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

.mainImg{
	max-width: 100%;
	max-height: 100%;
}

.qaTitle{
	
	width:90%;
    font-size: x-large;
    font-weight: bold;
    color: limegreen;
    margin: 0 auto;
    margin-bottom:3%;
    text-decoration: underline;
    margin-top: 10%;
}

.qaBtn{
	margin:0 auto;
	width:90%;
	background-color:deeppink;
	color:white;
	border-radius:10px;
	padding:10px;
	text-align: center;
	font-size: large;
	font-weight: bold;
	border:none;
	margin-top:3%;
}

.qaBtn:hover{
	
	cursor:pointer;
	background-color:rgba(199,15,115,1);
}

.modal-dialog{
	margin-top:20%;
}

.qaEntranceBox{
	width:90%;
	background-color: rgba(50,205,50,0.3);
	margin: 0 auto;
}

</style>








<script>


$(function(){

/*
	$('.qaBtn').click(function(){

		$('.modal fade show').css('display','none')
		
		$.ajax({

			url:"${rootPath}/v2/checklogin", type:'get',
			success:function(result){
					if(result == 'FAIL'){
							alert('ログインしてください')
							document.location.replace('${rootPath}/login')
						}else if(result == 'ONLYUSER'){
							alert('一般ユーザーのみ登録できます')
							return false
							}
				},error:function(){
						alert('サーバーエラー')
					}
			
			})
		
		})
*/	



	$('.qaInputBtn').click(function(){

		var sal_sequence = ${SALVO.sequence}
		var content = $('.content').val()


		$.ajax({

			url:'${rootPath}/v2/qainput', data:{salSequence:sal_sequence, content:content, '${_csrf.parameterName}':'${_csrf.token}'}, type:'post',
			success:function(result){
					if(result == 'ONLYUSER'){
						alert('一般ユーザーのみ登録できます')
					}else if(result == 'MAXCONTENT'){
						alert('2000文字以内で入力してくだたい')
					}


					$.ajax({
						url:'${rootPath}/v2/qainputok',data:{'${_csrf.parameterName}':'${_csrf.token}'},type:'post',
						success:function(result){
							$('.qaEntranceBox').html(result)
							$('.modal').modal('hide')
							},error:function(){
								alert('サーバーエラー')
								}
						})

					
					
				},error:function(){
						alert('サーバーエラー')
					}
			
			})
		
		})



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
		<div id="img"><img class="mainImg" style="border: none;" width="600" height="500" src="${rootPath}/files/${FILELIST[0].file_upload_name}"></div>
		</c:if>
		<c:if test="${empty FILELIST}">
		<div id="img"><img class="mainImg" style="border: none;" width="600" height="500" src="${rootPath}/resources/img/no-image.png"></div>
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
	
	
	
	
	<div class="qaBoxDiv">
		<div class="qaTitle">Q&A</div>
		
		<div class="qaEntranceBox">
		  <%@ include file="/WEB-INF/views/qabox_page.jsp" %>  
		 </div>
		
		
		<security:authorize access="hasRole('user')">
			<div class="qaBtn" data-toggle="modal" data-target="#myModal">この施設について質問する</div>
				
					<!-- The Modal -->
			  <div class="modal fade" id="myModal">
			    <div class="modal-dialog">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h5 class="modal-title">作成者：<span style="font-weight: bold;"><security:authentication property="principal.username"/></span></h5>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			          <textarea class="content" rows="5" cols="60" maxlength="2000" placeholder="2000文字以内"></textarea>
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-danger qaInputBtn">登録</button>
			        </div>
			        
			      </div>
			    </div>
			  </div>
  		</security:authorize>
  
  
  
  
  
  
  
  
  
  <security:authorize access="isAnonymous()"><div style="text-align: center;"><a href="${rootPath}/login">ログイン</a>して作成</div></security:authorize>
	</div>
	
</div>