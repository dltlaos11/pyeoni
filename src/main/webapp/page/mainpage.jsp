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

.nav-link:hover {
   background-color: #F69320;
   color: white;
   border-radius: 10px;
}

a.nav-link {
   color: #18A0FB;
   font-size: 20px;
}

.nav-item {
   padding-left: 50px;
}

#main_title {
   font-size: 80px;
   font-weight: bold;
   text-align: center;
   color: orange;
}

#login_btn {
   margin-right: 50px;
   background-color: white;
   border-color: #F69320;
   color: #F69320;
   font-weight: bold;
}

#login_btn:hover {
   background-color: #F69320;
   color: white;
   font-weight: bold;
}

.content {
   text-align: center;
   margin-top: 200px;
}

#main_title {
   text-shadow: 4px 2px 2px gray;
}

#cu_img {
   width: 50px;
   height: 50px;
}

#gs_img {
   width: 50px;
   height: 50px;
   margin-left: 20px;
   margin-bottom: 10px;
}

#seven_img {
   width: 50px;
   height: 50px;
   margin-bottom: 10px;
}

/* 애니메이션 */
.w3-animate-opacity {
   animation-duration: 5s; /* change to the desired duration */
}

.brand_go>a {
   text-decoration: none;
   margin: 50px;
   font-size: 20px;
   color: #18A0FB;
}

.brand_go {
   margin-top: 30px;
}

#main_search {
   width: 550px;
   margin: auto;
}

#search_bar {
   text-align: center;
   width: 350px;
   border-width: 2px;
}

#search_btn{
   color: #F69320;
   border-color: #F69320;
   border-width: 2px;
   font-weight: bold;
}

#search_btn:hover {
   background-color:#F69320;
   color: white;
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
               <li class="nav-item"><a class="nav-link" href="#">MINI-STOP</a></li>
               <li class="nav-item"><a class="nav-link" href="#">emart-24</a></li>
               <li class="nav-item"><a class="nav-link" href="#">C-SAPCE</a></li>
               <li class="nav-item"><a class="nav-link" href="#">ALL</a></li>
               <!-- Session에서 관리자인지 확인하기 -->
               <c:if test="${sessionScope.userLoggedIn == true}">
                  <li class="nav-item">
                     <a class="nav-link" href="#">관리자 페이지</a>
                  </li>
               </c:if>
            </ul>
            <form action="#">
               <button class="btn" type="button" id="login_btn">login/register</button>
            </form>
         </div>
      </div>
   </nav>

   <div class="content">
      <div class="col-md-6 offset-md-3 mt-2 mb-4" id="search">
         <!-- 애니메이션 적용 -->
         <div class="w3-container w3-center w3-animate-opacity">
            <p id="main_title">PYEONI</p>

            <form class="d-flex" id="main_search">
               <div class="input-group">
                  <input class="form-control" type="search" id="search_bar" name="search_bar" placeholder="찾으시는 상품을 입력하세요">
                  <button class="btn" id="search_btn" type="submit">검색</button>
               </div>
            </form>

         </div>
      </div>   
   </div>
   
   <footer>
         <hr>
         <nav>
            <a href="https://www.naver.com/">Naver</a> | <a
               href="https://github.com/Jennorresothie/pyeoni">Github</a>
         </nav>
         <p>
            <span>제작자 : 맨앞줄조</span> <br> <span>이메일 : 1111@naver.com</span>
            <br> <span>Copyright 2023. All Rights Reserved.</span>
         </p>
   </footer>
   
   
</body>
</html>