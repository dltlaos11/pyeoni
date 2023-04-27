<!-- 
업데이트 기능을 추가할 jsp페이지.
업데이트 관련 설명과 버튼을 추가하자.
업데이트 버튼을 누르면 업데이트 기능 실행 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.btn:hover {
   background-color: #F69320;
   color: white;
   font-weight: bold;
}

.btn {
   margin-right: 50px;
   background-color: white;
   border-color: #F69320;
   color: #F69320;
   font-weight: bold;
}
</style>
</head>
<body>

	<script>
	$(function() {
		$("#update").on("click", function() {

			$('#result').empty();
		    $('#result').hide();
		    LoadingWithMask("Spinner-1s-200px.gif");
		    $('#body').show();
			var sortType = $("select[name='sort_type']").val();
			var productType = $("select[name='product_type']").val();
			var eventType = $("select[name='event_type']").val();
			var start = parseInt($("#pageNum").val());
			var end = parseInt($("#pageNum").val()) + 19;

			$.ajax({
				url : "update.do",
				data : {
					"start" : start,
					"end" : end,
					"brand" : "CU",
					"sort_type" : sortType,
					"product_type" : productType,
					"event_type" : eventType
				},
				success : function(responseData) {
					console.log(responseData);
					
					var value = "<div>값1:"+JSON.parse(responseData).updateList[0].crawalingCount+"</div>"+
					"<div>값2:"+ JSON.parse(responseData).updateList[0].tableDelCount+"</div>";
					
					var resultContent = '';
					resultContent += "<h4 class='alert-heading'>업데이트에 성공했습니다😊</h4> <p>업데이트 내역은 다음과 같습니다.</p> <hr> <p class='mb-0'>table에서 삭제된 상품개수: "+JSON.parse(responseData).updateList[0].crawalingCount+", DB에 갱신된 상품 개수: "+ JSON.parse(responseData).updateList[0].tableDelCount+"</p>";
					
					
					$('#result').append(resultContent);
				    $('#result').show();
					
					closeLoadingWithMask();
					
					//$("#more_here").append(value);
					$("#pageNum").val(start + 20);
				},
				error : function(message) {
					//alert(message);
				}
			});
		});
	});

	 
	function LoadingWithMask(gif) {
	    var maskHeight = $(document).height();
	    var maskWidth  = window.document.body.clientWidth;
	     
	    var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
	    var loadingImg = '';
	    
	    loadingImg += " <img src='"+ gif + "' style=' height:100px; weight:100px;  position: absolute; display: block; margin: 0px auto;'/>";
	 
	    $('body')
	        .append(mask);
	 
	    $('#mask').css({
	            'width' : maskWidth,
	            'height': maskHeight,
	            'opacity' : '0.3'
	    }); 
	  
	    $('#mask').show();
	  
	    $('#loadingImg').append(loadingImg);
	    $('#loadingImg').show();

	}
	 
	function closeLoadingWithMask() {
	    $('#mask, #loadingImg').hide();
	    $('#mask, #loadingImg').empty();  
	}
	
	
</script>
	<input type="hidden" value="${pagenum}" id="pageNum">
	<div id="body" style="text-align: center;">
		<div id="loadingImg"
			style="display: none; background-color: transparent; width: 10%; margin: 0 auto;"></div>
		<h1>편의점 행사 내역 업데이트</h1>
		<br>
		<p>아래 버튼을 클릭하면 모든 편의점의 행사 내역을 크롤링하여</p>

		<br>
		<p>데이터베이스에 있는 테이블에 반영이 됩니다.</p>
		<br>
		<div class="mb-3">
			<button class="btn" id="update">UPDATE</button>
		</div>


		<div id="more_here">
		<div id="result" class="alert alert-success" role="alert"
			style="display: none;">

		</div>
		
	</div>


</body>
</html>










































