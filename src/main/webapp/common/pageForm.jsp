<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form class="d-flex" id="main_search">
	<div class="input-group">
		<input class="form-control" type="search" id="search_bar"
			name="search_bar" placeholder="찾으시는 상품을 입력하세요">
		<button class="btn" id="search_btn" type="submit">검색</button>
	</div>

	<div class="select">
		<div class="select_sort">
			<select name="sort_type" class="form-control">
				<option selected value="">가격-정렬</option>
				<option value="낮은가격순">낮은가격순</option>
				<option value="높은가격순">높은가격순</option>
			</select>
		</div>

		<div class="select_product">
			<select name="product_type" class="form-control">
				<option selected value="">상품-전체</option>
				<option value="음료">음료</option>
				<option value="아이스크림">아이스크림</option>
				<option value="생활용품">생활용품</option>
				<option value="식품">식품</option>
				<option value="식품">과자류</option>
			</select>
		</div>

		<div class="select_event">
			<select name="event_type" class="form-control">
				<option selected value="">행사-전체</option>
				<option value="1+1">1+1</option>
				<option value="2+1">2+1</option>
				<option value="3+1">3+1</option>
			</select>
		</div>
	</div>
</form>