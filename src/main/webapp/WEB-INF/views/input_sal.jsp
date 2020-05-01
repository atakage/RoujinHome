<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    
    
    
    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>


<style>

.inputBox{
	width: 70%;
    margin: 0 auto;
    padding: 50px;
    margin-top: 5%;
}

.input{
	width:50%;
}

.checkBoxDiv{
	padding: 30px;
    border: 1px solid;
    width: 100%;
    display: flex;
}

.checkBoxInnerDiv{
	margin:0 10;
}

.imgs_wrap{
	border:1px solid black;
	text-align: center;
}

.head{
	width: 70%;
    text-align: center;
    margin: 0 auto;
    padding: 50px;
    font-size: xx-large;
}

button{
	font-size: x-large;
    font-weight: bold;
}

.title{
	font-weight:bold;
}

</style>


<script>

$(function(){





	// file
	var sel_files = []
	$('#input_imgs').on("change", handleImgsFilesSelect)
	
	function handleImgsFilesSelect(e){
			$('.imgs_wrap').empty()
			var files = e.target.files
			var filesArr = Array.prototype.slice.call(files)

			filesArr.forEach(function(f){


				if(!f.type.match("image.*")){
						alert('イメージのみアップロードできます')
						return
					}

				sel_files.push(f)

				var reader = new FileReader()

				// readイベントが成功するたびに動作
				
				
				reader.onload = function(e){
						
						var img_html = "<img src=\""+e.target.result+"\" class='imgImg' width='250px' height='250px'/>"				
						$('.imgs_wrap').append(img_html)
					}
				reader.readAsDataURL(f)
				
				})

			
		}




	





	$(document).on('click','.inputBtn',function(){



		var featureArr = new Array()
		$('input:checkbox[name=featureArr]:checked').each(function(){

			featureArr.push($(this).attr('src'))
			
			
		})



		

		var name = $('#name').val().replace(/ /g,'')
		var address = $('#address').val().replace(/ /g,'')
		var fee = $('#fee').val()
		var description = $('#description').val()
		
		
		
		if(name.length < 1 || name.length > 50){

			alert('施設名は50文字以内で入力してくだたい')
			$('#name').focus()
			return false
		}

		if(address.length < 1 || address.length > 100){

			alert('住所は100文字以内で入力してくだたい')
			$('#address').focus()
			return false
		}

		if(fee.length < 1 || fee.length > 7){

			alert('入居費用を確認してください')
			$('#fee').focus()
			return false
		}

		if(description.length < 1 || description.length > 2000){

			alert('施設紹介は2000文字以内で入力してくだたい')
			$('#description').focus()
			return false
		}


		$('form').submit()
		

/*
		var salutarium = $('form').serialize()
		

		
		alert(salutarium)
	
		$.ajax({

			url:"${rootPath}/inputsal", data:{salutariumVO:salutarium,"${_csrf.parameterName}":"${_csrf.token}"}, enctype:'multipart/form-data', processData:false, contentType:false, type:'post',
			success:function(result){
					
				},error:function(){
					alert('サーバーエラー')					
					}

			})

*/		
		})
	



		


	
	
	



	
})


</script>

<body>
	<div class="head">施設登録</div>

	<div class="form-group inputBox">
		<form method="post" enctype="multipart/form-data">
		
			
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			
			
			<div>
				<div class="title">施設名</div>
				<input class="form-control" name="name" id="name" maxlength="50" placeholder="50文字以内"/>
			</div>
			<br>
			
			<div>
				<div class="title">住所</div>
				<input class="form-control" name="address" id="address" maxlength="100" placeholder="100文字以内"/>
			</div>
			<br>
			
			<div>
				<div class="title">入居費用(月額)</div>
				<input class="form-control" name="fee" id="fee" maxlength="7" style="width:20%;" placeholder="円" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
			</div>
			<br>
			
			<div>
				<div class="title">施設の特徴</div>
				<div class="checkBoxDiv">
					<div class="checkBoxInnerDiv">
					<input type="checkbox" name="featureArr" value="shift"/>
					<label>夜間有人</label>
					<input type="checkbox" name="featureArr" value="callCare"/>
					<label>訪問看護</label>
					<input type="checkbox" name="featureArr" value="singleRoom"/>
					<label>個室あり</label>
					<input type="checkbox" name="featureArr" value="nurseCall"/>
					<label>ナースコール</label>
					<br>
					<input type="checkbox" name="featureArr" value="bathing"/>
					<label>入浴週3回</label>
					<input type="checkbox" name="featureArr" value="noSmoking"/>
					<label>館内禁煙</label>
					<input type="checkbox" name="featureArr" value="transportation"/>
					<label>交通便利</label>
					<input type="checkbox" name="featureArr" value="goOut"/>
					<label>外出自由</label>
					<input type="checkbox" name="featureArr" value="drinking"/>
					<label>アルコール可</label>	
					</div>
					
					
					
				</div>
			</div>
			<br>
			
			
			<div>
				<div class="title">施設紹介</div>
				<textarea class="form-control" name="description" id="description" maxlength="2000" rows="10" cols="10" placeholder="2000文字以内"></textarea>
			</div>
			<br>
			
			<div>
				<div class="title">施設の写真</div>
				<input id="input_imgs" type="file" name="file" multiple="multiple"/>
				
				<div class="Thumbnail imgs_wrap">
				</div>
			</div>
			<br>
			
		<button class="inputBtn" type="button">登録</button>	
		</form>
	</div>

</body>