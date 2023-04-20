<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.pyeoni.vo.MemberVO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.MemberValuePair"%>
<%@page import="com.pyeoni.model.MemberServices"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 
https://inpa.tistory.com/entry/CSS-%F0%9F%92%8D-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85-%ED%8E%98%EC%9D%B4%EC%A7%80-%EC%8A%A4%ED%83%80%EC%9D%BC-%F0%9F%96%8C%EF%B8%8F-%EB%AA%A8%EC%9D%8C#%EB%A1%9C%EA%B7%B8%EC%9D%B8_/_%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85_%ED%8E%98%EC%9D%B4%EC%A7%80

 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="../common/commonfiles.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/login.css">

<style>

.navbar-brand>img {
  height: 80px;
  width: auto;
  max-width: 100%;
}
</style>
</head>
<%
/* MemberServices ms  = new MemberServices();
MemberVO mv = new MemberVO();
List<MemberVO> mlist= new ArrayList<>();
mlist = mv.selectAllMembers();
Map<String, MemberVO> emailMap = new HashMap <String, MemberVO>();
Map<String, MemberVO> usernameMap = new HashMap <String, MemberVO>();

for (MemberVO member : mlist) {
	emailMap.put(member.getEmail(), member);
	}
for (MemberVO member : mlist) {
	usernameMap.put(member.getUserName(), member);
	}
 */

/* if (map.containsKey("key1")) */
%>
<body>
	<a href="#" class = "navbar-brand"><img src="../img/logo_pyeoni.png" alt="Pyeoni">Pyeoni</a>
	
	<div id="container" class="container">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
					<div class="form sign-up">
						<div class="input-group">
							<i class='bx bxs-user'></i> <input id = "usernametext" type="text"
								placeholder="Username">
						</div>
						<div class="input-group">
							<i class='bx bx-mail-send'></i> <input type="email"
								placeholder="Email">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								placeholder="Password">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								placeholder="Confirm password">
						</div>
						<button>Sign up</button>
						<p>
							<span> Already have an account? </span> <b onclick="toggle()"
								class="pointer"> Sign in here </b>
						</p>
					</div>
				</div>

			</div>
			<!-- END SIGN UP -->
			<!-- SIGN IN -->
			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
					<div class="form sign-in">
						<div class="input-group">
							<i class='bx bxs-user'></i> <input type="text"
								placeholder="Username">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								placeholder="Password">
						</div>
						<button>Sign in</button>
						<p>
							<span> Don't have an account? </span> <b onclick="toggle()"
								class="pointer"> Sign up here </b>
						</p>
					</div>
				</div>
				<div class="form-wrapper"></div>
			</div>
			<!-- END SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>Welcome</h2>

				</div>
				<div class="img sign-in"></div>
			</div>
			<!-- END SIGN IN CONTENT -->
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up"></div>
				<div style="padding-left: 10em;" class="text sign-up">
					<h2 style="padding-left: 4em;">Register</h2>


				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
	</div>
</body>
<script>
let container = document.getElementById('container')
toggle = () => {
  container.classList.toggle('sign-in')
  container.classList.toggle('sign-up')
}
setTimeout(() => {
  container.classList.add('sign-in')
}, 200)

/*  $("#usernametext").on("focus", function() {
  $(this).attr("placeholder", $(this).data("placeholder"));
});

$("#usernametext").on("input", function() {
  var inputVal = $(this).val();
  if (usernameMap[inputVal]) {
    $(this).attr("placeholder", "사용 불가");
    $(this).focus();
  } else {
    $(this).attr("placeholder", $(this).data("placeholder"));
  }
});  */
</script>
</html>