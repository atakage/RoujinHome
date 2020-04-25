<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

    
    
    
    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>

<style>

.loginBoxDiv{
	width:50%;
	margin-top: 10%;
	text-align: center;
}

.loginHeader{
	width:100%;
	background-color:forestgreen;
	border-radius:10px;
	color:white;
	padding:10px;
	font-size: larger;
    font-weight: bold;
}

.loginContent{
	width:97%;
	border-right: 1px solid black;
	border-left: 1px solid black;
	border-bottom: 1px solid black;

}

.loginButton{

	background-color: yellowgreen;
    border: 1px solid yellowgreen;
    font-size: x-large;
    color: white;
    border-radius: 20px;
    margin-top: 3%;
    width: 100%;
    opacity:0.7;

}

.loginButton:hover{
	opacity:1;
}

.joinUserBoxDiv{

	width:45%;
	margin-top: 10%;
	text-align: center;

}


.joinUserHeader{
	width:100%;
	background-color:black;
	border-radius:10px;
	color:white;
	padding:10px;
	font-size: larger;
    font-weight: bold;
}

.joinUserButton{

    font-size: larger;
    font-weight: bold;
    background-color: cornflowerblue;
    border:2px solid black;
    color: white;
    height: 10%;

}

.joinConcernButton{
	font-size: larger;
    font-weight: bold;
    background-color: burlywood;
    border:2px solid black;
    color: white;
    height: 10%;

}
</style>

<script>

$(function(){


	$(document).on('click','.loginButton',function(){

			var username = $('#username').val().replace(/ /g,'')
			var password = $('#password').val().replace(/ /g,'')

		

			if(username.length < 1){

					alert('IDを入力してくだたい')
					return false
				}

			if(password.length < 1){

				alert('パスワードを入力してくだたい')
				return false
			}
		
		
		
		})

	
})

</script>    


<div class="container-fluid loginBoxDiv">

<div class="container-fluid loginHeader">
アカウントをお持ち方
</div>
<div class="container-fluid loginContent">
	<form:form action="${rootPath}/login" method="post" class="form-group　loginForm">	
		<br>	
		<input id="username" name="username" class="form-control" placeholder="ID">
		<input id="password" name="password" class="form-control" type="password" placeholder="パスワード">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
			<div style="color:red;">
				${SPRING_SECURITY_LAST_EXCEPTION.message}
			</div>
		</c:if>	
		<button class="btn loginButton">ログイン</button>
	</form:form>
</div>


</div>








<div class="container-fluid joinUserBoxDiv">

<div class="container-fluid joinUserHeader">
初めてご利用される方
</div>
<div class="container-fluid loginContent" style="padding:20px">	
	<button class="btn joinUserButton" onclick="document.location.href='${rootPath}/joinuser'">一般ユーザーで加入する</button>
	<button class="btn joinConcernButton" onclick="document.location.href='${rootPath}/joinconcern'">施設関係者で加入する</button>
</div>

</div>



