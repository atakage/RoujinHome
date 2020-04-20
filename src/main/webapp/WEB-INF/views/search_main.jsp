<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    

    
    
    
    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>



<style>

.selectBoxDiv{

	display: flex;
    background-color: yellowgreen;
    font-size: large;
}

.subtitle{
	text-align: center;
    margin-top: 10%;
    font-size: xx-large;
    font-weight: bold;

}

</style>



<script>

$(function(){



	$('#todohuken').change(function(){

		var todohuken = $('#todohuken option:selected').val()
		

		if(todohuken == '北海道'){

				$('#sikuchouson option').remove()
				$('#sikuchouson').append("<option value='市区町村'>市区町村</option>")
				$('#sikuchouson').append("<option value='札幌市'>札幌市</option>")
				$('#sikuchouson').append("<option value='根室市'>根室市</option>")

		}else if(todohuken == '東京都'){


			$('#sikuchouson option').remove()
			$('#sikuchouson').append("<option value='市区町村'>市区町村</option>")
			$('#sikuchouson').append("<option value='小平市'>小平市</option>")
			$('#sikuchouson').append("<option value='町田市'>町田市</option>")

		}else if(todohuken == '市区町村'){

			$('#sikuchouson option').remove()
			$('#sikuchouson').append("<option value='市区町村'>市区町村</option>")

			}
		
		})

	
})



</script>

<body>



<div class="subtitle">
施設を探す
</div>




<div class="container-fluid selectBoxDiv">

	<div>
		<select id="todohuken">
			<option>都道府県</option>
			<option>北海道</option>
			<option>東京都</option>
		</select>
	</div>
	<div>
		<select id="sikuchouson">
			<option>市区町村</option>
		</select>
	</div>
	
	<div style="float:right;">
		検索結果:件
	</div>

</div>


</body>