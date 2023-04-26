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
	background-color: rgb(255, 185, 22);
	color: white;
	border-radius: 10px;
}

a.nav-link {
	color: rgb(255, 185, 22);
	font-size: 20px;
}

#login_btn {
	margin-right: 50px;
	background-color: white;
	border-color: rgb(255, 185, 22);
	color: rgb(255, 185, 22);
	font-weight: bold;
}

#login_btn:hover {
	background-color: rgb(255, 185, 22);
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

#search_bar {
	text-align: center;
	width: 350px;
	border-width: 2px;
}

#search_btn {
	color: rgb(255, 185, 22);
	border-color: rgb(255, 185, 22);
	border-width: 2px;
	font-weight: bold;
}

#search_btn:hover {
	background-color: rgb(255, 185, 22);
	color: white;
	font-weight: bold;
}

/* SevenEleven페이지 css시작 */
#logo_emart {
	width: 380px;
	height: 120px;
	margin-bottom: 40px;
}

.change_event {
	text-align: center;
	margin-bottom: 30px;
	color: rgb(255, 185, 22);
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

/* 더보기 버튼 */
#more_btn{
	display: block;
	margin: 0 auto;	
	width : 200px;
	background-color: white;
	border-color: rgb(255, 185, 22);
	color: rgb(255, 185, 22);
	font-weight: bold;
	margin-bottom: 20px;
}

#more_btn:hover {
	background-color: rgb(255, 185, 22);
	color: white;
	font-weight: bold;
}

#up_btn {
  font-size: 3rem; /* 크기 조정 */
  position: fixed;
  bottom: 20px;
  right: 500px;
}

#up_btn:hover {
    color: blue;
}
</style>

<script>
	$(function(){
		$("#brandid").val("emart24");
		
	});

</script>

</head>
<body>
	 <%@ include file="../common/sidebar.jsp"%>
	 <%@ include file="../common/pageheader.jsp" %>
	 <%@ include file="../common/ModalData.jsp" %>


	<div class="content">
		<div class="col-md-6 offset-md-3 mt-2 mb-4" id="search">
			<!-- 애니메이션 적용 -->
			<div class="w3-container w3-center w3-animate-opacity">
				<img src="../img/logo_emart24.png" id="logo_emart">

				<%@ include file="../common/pageForm.jsp" %>
			</div>
		</div>
	</div>
	
	<!-- textChange -->
	<%@ include file="../common/textChange.jsp" %>

	<!-- ProductSelectAll -->
	<%@ include file="../product/ProductShow.jsp"%>
	<div id="more_here"></div>
	<button class="btn" id="more_btn" type="submit">더보기</button>
	
	<i class='bx bx-up-arrow-circle' id="up_btn" onClick="javascript:window.scrollTo(0,0)"></i>
</body>

<script>
	$(function() {
		$("#more_btn").on(
				"click",
				function() {
					var sortType = $("select[name='sort_type']").val();
					var productType = $("select[name='product_type']").val();
					var eventType = $("select[name='event_type']").val();
					var start = parseInt($("#pageNum").val());
					var end = parseInt($("#pageNum").val())+19;
					
					$.ajax({
						url : "update.do",
						data : {
							"start" : start,
							"end" : end,
							"brand" : "emart24",
							"sort_type" : sortType,
							"product_type" : productType,
							"event_type" : eventType
						},
						success : function(responseData) {
							console.log(responseData);						 
								$("#more_here").append(responseData);
								$("#pageNum").val(start+20);
						},
						error : function(message) {
							alert(message);
						}
					});
				});
	});
</script>


</html>