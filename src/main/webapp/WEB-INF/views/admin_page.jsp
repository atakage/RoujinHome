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

</style>


<div class="container-fluid uesrListBoxDiv">

<div class="title">ユーザーリスト</div>

<div class="container-fluid selectAndTableBoxDiv">


	<div>
		<select>
			<option value="all">all</option>
			<option value="user">user</option>
			<option value="concern">concern</option>
		</select>
	</div>
	
	<div>
		<table class="table listTable">
			<tr>
				<th>icon</th>
				<th>ID</th>
				<th>authority</th>
				<th>enabled</th>
			</tr>
			
			<tr>
				<td>icon</td>
				<td>ID</td>
				<td>authority</td>
				<td>enabled</td>
			</tr>
		
		</table>
	
	</div>

</div>


</div>