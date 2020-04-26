<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

    
    
    
    
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

</style>


<script>

$(function(){



		var feature = new Array()
		$('input:checkbox[name=feature]:checked').each(function(){

			feature.push(this.value)
			
			
			})


	
	
	
	

	
})


</script>

<body>

	<div class="form-group inputBox">
		<form:form modelAttribute="SALVO">
			<div>
				<div>施設名</div>
				<form:input class="form-control" path="name" maxlength="50"/>
			</div>
			<br>
			
			<div>
				<div>住所</div>
				<form:input class="form-control" path="address" maxlength="100"/>
			</div>
			<br>
			
			<div>
				<div>入居費用(月額)</div>
				<form:input class="form-control" path="fee" maxlength="7" style="width:20%;" placeholder="円"/>
			</div>
			<br>
			
			<div>
				<div>施設の特徴</div>
				<div class="checkBoxDiv">
					<div class="checkBoxInnerDiv">
					<form:checkbox  path="feature" value="shift"/>
					<label>夜間有人</label>
					<form:checkbox  path="feature" value="callCare"/>
					<label>訪問看護</label>	
					</div>
					
					
					
				</div>
			</div>
			<br>
			
		</form:form>
	</div>

</body>