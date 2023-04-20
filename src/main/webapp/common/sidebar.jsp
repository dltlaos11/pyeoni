<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" href="../css/sidebar.css">
<script>
/* 	$(function() {
		// 문서 객체 모델이 로드된 후 실행될 코드

		// 현재 URL의 주소를 가져오기
		var currentUrl = window.location.href;

		// URL 주소가 cupage.jsp 인 경우
		if (currentUrl.indexOf("cupage.jsp") != -1) {
			// 이미지 요소를 가져와서 src 속성 값을 변경
			var logoImage = document.getElementById("pagelogo");
			logoImage.src = "../img/logo_cu.png";
		}
	}); */
</script>
<style>
</style>
</head>
<body>
	<div class="nav" id="navbar">
		<nav class="nav__container">
			<div>
				<a href="#" class="nav__link nav__logo"> <i
					class="bx bxs-disc nav__icon"></i> <span class="nav__logo-name"><img
						id="pagelogo" src="../img/logo_pyeoni.png"
						style="height: 80px; width: 80px;"> <br> </span>
				</a>

				<div class="nav__list">
					<div class="nav__items">
						<h3 class="nav__subtitle">SideBar</h3>

						<a style="text-decoration: none" href="../page/mainpage.jsp"
							class="nav__link"> <i class="bx bx-home nav__icon"></i> <span
							class="nav__name">Home</span>
						</a>

						<div class="nav__dropdown">
							<a href="#" class="nav__link"> <i
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
									<a href="../page/cupage.jsp" class="nav__dropdown-item">CU</a>
									<a href="#" class="nav__dropdown-item">GS25</a> <a href="#"
										class="nav__dropdown-item">SEVEN-ELEVEN</a> <a href="#"
										class="nav__dropdown-item">MINI-STOP</a> <a href="#"
										class="nav__dropdown-item">emart-24</a> <a href="#"
										class="nav__dropdown-item">C-SAPCE</a>
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<a href="#" class="nav__link nav__logout"> <i
				class="bx bx-log-out nav__icon"></i> <span class="nav__name">Log
					Out</span>
			</a>
		</nav>
	</div>

</body>
</html>