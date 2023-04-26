<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- 	현재 비번 다시 치도록 해서 옳으면 비번 수정할 수 있도록 한다.
	백으로 email 과 password를 보내서 update가 성공하면 비번이 바꼈다메세지가 뜨고
	끝.
	form을 버리고 ajax로 버튼 기능을 만들자
	input에 id를 주고 ajax로 정보를 보낸다.	
	
	 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#delmember {
	background-color: red;
	border-color: red;
	color: white;
	font-weight: bold;
}

#delmember:hover {
	background-color: white;
	color: red;
	font-weight: bold;
}

.mypage_head {
	font-size: 20px;
	font-weight: bold;
}

#passwordcheck {
	margin-top: 8px;
	background-color: white;
	border-color: black;
	color: black;
	font-weight: bold;
	background-color: white;
}

#passwordcheck:hover {
	background-color: black;
	color: white;
	font-weight: bold;
}

#passwordchange {
	margin-top: 8px;
	background-color: white;
	border-color: black;
	color: black;
	font-weight: bold;
}

#passwordchange:hover {
	background-color: black;
	color: white;
	font-weight: bold;
}

.mypagepass_btn {
	text-align: right;
}

#mypage_delbtn {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="modal fade" id="myPageModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Mypage</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">

					<table>
						<tr class="form-floating">
							<td><label class="mypage_head">비밀번호 확인</label></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input id="emailinput" type="email" name="email"
								maxlength="20" value="${loginUser.email}" disabled="disabled"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input id="passwordinput" type="password"
								name="password" required="required"></td>
						</tr>
						<tr class="mypagepass_btn">
							<td colspan="2"><button class="btn" id="passwordcheck">비밀번호
									확인</button></td>
						</tr>
					</table>

					<hr>

					<table>
						<tr class="form-floating">
							<td><label class="mypage_head">비밀번호 변경</label></td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input id="passwordinput" type="password"
								name="password" required="required"></td>
						</tr>
						<tr>
							<td>새 비밀번호 확인</td>
							<td><input id="passwordinput" type="password"
								name="password" required="required"></td>
						</tr>

						<tr class="mypagepass_btn">
							<td colspan="2"><button class="btn" id="passwordchange">비밀번호
									변경</button></td>
						</tr>
					</table>

					<hr>
					<label class="mypage_head">회원탈퇴</label>

					<div id="mypage_delbtn">
						<button class="btn" id="delmember">회원 탈퇴</button>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(function() {

		$('#delmember').on('click', deletemember);
		function deletemember() {
			var email = $('#emailinput').val();
			var password = $('#passwordinput').val();
			$.ajax({

				method : 'POST',
				url : '/pyeoni/memeber/memberSignout.view',
				data : {
					"email" : email,
					"password" : password
				},
				success : function(responseData) {
					if (responseData == "true")
						alert("회원 탈퇴 완료");
					else
						console.log("실패");
				},
				error : function() { // 괄호 추가

				}
			});
			$.ajax({
				method : 'POST',
				url : '/pyeoni/auth/logout.view',
				data : {
					"email" : email,
					"password" : password
				},
				success : function(responseData) {
					alert("로그아웃 성공");
					window.location.href = "../page/main.view";
				},
				error : function() { // 괄호 추가
				}
			});

		}

		$('#passwordchange').on('click', changepassword);
		function changepassword() {
			var email = $('#emailinput').val();
			var password = $('#passwordinput').val();
			$.ajax({

				method : 'POST',
				url : '/pyeoni/memeber/memberDetail.view',
				data : {
					"email" : email,
					"password" : password
				},
				success : function(responseData) {
					if (responseData == "true")
						alert("비밀번호 변경 완료");
				},
				error : function() { // 괄호 추가

				}
			});
		}

		function vertifypassword() {

		}

	});
</script>
</html>