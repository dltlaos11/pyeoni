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

#login_btn{
   margin-right: 50px;
   background-color: white;
   border-color: purple;
   color: #751485;
   font-weight: bold;
}

#login_btn:hover{
   background-color: #751485;
   color: white;
   font-weight: bold;
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

#search_btn{
   color: #751485;
   border-color: #751485;
   border-width: 2px;
   font-weight: bold;
}

#search_btn:hover{
   background-color:#751485;
   color: white;
   font-weight: bold;
}

/* cu페이지 css시작 */
#logo_cu{
   width: 360px;
   height: 190px;
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

/* ProductSelectAll */
/* #productInfo:hover {
  background-color: rgba(117, 20, 133, 0.3);
} */
.selectall {
   text-align: center
}

.hrselectall {
   width: 700px;
   margin: 0 auto;
}

.productInfo {
   background-color: white;
   border: white;
   margin: 0 auto;
}

.btnCU:hover {
   background-color: rgba(177, 70, 193, 0.3);
}

.btnGS25:hover {
   background-color: rgba(70, 176, 193, 0.3);
}

.btnSEVENELEVEN:hover {
   background-color: rgba(70, 193, 123, 0.3);
}

.btnMINISTOP:hover {
   background-color: rgba(193, 123, 70, 0.3);
}

.btnC-SPACE:hover {
   background-color: rgba(128, 128, 128, 0.3);
}

.btnEMART24:hover {
   background-color: rgba(255, 215, 0, 0.3);
}

</style>


</head>
<body>
   <%@ include file="../common/sidebar.jsp" %>
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
         
         <img src="../img/logo_CU.png" id="logo_cu">
         
            <form class="d-flex" id="main_search">
               <div class="input-group">
                  <input class="form-control" type="search" id="search_bar" name="search_bar" placeholder="찾으시는 상품을 입력하세요">
                  <button class="btn" id="search_btn" type="submit" >검색</button>
               </div>
            </form>            
         </div>            
      </div>
   </div>
   
   <!-- ProductSelectAll -->
   <div class="selectall">
   <%
   ProductServices ps = new ProductServices();
   List<ProductVO> plist = ps.selectAllProduct();
   request.setAttribute("plist", plist);
   %>

   <c:forEach items="${plist}" var="p">

      <button data-bs-toggle="modal" data-bs-target="#exampleModal"
         data-bs-whatever="@mdo" data-pname="${p.productName}" data-ppro="${p.promotion}" data-pprice = "${p.price}" data-pbrand="${p.brand}"
         class="productInfo ${p.brand == 'CU' ? 'btnCU' : 
                                      p.brand == 'GS25' ? 'btnGS25' :
                                      p.brand == 'SEVENELEVEN' ? 'btnSEVENELEVEN' :
                                      p.brand == 'MINISTOP' ? 'btnMINISTOP' :
                                      p.brand == 'C-SPACE' ? 'btnC-SPACE' : 'btnEMART24'}">
         <!--                                       CU, GS25, emart24, 7-ELEVEn, MINISTOP, cspace -->
         <table class="tg" style="table-layout: fixed; width: 625px">
            <colgroup>
               <col style="width: 144.333333px">
               <col style="width: 137.333333px">
               <col style="width: 56.333333px">
               <col style="width: 225.333333px">
               <col style="width: 61.333333px">
            </colgroup>
            <thead>
               <tr>
                  <td class="tg-8n49" rowspan="2"><img
                     src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 496 512'%3e%3cpath fill='%23000000' d='M368.5 363.9l28.8-13.9c11.1 22.9 26 43.2 44.1 60.9 34-42.5 54.5-96.3 54.5-154.9 0-58.5-20.4-112.2-54.2-154.6-17.8 17.3-32.6 37.1-43.6 59.5l-28.7-14.1c12.8-26 30-49 50.8-69C375.6 34.7 315 8 248 8 181.1 8 120.5 34.6 75.9 77.7c20.7 19.9 37.9 42.9 50.7 68.8l-28.7 14.1c-11-22.3-25.7-42.1-43.5-59.4C20.4 143.7 0 197.4 0 256c0 58.6 20.4 112.3 54.4 154.7 18.2-17.7 33.2-38 44.3-61l28.8 13.9c-12.9 26.7-30.3 50.3-51.5 70.7 44.5 43.1 105.1 69.7 172 69.7 66.8 0 127.3-26.5 171.9-69.5-21.1-20.4-38.5-43.9-51.4-70.6zm-228.3-32l-30.5-9.8c14.9-46.4 12.7-93.8-.6-134l30.4-10c15 45.6 18 99.9.7 153.8zm216.3-153.4l30.4 10c-13.2 40.1-15.5 87.5-.6 134l-30.5 9.8c-17.3-54-14.3-108.3.7-153.8z'/%3e%3c/svg%3e"
                     alt="Image" width="100" height="100"></td>
                  <td class="tg-7eit">${p.productName}<br></td>
                  <td class="tg-8n49">${p.price}원<br></td>
                  <td class="tg-8n49" rowspan="2"></td>
                  <td class="tg-7eit" rowspan="2"><img
                     src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'%3e%3cpath fill='%23000000' d='M462.3 62.6C407.5 15.9 326 24.3 275.7 76.2L256 96.5l-19.7-20.3C186.1 24.3 104.5 15.9 49.7 62.6c-62.8 53.6-66.1 149.8-9.9 207.9l193.5 199.8c12.5 12.9 32.8 12.9 45.3 0l193.5-199.8c56.3-58.1 53-154.3-9.8-207.9z'/%3e%3c/svg%3e"
                     alt="Image" width="50" height="50"><br>좋아요수</td>
               </tr>
               <tr>
                  <td class="tg-7eit">${p.promotion}</td>
                  <td class="tg-7eit">${p.brand}</td>
               </tr>
            </thead>
         </table>
      </button>
      <br>
      <br>
      <hr class = "hrselectall">
      <br>


   </c:forEach>
   <%@ include file="../product/DetailModal.jsp"%>
   <script>
      $(function() {
         $('#exampleModal').on('show.bs.modal', function(event) {
            var prodname = $(event.relatedTarget).data('pname');
            var prodpromotion = $(event.relatedTarget).data('ppro');
            var prodprice = $(event.relatedTarget).data('pprice');
            var prodbrand = $(event.relatedTarget).data('pbrand');
            $("#prodname").text(prodname);
            $("#prodpromotion").text(prodpromotion);
            $("#prodprice").text(prodprice + "원");
         });
      });
   </script>
   </div>
   
      
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