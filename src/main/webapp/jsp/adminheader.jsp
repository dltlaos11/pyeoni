
<!-- 관리자 페이지 헤더 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="../common/commonfiles.jsp"%>

<style>
.w3-animate-opacity {
  animation-duration: 5s; /* change to the desired duration */
}
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

.d-flex {
	padding-right: 50px;
}

li a:hover {
	background-color: orange;
	color: white;
}

button.btn.btn-outline-warning {
	color: orange;
	border-color: orange;
	border-width: 2px;
	font-weight: bold;
}
</style>


</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img
				src="../img/logo_pyeoni.png">Pyeoni</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">


			</div>
		</div>
	</nav>


</body>
</html>