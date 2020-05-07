<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />






<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>



<style>
.loginDiv {
	display: inline-block;
	background-color: forestgreen;
	padding: 5px;
}

.loginAtag {
	color: white;
	float: right;
}

.loginAtag:hover {
	color: white;
	text-decoration: none;
}

header {
	
}

.headerDiv {
	font-weight: bold;
	font-size: xx-large;
	padding: 30px;
	color: forestgreen;
}

.nav-item {
	padding-left: 20px;
	padding-right: 20px;
}

.navbar {
	border-top: 2px solid forestgreen;
	border-bottom: 2px solid forestgreen;
	padding-top: 0px;
	padding-bottom: 0px;
}

.nav-link {
	color: black;
	font-weight: bold;
	font-size: large;
}

.nav-item a {
	padding-top: 20px;
	padding-bottom: 20px;
}

.nav-item:hover a {
	color: forestgreen;
}

.dropdownDiv {
	display: none;
	position: absolute;
	background-color: aliceblue;
	padding: 0;
	z-index: 10;
	
}

.navTodohuken{
	font-weight: bold;
	text-decoration: underline;
}

.buttonSikuchouson:hover{
	font-weight: bold;
	cursor: pointer;
}




</style>

<script>
	$(function() {

		$(document).on('mouseenter', '.sisetsu', function() {

			$('.dropdownDiv').css('display', 'block')

		})

		$(document).on('mouseleave', '.sisetsu', function() {

			$('.dropdownDiv').css('display', 'none')

		})

		$(document).on('mouseenter', '.dropdownDiv', function() {

			$('.dropdownDiv').css('display', 'block')

		})

		$(document).on('mouseleave', '.dropdownDiv', function() {

			$('.dropdownDiv').css('display', 'none')

		})




		$(document).on('click', '#logoutBtn', function(){


			$.post('${rootPath}/logout', {"${_csrf.parameterName}":"${_csrf.token}"},
						function(result){
								document.location.replace('${rootPath}/')
							}
					)
			
			})

	})
</script>


<div class="container-fluid loginDiv">
	<security:authorize access="isAnonymous()">
		<a class="loginAtag" href="${rootPath}/login">ログイン</a>
	</security:authorize>
	<security:authorize access="isAuthenticated()">
		<a style="font-weight: bold;"><security:authentication property="principal.username"/></a>さん,ようこそ!
		<a id="logoutBtn" class="loginAtag" href="#">ログアウト</a>
	</security:authorize>
</div>

<header class="container-fluid">

	<div class="container-fluid headerDiv">
		行くのが楽しみ <img src="${rootPath}/resources/img/header_image.png"
			width="200px" height="200px">
	</div>
</header>



<nav class="navbar">


	<ul class="navbar-nav navbar-expand-sm">

		<li class="nav-item"><a class="nav-link" href="${rootPath}/">HOME</a></li>

		<li class="nav-item sisetsu"><a class="nav-link" href="${rootPath}/searchcenter">施設を探す</a>
		</li>
		
		<security:authorize	access="hasRole('concern')">
		<li class="nav-item"><a class="nav-link" href="${rootPath}/inputsal">施設登録</a></li>
		</security:authorize>
		
		<security:authorize access="hasRole('concern')">
		<li class="nav-item"><a class="nav-link" href="${rootPath}/modianddelsal">施設の修正削除</a></li>
		</security:authorize>


	</ul>



</nav>

<div class="container-fluid dropdownDiv">
	<div class="container-fluid">
		<div class="container-fluid">
		<a class="navTodohuken">北海道</a>
		</div>
		<div class="container-fluid navSikuchouson">
			<a class="container-fluid buttonSikuchouson">札幌市</a>
			<a class="container-fluid buttonSikuchouson">根室市</a>
		</div>
		<br>
		<div class="container-fluid">
		<a class="navTodohuken">東京都</a>
		</div>
		<div class="container-fluid navSikuchouson">
			<a class="container-fluid buttonSikuchouson">小平市</a>
			<a class="container-fluid buttonSikuchouson">町田市</a>
		</div>
		<br>
	</div>

</div>





