<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$("#updateStore").click(function() {
			$("#here").load("update.jsp");
		});
		$("#manageMember").click(function() {
			$("#here").load("manageMember.jsp");
		});
		$("#manageComments").click(function() {
			$("#here").load("manageComments.jsp");
		});

	});
	
</script>
<style>
body {
	z-index: 100;
	margin: 0 auto;
}

.adminbtn {
	display: inline-block;
	border: none;
	margin: 0;
	padding: 0;
	background-color: transparent;
	font-size: .75rem;
	font-weight: 500;
	color: #58555E;
	cursor: pointer;
	text-decoration: none;
	text-align : left;
}
.adminbtn:hover{
  color: #F69320;
}
.adminbtn:hover{
  color: #F69320;
}

</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" href="../css/adminsidebar.css">

</head>
<body>

	<div class="nav" id="navbar">
		<nav class="nav__container">
			<div>
				<a href="#" class="nav__link nav__logo"> <i
					class="bx bxs-disc nav__icon"></i> <span class="nav__logo-name"><img
						src="../img/logo_pyeoni.png" style="height: 80px; width: 80px;"><br>AdministerPage</span>
				</a>

				<div class="nav__list">
					<div class="nav__items">
						<h3 class="nav__subtitle">SideBar</h3>

						<a href="#" class="nav__link"> <i
							class="bx bx-home nav__icon"></i> <span class="nav__name">Home</span>
						</a>

						<!-- 	<div class="nav__dropdown">
							<a href="#" class="nav__link"> <i
								class="bx bx-user nav__icon"></i> <span class="nav__name">MyPage</span>
							</a>
						</div> -->




					</div>

					<div class="nav__items">
						<h3 class="nav__subtitle">Menu</h3>

						<div class="nav__dropdown">
							<a href="#" class="nav__link"> <i class="bx bx-cog nav__icon"></i>
								<span class="nav__name">Admin Dashboard</span> <i
								class="bx bx-chevron-down nav__icon nav__dropdown-icon"></i>
							</a>

							<div class="nav__dropdown-collapse">
								<div class="nav__dropdown-content">
									<button class="adminbtn" id="updateStore">업데이트</button>
									<button class="adminbtn" id="manageMember">회원 관리</button>
									<button class="adminbtn" id="manageComments">댓글 관리</button>
								</div>
							</div>

						</div>
				          <div class="nav__dropdown">
                                <a href="#" class="nav__link">
                                    <i class="bx bx-popsicle nav__icon" ></i>
                                    <span class="nav__name">Product</span>
                                    <i class="bx bx-chevron-down nav__icon nav__dropdown-icon"></i>
                                </a>

                                <div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="#" class="nav__dropdown-item">음료</a>
                                        <a href="#" class="nav__dropdown-item">아이스크림</a>
                                        <a href="#" class="nav__dropdown-item">생활용품</a>
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