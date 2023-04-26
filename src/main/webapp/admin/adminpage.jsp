<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<%@ include file="../common/commonfiles.jsp"%>
<style>
.w3-animate-opacity {
	animation-duration: 5s; /* change to the desired duration */
}

div.adminhome {
	font-weight: bold;
	font-size: 40px;
	position: absolute;
	left: 50%;
	color: #F69320;
	transform: translate(-50%, -50%);
}

 #here {
 top: 80%;
	position: absolute;
/* 	  left: 50%;
  transform: translateX(-50%); */
 	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
} 
</style>

</head>
<body>
	<%@ include file="adminsidebar.jsp"%>
<script>

$(document).ready(function(){
	  $("#updateStore").click(function(){
		  $("#here").load("updateProduct.view");
	  });
		$("#manageMember").click(function() {
			$("#here").load("manageMember.view");
		});
		$("#manageComments").click(function() {
			$("#here").load("manageComments.view");
		}); 
	});

</script>

	<div style="margin-left: 25%;">
		<div class="adminhome w3-animate-opacity">ADMINISTER PAGE</div>
	</div>
	<div class="w3-sidebar w3-bar-block" style="width: 20%;"></div>

	<div id="here" class="w3-container w3-center w3-animate-opacity">사이드바를
		통해 원하는 기능을 선택하세요</div>

</body>
</html>