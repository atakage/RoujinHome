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
	
	text-align: center;
}

.allImgs_wrap{
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
	margin-bottom:3%;
}

.mainImgBoxDiv{
	margin-bottom:5%;
}

</style>


<script>

$(function(){




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


	//file
	var sel_file
	$('#input_mainImg').change(function(e){

		alert('dddd')
		$('#mainImg').remove()
		var file= e.target.files
		var fileArr = Array.prototype.slice.call(file)


		fileArr.forEach(function(f){

			if(!f.type.match('image.*')){
				alert('イメージのみアップロードできます')
				return false
				}

			sle_file = f

			var reader = new FileReader()

			// readイベントが成功するたびに動作
			
			
			reader.onload = function(e){
					
					var img_html = "<img src=\""+e.target.result+"\" class='imgImg' width='250px' height='250px'/>"				
					$('.img_wrap').append(img_html)
				}
			reader.readAsDataURL(f)
			
			})
		
		
		
		})

	



	





	// files
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

			featureArr.push($(this).attr('value'))
			
			
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



		var addressPlus = $('#todohuken option:selected').val() + "," + $('#sikuchouson option:selected').val() + "," + $('#address').val().replace(/ /g,'')	
		$('#address').val(addressPlus)
		

		$('form').submit()
		
	
		})
	



		


	
	
	



	
})


</script>

<body>
	<div class="head">施設修正削除</div>

	<div class="form-group inputBox">
		<form:form method="post" enctype="multipart/form-data" modelAttribute="SALVO">
		
			
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			
			
			<div>
				<div class="title">施設名</div>
				<form:input class="form-control" path="name" id="name" maxlength="50" placeholder="50文字以内"/>
			</div>
			<br>
			
			<div>
				<div class="title">住所</div>
				<div>
					<form:select id="todohuken" path="addressArr">
						<form:option value="${SALVO.addressArr[0]}">${SALVO.addressArr[0]}</form:option>
					</form:select>
					<form:select id="todohuken" path="addressArr">
						<form:option value="${SALVO.addressArr[1]}">${SALVO.addressArr[1]}</form:option>
					</form:select>
				</div>
				<form:input class="form-control" path="address" id="address" value="${SALVO.addressArr[2]}" maxlength="100" placeholder="100文字以内"/>
			</div>
			<br>
			
			<div>
				<div class="title">入居費用(月額)</div>
				<form:input class="form-control" path="fee" value="${SALVO.fee }" id="fee" maxlength="7" style="width:20%;" placeholder="円" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
			</div>
			<br>
			
			<div>
				<div class="title">施設の特徴</div>
				<div class="checkBoxDiv">
					<div class="checkBoxInnerDiv">
					<form:checkbox  path="featureArr" value="夜間有人" label="夜間有人"/>
					<form:checkbox  path="featureArr" value="訪問看護" label="訪問看護"/>
					<form:checkbox  path="featureArr" value="個室あり" label="個室あり"/>
					<form:checkbox  path="featureArr" value="ナースコール" label="ナースコール"/>
					<br>
					<form:checkbox  path="featureArr" value="入浴週3回" label="入浴週3回"/>
					<form:checkbox  path="featureArr" value="館内禁煙" label="館内禁煙"/>
					<form:checkbox  path="featureArr" value="交通便利" label="交通便利"/>
					<form:checkbox  path="featureArr" value="外出自由" label="外出自由"/>
					<form:checkbox  path="featureArr" value="アルコール可" label="アルコール可"/>	
					</div>
					
					
					
				</div>
			</div>
			<br>
			
			
			<div>
				<div class="title">施設紹介</div>
				<form:textarea class="form-control" path="description" id="description" maxlength="2000" rows="10" cols="10" placeholder="2000文字以内"></form:textarea>
			</div>
			<br>
			
			<div>
				<div class="title">施設の写真</div>
				
				<div class="mainImgBoxDiv">
				
				<div>メインイメージ</div>
				
				<div>
					<form:input id="input_mainImg" type="file" path="mainFile"  accept="image/*"/>
				</div>
				
				<div class="img_wrap">
					<c:if test="${not empty FILELIST}">
					<img id="mainImg" src="${rootPath}/files/${FILELIST[0].file_upload_name }" class='Thumbnail imgImg' width='250px' height='250px'/>
					</c:if>
				</div>
				
				
				</div>
				
				<div>イメージ</div>
				
				<div>
				<input id="input_imgs" type="file" name="file" multiple="multiple" accept="image/*"/>
				</div>
				
				
				<div class="Thumbnail allImgs_wrap">
				
				
				<c:if test="${not empty FILELIST}">
						<c:forEach items="${FILELIST}" var="FILELIST" begin="1">
						
							<img src="${rootPath}/files/${FILELIST.file_upload_name}" class='imgImg' width='250px' height='250px'/>
						
						</c:forEach>
					</c:if>
				

					<div class="Thumbnail imgs_wrap">
					
						
					
					</div>
				
				</div>
			</div>
			<br>
			
		<button class="inputBtn" type="button">登録</button>	
		</form:form>
	</div>

</body>