<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    
    
    
    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>



<style>

.title{

	margin-top:5%;
	margin-bottom:5%;
	font-size: xx-large;
	font-weight: bold;
	text-align: center;

}


.selectAndTableBoxDiv{
	width:70%;
	margin:0 auto;

}

.listTable{
	text-align: center;
}

.img-thumbnail{
	border: none;
}

.table td{
	vertical-align: middle;
}

</style>


<script>


$(function(){


	$('input[class=enabledCheckBox]').each(function(){


		if($(this).val() == 'true'){
				$(this).attr('checked','checked')
			}
		
		})



	$('.enabledCheckBox').change(function(){

		var me = this
		var enabled = $(this).val()
		

		 alert(enabled)
		var checkBoxTd = $(this).parents('.checkBoxTd');	
		var username = checkBoxTd.siblings('.username').text()
		
		
		
			$.ajax({
				url:"${rootPath}/userenabled", data:{username:username, enabled:enabled, '${_csrf.parameterName}':'${_csrf.token}'}, type:'post',
				success:function(result){

						if(result == '権限設定失敗'){
								alert(result)
							}else{
								
								$(me).val(result)
								
								}
						
					
					},error:function(){
						alert('サーバーエラー')
						}
				})
		
		})




	
	
})

</script>

<div class="container-fluid uesrListBoxDiv">

<div class="title">ユーザーリスト</div>

<div class="container-fluid selectAndTableBoxDiv">



	
	<div>
		<table class="table listTable">
			<tr>
				<th>icon</th>
				<th>ID</th>
				<th>authority</th>
				<th>enabled</th>
			</tr>
			
			
			<c:if test="${not empty USERLIST }">
			<c:forEach items="${USERLIST}" var="USERLIST">
			<tr>
				<c:if test="${USERLIST.picture != 'none'}">
				<td><img class="img-thumbnail" src="${USERLIST.picture}" width="100" height="100"></td>
				</c:if>
				<c:if test="${USERLIST.picture == 'none'}">
				<td>none</td>
				</c:if>
				<td class="username">${USERLIST.username}</td>
				<td>${USERLIST.authority}</td>
				<td class="checkBoxTd"><input class="enabledCheckBox" type="checkbox" name="enabled" value="${USERLIST.enabled}"></td>
			</tr>
			</c:forEach>
			</c:if>
		</table>
	
	</div>

</div>


</div>