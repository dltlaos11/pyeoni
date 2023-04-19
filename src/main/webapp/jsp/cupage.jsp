<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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


a.nav-link{
	color: purple;
	font-size: 20px;
}

#main_title {
	font-size: 80px;
	font-weight: bold;
	text-align: center;
	color: orange;
}

button.btn.btn-outline-warning {
	color: orange;
	border-color: orange;
	border-width: 2px;
	font-weight: bold;
}

#login_btn{
	margin-right: 50px;
}

#login_btn:hover{
	color:white;
}

.content {
	text-align: center;
	margin-top: 200px;
}

#main_title{
	text-shadow: 4px 2px 2px gray; 
}

#cu_img{
	width: 50px;
    height: 50px;

}
#gs_img{
	width: 50px;
    height: 50px;
	margin-left: 20px;
	margin-bottom: 10px;
}
#seven_img{
	width: 50px;
    height: 50px;
	margin-bottom: 10px;
}

/* 애니메이션 */
.w3-animate-opacity {
  animation-duration: 5s; /* change to the desired duration */
}

.brand_go>a{
	text-decoration: none;
	margin: 50px;
	font-size: 20px;
	color:#18A0FB;	
	
}

.brand_go{
	margin-top: 30px;
}

#main_search{
	width: 550px;
	margin: auto;
}

#search_bar{
	text-align: center;
	width: 350px;
	border-width: 2px;
}

#search_btn:hover{
	color: white;
}

/* cu페이지 css시작 */
#logo_cu{
	width: 400px;
	height: 200px;
}

</style>


</head>
<body>
	<%@ include file="../jsp/sidebar.jsp" %>
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img
				src="../img/logo_pyeoni.png">Pyeoni</a>
		 	<!--토글러 -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#">CU</a></li>
					<li class="nav-item"><a class="nav-link" href="#">GS25</a></li>
					<li class="nav-item"><a class="nav-link" href="#">SEVEN-ELEVEN</a></li>
					<li class="nav-item"><a class="nav-link" href="#">ALL</a></li>
					<li class="nav-item"><a class="nav-link" href="#">관리자 페이지</a></li>
				</ul>
				<form action="#">
					<button class="btn btn-outline-warning" type="button" id="login_btn">login/register</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="content">
		<div class="col-md-6 offset-md-3 mt-2 mb-4" id="search">
		<!-- 애니메이션 적용 -->
		<div class="w3-container w3-center w3-animate-opacity">
			
			<img src="../img/logo_CU.png" id="logo_cu">
			
				<form class="d-flex" id="main_search">
					<div class="input-group">
						<input class="form-control" type="search" id="search_bar" name="search_bar" placeholder="찾으시는 상품을 입력하세요">
						<button class="btn btn-outline-warning" id="search_btn" type="submit" >검색</button>
					</div>
				</form>
			
		</div>
						
		</div>
	</div>
</body>
</html>