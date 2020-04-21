<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    

    
    
    
    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>


<style>

fieldset{
	border:2px solid cornflowerblue;
	width:55%;
	margin: 0 auto;
	padding:20px;
}

.inputLabel{
	font-weight:bold;
	font-size:large;
}



</style>

<script>




</script>



<script>
$(function(){


	var idCheckVal = '0'
	



	// 正規表現英語＋数字
	$('#id').keyup(function(event){
		if(!(event.keyCode >= 37 && event.keyCode <= 40)){
			var inputVal = $(this).val()
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''))
			}
		
		})

	
	$(document).on('blur', '#id',function(){


		var id = $(this).val()


		if(id.length < 3 || id.length > 10){
				$('.idWar').text('*IDを入力してくだたい(3文字以上10文字以内)')
				$('#id').focus()
				return false
				
			}


		$.ajax({


			url:'${rootPath}/idcheck', data:{id:id}, method:'post',
			success:function(result){

					if(result == 'exist'){

						$('.idWar').text('*既に使用されています')
						$('#id').focus()
						return false
						}else{
							
							$('.idWar').text('*使用可能なIDです')
							$('.idWar').css('color','green')
							
							}
				
				
				},error:function(){
					
					$('.idWar').text('サーバーエラー')
						return false
					
					}

			
			})
		
		})
	


	$(document).on('click','.joinUserButton',function(){


			
		
		
	})
	
})
</script>


<body>

<c:if test="${JOINUSER == 'JOINUSER'}">

<div style="margin-top:5%; width: 100%; text-align: center;">
<form>
	<fieldset>
		<legend style="width:45%;">一般ユーザーで登録</legend>
			<a class="inputLabel">ID</a>
			<div>
				<input id="id" maxlength="10">
				
			</div>
			<a class="idWar" style="font-size: smaller;color:red;"></a>
			
			<br>
		
			<a class="inputLabel">パスワード</a>
			<div>
				<input id="password" type="password">
			</div>
			
			<br>
			
			<a class="inputLabel">パスワード確認</a>
			<div>
				<input type="password">
			</div>
			
			<br>
			
			<div>
				<a class="inputLabel" style="float:left;">プロフィールアイコン</a>
				<br>
				<br>
				
				<div style="display:flex;">
					<div>
					<img src="${rootPath}/resources/img/business_man1_1_smile.png" class="picture" width="100px" height="100px"><br>
					<input name="pictureSelect" type="radio" value="1">
					</div>
					<div>
					<img src="${rootPath}/resources/img/business_woman1_1_smile.png" class="picture" width="100px" height="100px"><br>
					<input name="pictureSelect" type="radio" value="2">
					</div>
				</div>
			</div>
			<br>
			<button class="joinUserButton" type="button" style="font-size: xx-large;border-color: cornflowerblue;">登録</button>
	</fieldset>
</form>
</div>

</c:if>







<c:if test="${JOINCONCERN == 'JOINCONCERN'}">

<div style="margin-top:5%; width: 100%; text-align: center;">
<form>
	<fieldset style="border:2px solid burlywood">
		<legend style="width:45%;">施設関係者で登録</legend>
			<a class="inputLabel">ID</a>
			<div>
				<input>
			</div>
			
			<br>
		
			<a class="inputLabel">パスワード</a>
			<div>
				<input type="password">
			</div>
			
			<br>
			
			
			<a class="inputLabel">パスワード確認</a>
			<div>
				<input type="password">
			</div>
			
			<br>
	</fieldset>
</form>
</div>

</c:if>


</body>