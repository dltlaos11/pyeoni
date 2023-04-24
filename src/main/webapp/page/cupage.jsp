<%@page import="com.pyeoni.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.pyeoni.model.ProductServices"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">


<%@ include file="../common/commonfiles.jsp"%>

<style>
body {
	margin: 0 auto;
}

.navbar-brand>img {
	height: 80px;
	width: 80px;
}

.nav-item {
	padding-left: 50px;
}

.nav-link:hover {
	background-color: purple;
	color: white;
	border-radius: 10px;
}

a.nav-link {
	color: purple;
	font-size: 20px;
}

#login_btn {
	margin-right: 50px;
	background-color: white;
	border-color: purple;
	color: #751485;
	font-weight: bold;
}

#login_btn:hover {
	background-color: #751485;
	color: white;
	font-weight: bold;
}

.content {
	text-align: center;
	margin-top: 100px;
}

/* 애니메이션 */
.w3-animate-opacity {
	animation-duration: 5s; /* change to the desired duration */
}

.input-group {
	width: 550px;
	margin: auto;
	margin-bottom: 30px;
}

#search_bar {
	text-align: center;
	width: 350px;
	border-width: 2px;
}

#search_btn {
	color: #751485;
	border-color: #751485;
	border-width: 2px;
	font-weight: bold;
}

#search_btn:hover {
	background-color: #751485;
	color: white;
	font-weight: bold;
}

#main_search {
	display: flex;
	flex-direction: column;
}

.select {
	text-align: center;
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	margin: 0 auto;
}

.select_product {
	margin: 0px 20px 0px 20px;
}

.select select {
	text-align: center;
}

/* cu페이지 css시작 */
#logo_cu {
	width: 360px;
	height: 170px;
}

.change_event {
	text-align: center;
	margin-bottom: 30px;
	color: #751485;
	font-size: 25px;
	font-weight: bold;
}

/* footer */
footer {
	width: 95%;
	height: 110px;
	bottom: 0;
	position: absolute;
	text-align: right;
	font-size: 15px;
}
</style>


</head>
<body>
	<%@ include file="../common/sidebar.jsp"%>
	 <%@include file="../common/pageheader.jsp" %>


	<div class="content">
		<div class="col-md-6 offset-md-3 mt-2 mb-4" id="search">
			<!-- 애니메이션 적용 -->
			<div class="w3-container w3-center w3-animate-opacity">
				<img src="../img/logo_CU.png" id="logo_cu">

				<form method="get" action="cupage.jsp" class="d-flex" id="main_search">
					<div class="input-group">
						<input class="form-control" type="search" id="search_bar"
							name="search_bar" placeholder="찾으시는 상품을 입력하세요">
						<button class="btn" id="search_btn" type="submit">검색</button>
					</div>

					<div class="select">
						<div class="select_sort">
							<select name="sort_type" class="form-control" id="id_sort">
								<option selected>가격-정렬</option>
								<option value="1">낮은가격순</option>
								<option value="2">높은가격순</option>
							</select>
						</div>

						<div class="select_product">
							<select name="product_type" class="form-control">
								<option selected>분류-전체</option>
								<option value="1">음료</option>
								<option value="2">아이스크림</option>
								<option value="3">생활용품</option>
							</select>
						</div>

						<div class="select_event">
							<select name="event_type" class="form-control">
								<option selected>행사-전체</option>
								<option value="1">1+1</option>
								<option value="2">2+1</option>
								<option value="3">3+1</option>
							</select>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- 1+1, 2+1 텍스트 -->
	<div class="change_event">

		<i class='bx bxs-megaphone'></i> <span id="allproduct">전체 상품목록입니다.</span><br>
		<!-- <span id="1+1">1+1 행사상품입니다.</span><br>
		<span id="2+1">2+1 행사상품입니다.</span><br>   -->
	   	  
	</div>

	<!-- ProductSelectAll -->
	<%@ include file="../product/ProductSelectAll.jsp"%>


	<!-- <footer>
         <hr>
         <nav>
            <a href="https://www.naver.com/">Naver</a> | <a
               href="https://github.com/Jennorresothie/pyeoni">Github</a>
         </nav>
         <p>
            <span>제작자 : 맨앞줄조</span> <br> <span>이메일 : 1111@naver.com</span>
            <br> <span>Copyright 2023. All Rights Reserved.</span>
         </p>
   </footer> -->

</body>
</html>