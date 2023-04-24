<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" href="../css/sidebar.css">
<script>
	$(function() {
		// 문서 객체 모델이 로드된 후 실행될 코드

		// 현재 URL의 주소를 가져오기
		var currentUrl = window.location.href;
		var logoImage = document.getElementById("pagelogo");

		// URL 주소가 cupage.jsp 인 경우
		if (currentUrl.indexOf("cupage") != -1) {
			logoImage.src = "../img/logo_CU.png";
		} else if (currentUrl.indexOf("Emartpage") != -1) {
			logoImage.src = "../img/logo_emart24.png";
		} else if (currentUrl.indexOf("GSpage") != -1) {
			logoImage.src = "../img/logo_GS.png";
		} else if (currentUrl.indexOf("Minipage") != -1) {
			logoImage.src = "../img/logo_mini.png";
		} else if (currentUrl.indexOf("Sevenpage") != -1) {
			logoImage.src = "../img/logo_seven3.png";
		} else if (currentUrl.indexOf("Cspacepage") != -1) {
			logoImage.src = "../img/logo_cSpace.svg";
		} else {
			logoImage.src = "../img/logo_pyeoni.png";
			imageSize = "80";
		}
		$(logoImage).css({
			"height" : imageSize + "px",
			"width" : imageSize + "px"
		});
	});
</script>
<style>
.logo-container {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 80px;
	height: 80px;
	overflow: hidden;
}

.logo-container img {
	max-width: 100%;
	max-height: 100%;
}
</style>
</head>
<body>
	<%@ include file="../page/MypageModal.jsp"%>

	<div class="nav" id="navbar">
		<nav class="nav__container">
			<div>
				<a href="#" class="nav__link nav__logo"> <i
					class="bx bxs-disc nav__icon"></i> <span
					class="nav__logo-name logo-container"> <img id="pagelogo"
						src="../img/logo_pyeoni.png">
				</span>
				</a>

				<div class="nav__list">
					<div class="nav__items">
						<h3 class="nav__subtitle">SideBar</h3>

						<a style="text-decoration: none" href="../page/mainpage.view"
							class="nav__link"> <i class="bx bx-home nav__icon"></i> <span
							class="nav__name">Home</span>
						</a>

						<div class="nav__dropdown">
							<a href="#" class="nav__link" data-bs-toggle="modal"
								data-bs-target="#myPageModal" data-bs-whatever="@mdo"> <i
								class="bx bx-user nav__icon"></i> <span class="nav__name">MyPage</span>
							</a>
						</div>

						<div class="nav__dropdown">
							<a href="#" class="nav__link"> <i
								class="bx bx-store nav__icon"></i> <span class="nav__name">Brand</span>
								<i class="bx bx-chevron-down nav__icon nav__dropdown-icon"></i>
							</a>

							<div class="nav__dropdown-collapse">
								<div class="nav__dropdown-content">
									<a href="../page/cupage.view" class="nav__dropdown-item">CU</a>
									<a href="../page/gspage.view" class="nav__dropdown-item">GS25</a>
									<a href="../page/sevenpage.view" class="nav__dropdown-item">SEVEN-ELEVEN</a>
									<a href="../page/minipage.view" class="nav__dropdown-item">MINI-STOP</a>
									<a href="../page/emartpage.view" class="nav__dropdown-item">emart-24</a>
									<a href="../page/cspacepage.view" class="nav__dropdown-item">C-SAPCE</a>
									<a href="../page/allpage.view" class="nav__dropdown-item">All</a>
								</div>
							</div>

						</div>

					</div>

					<div class="nav__items">
						<h3 class="nav__subtitle">Menu</h3>

						<div class="nav__dropdown">
							<a href="#" class="nav__link"> <i
								class="bx bx-bell nav__icon"></i> <span class="nav__name">Event</span>
								<i class="bx bx-chevron-down nav__icon nav__dropdown-icon"></i>
							</a>

							<div class="nav__dropdown-collapse">
								<div class="nav__dropdown-content">
									<button class="nav__dropdown-item side_btn">1+1</button>
									<button class="nav__dropdown-item side_btn">2+1</button>
									<button class="nav__dropdown-item side_btn">3+1</button>
								</div>
							</div>

						</div>

						<div class="nav__dropdown">
							<a href="#" class="nav__link"> <i
								class="bx bx-popsicle nav__icon"></i> <span class="nav__name">Product</span>
								<i class="bx bx-chevron-down nav__icon nav__dropdown-icon"></i>
							</a>

							<div class="nav__dropdown-collapse">
								<div class="nav__dropdown-content">
									<button class="nav__dropdown-item side_btn">음료</button>
									<button class="nav__dropdown-item side_btn">아이스크림</button>
									<button class="nav__dropdown-item side_btn">생활용품</button>
									<button class="nav__dropdown-item side_btn">식품</button>
									<button class="nav__dropdown-item side_btn">과자류</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:if test="${sessionScope.loginUser==null}">			
				<a href="../auth/loginpage.view" class="nav__link nav__logout"> <i class="bx bx-log-out nav__icon"></i> 
					<span class="nav__name">Login</span>
				</a>
			</c:if>
			<c:if test="${sessionScope.loginUser!=null}">
				<a href="../page/mainpage.view" onclick="logout()" class="nav__link nav__logout"> <i class="bx bx-log-out nav__icon"></i> 				
					<span class="nav__name">Log Out</span>
				</a>
			</c:if>
		</nav>
	</div>
	
	<script>
		function logout(){
			$.ajax({
				url:"../auth/logout.view",
				success:function(responseData){
					if(responseData=="OK"){
						alert("로그아웃되었습니다.");
					}					
				},
				error:function(message){
					alert("message");
				}
			});
			
		}
	
	</script>

</body>
</html>