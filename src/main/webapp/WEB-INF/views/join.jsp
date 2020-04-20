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
$(function(){


	$(document).on('click','.joinUserButton',function(){


			var radioVal = $("input[name='pictureSelect']:checked").siblings('.picture').attr('src')
			alert(radioVal)
		
		
		})
	
})
</script>


<body>

<c:if test="${JOINUSER == 'JOINUSER'}">

<div style="margin-top:5%; width: 100%; text-align: center;">
<form>
	<fieldset>
		<legend style="width:25%;">一般ユーザーで登録</legend>
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
		<legend style="width:25%;">施設関係者で登録</legend>
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
	</fieldset>
</form>
</div>

</c:if>


</body>