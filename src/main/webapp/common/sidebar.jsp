<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PYEONI</title>

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
		var storename = "all";
		// URL 주소가 cupage.jsp 인 경우
		if (currentUrl.indexOf("cu") != -1) {
			storename = "cu";
			logoImage.src = "../img/logo_CU.png";
		} else if (currentUrl.indexOf("emart") != -1) {
			storename = "emart";
			logoImage.src = "../img/logo_emart24.png";
		} else if (currentUrl.indexOf("gs") != -1) {
			storename = "gs";
			logoImage.src = "../img/logo_GS.png";
		} else if (currentUrl.indexOf("mini") != -1) {
			storename = "mini";
			logoImage.src = "../img/logo_mini.png";
		} else if (currentUrl.indexOf("seven") != -1) {
			storename = "seven";
			logoImage.src = "../img/logo_seven3.png";
		} else if (currentUrl.indexOf("cspace") != -1) {
			storename = "cspace";
			logoImage.src = "../img/logo_cSpace.svg";
		} else {
			logoImage.src = "../img/logo_pyeoni.png";
			$("#imageId").css({
				"height" : "80px",
				"width" : "80px"
			});
		}

		var sideGo1 = document.getElementById("sidego1");
		var sideGo2 = document.getElementById("sidego2");
		var sideGo3 = document.getElementById("sidego3");
		var sideGo4 = document.getElementById("sidego4");
		var sideGo5 = document.getElementById("sidego5"); 
		var sideGo6 = document.getElementById("sidego6"); 
		var sideGo7 = document.getElementById("sidego7"); 
		var sideGo8 = document.getElementById("sidego8"); 

		var loc = "../page/" + storename + ".view?product_type=";
		var loc2 = "../page/" + storename + ".view?event_type="; 

		sideGo1.onclick = function() {
			location.href = loc + encodeURIComponent("음료");
		};
		sideGo2.onclick = function() {
			location.href = loc + encodeURIComponent("아이스크림");
		};
		sideGo3.onclick = function() {
			location.href = loc + encodeURIComponent("생활용품");
		};
		sideGo4.onclick = function() {
			location.href = loc + encodeURIComponent("식품");
		};
		sideGo5.onclick = function() {
			location.href = loc + encodeURIComponent("과자류");
		};
		sideGo6.onclick = function() {
			location.href = loc2 + encodeURIComponent("1+1");
		};
		sideGo7.onclick = function() {
			location.href = loc2 + encodeURIComponent("2+1");
		};
		sideGo8.onclick = function() {
			location.href = loc2 + encodeURIComponent("3+1");
		};

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
	<%@ include file="../common/MypageModal.jsp"%>
	<script>
	$(function (){
		
		$('#myPageModal').on('shown.bs.modal', function () {
			  $('#changepass').css('display', 'none'); // #targetElement의 color를 red로 변경
			  $('#mypage_delbtn').css('display', 'none'); // #targetElement의 color를 red로 변경
			})
			
			
		if(!${not empty sessionScope.loginUser}) {
    		$('#mypagediv').css('display','none');
		} else {
    		$('#mypagediv').css('display','block');
		}
	});
	
	</script>
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

						<a style="text-decoration: none" href="../page/main.view"
							class="nav__link"> <i class="bx bx-home nav__icon"></i> <span
							class="nav__name">Home</span>
						</a>

						<div id="mypagediv" class="nav__dropdown">
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
									<a href="../page/cu.view" class="nav__dropdown-item">CU</a> <a
										href="../page/gs.view" class="nav__dropdown-item">GS25</a> <a
										href="../page/seven.view" class="nav__dropdown-item">SEVEN-ELEVEN</a>
									<a href="../page/mini.view" class="nav__dropdown-item">MINI-STOP</a>
									<a href="../page/emart.view" class="nav__dropdown-item">emart-24</a>
									<a href="../page/cspace.view" class="nav__dropdown-item">C-SAPCE</a>
									<a href="../page/all.view" class="nav__dropdown-item">All</a>
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
									<button class="nav__dropdown-item side_btn" id="sidego6">1+1</button>
									<button class="nav__dropdown-item side_btn" id="sidego7">2+1</button>
									<button class="nav__dropdown-item side_btn" id="sidego8">3+1</button>
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
									<button class="nav__dropdown-item side_btn" id="sidego1">음료</button>
									<button class="nav__dropdown-item side_btn" id="sidego2">아이스크림</button>
									<button class="nav__dropdown-item side_btn" id="sidego3">생활용품</button>
									<button class="nav__dropdown-item side_btn" id="sidego4">식품</button>
									<button class="nav__dropdown-item side_btn" id="sidego5">과자류</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:if test="${sessionScope.loginUser==null}">
				<a href="../auth/login.view" class="nav__link nav__logout"> <i
					class="bx bx-log-out nav__icon"></i> <span class="nav__name">Login</span>
				</a>
			</c:if>
			<c:if test="${sessionScope.loginUser!=null}">
				<a href="../page/main.view" onclick="logout()"
					class="nav__link nav__logout"> <i
					class="bx bx-log-out nav__icon"></i> <span class="nav__name">Log
						Out</span>
				</a>
			</c:if>
		</nav>
	</div>

	<script>
		function logout() {
			$.ajax({
				url : "../auth/logout.view",
				success : function(responseData) {
					if (responseData == "OK") {
						alert("로그아웃되었습니다.");
					}
				},
				error : function(message) {
					alert("message");
				}
			});

		}
	</script>

</body>
</html>