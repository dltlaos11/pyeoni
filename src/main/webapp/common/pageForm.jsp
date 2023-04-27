<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form class="d-flex" id="main_search">

	<input type="hidden" value="${pagenum}" id="pageNum">

	<div class="input-group">
		<input class="form-control" type="search" id="search_bar" name="search_bar" placeholder="찾으시는 상품을 입력하세요" value='${param.search_bar}'>
		<button class="btn" id="search_btn" type="submit">검색</button>
	</div>

	<div class="select">
		<div class="select_sort">
			<select name="sort_type" class="form-control">
				<option ${param.sort_type==""?"selected":""} value="">가격-정렬</option>
				<option ${param.sort_type=="order by price asc"?"selected":""} value="order by price asc">낮은가격순</option>
				<option ${param.sort_type=="order by price desc"?"selected":""} value="order by price desc">높은가격순</option>
			</select>
		</div>

		<div class="select_product">
			<select id = "prodtype" name="product_type" class="form-control">
				<option ${param.product_type==""?"selected":""} value="">상품-전체</option>
				<option ${param.product_type=="음료"?"selected":""} value="음료">음료</option>
				<option ${param.product_type=="아이스크림"?"selected":""} value="아이스크림">아이스크림</option>
				<option ${param.product_type=="생활용품"?"selected":""} value="생활용품">생활용품</option>
				<option ${param.product_type=="식품"?"selected":""} value="식품">식품</option>
				<option ${param.product_type=="과자류"?"selected":""} value="과자류">과자류</option>
			</select>
		</div>

		<div class="select_event">
			<select name="event_type" class="form-control">
				<option ${param.event_type==""?"selected":""} value="">행사-전체</option>
				<option ${param.event_type=="1+1"?"selected":""} value="1+1">1+1</option>
				<option ${param.event_type=="2+1"?"selected":""} value="2+1">2+1</option>
				<option ${param.event_type=="3+1"?"selected":""} value="3+1">3+1</option>
			</select>
		</div>
	</div>
	
	<input type="hidden" name="brand" id="brandid"></input>
	
</form>

<!-- 고급검색 정렬 -->
<!-- <script>
	$(function(){
		$("#main_search").on("click", function(){
			$.ajax({
				url:"../auth/selectProductByPromotion .....",
				data:"",
				success:function(data){
					$(".selectall").html(data);
				},
				error: function(request, status, error){
					alert(error);
				}
			})
		});
	});

</script> -->