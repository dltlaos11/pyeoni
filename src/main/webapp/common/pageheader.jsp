<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="../page/mainpage.jsp"><img
			src="../img/logo_pyeoni.png">Pyeoni</a>
		<!--토글러 -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link"
					href="../page/cupage.jsp">CU</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../page/GSpage.jsp">GS25</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../page/Sevenpage.jsp">SEVENELEVEN</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../page/Minipage.jsp">MINISTOP</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../page/Emartpage.jsp">emart24</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../page/Cspacepage.jsp">CSPACE</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../page/Allpage.jsp">ALL</a></li>
				<!-- Session에서 관리자인지 확인하기 -->
				<c:if test="${sessionScope.loginUser.email=='admin@admin.com'}">
                  <li class="nav-item">
                     <a class="nav-link" href="#">관리자 페이지</a>
                  </li>
               </c:if>
			</ul>
			<!-- 로그인한 사용자는 login/register 버튼 안뜨게 -->
			<c:if test="${sessionScope.loginUser==null }">
	            <form action="../auth/loginpage.jsp">
	               <button class="btn" type="submit" id="login_btn">login/register</button>
	            </form>
            </c:if>
            
            <c:if test="${sessionScope.loginUser!=null }">
	            <form action="../auth/loginpage.jsp">
	               <button class="btn" type="submit" id="logout_btn">Logout</button>
	            </form>
            </c:if>
		</div>
	</div>
</nav>