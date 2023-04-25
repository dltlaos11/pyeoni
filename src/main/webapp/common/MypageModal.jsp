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
	margin: 0 auto;
	background-color: red;
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
					<!-- <form method="post" action="/memeber/memberDetail.view" class="mb-3"> -->
					<table>
						<tr class="form-floating">
							<td><label for="employee_id">회원정보 수정</label></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input id = "emailinput" type="email" name="email" maxlength="20"
								value="${loginUser.email }" disabled="disabled"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input id = "passwordinput" type="password" name="password"
								required="required"></td>
						</tr>

						<tr style="text-align: right;">
							<td colspan="2"><button id = "passwordchange">비밀번호 변경</button></td>
						</tr>
					</table>
					<!-- </form> -->
				</div>
				<!-- <form action="#"> -->
					<div class="modal-footer">
						<button type="button" id="delmember" class="btn btn-secondary"
							data-bs-dismiss="modal">회원탈퇴</button>
					</div>
			<!-- 	</form> -->
			</div>
		</div>
	</div>

</body>

<script>
$(function(){
	

	
	$('#delmember').on('click',deletemember);
	function deletemember(){
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
				if(responseData == "true")
					alert("회원 탈퇴 완료");
				else console.log("실패");
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
	
	
	$('#passwordchange').on('click',changepassword);
	function changepassword(){
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
				if(responseData == "true")
					alert("비밀번호 변경 완료");
			},
			error : function() { // 괄호 추가
				
			}
		});			
	}
	
	function vertifypassword(){
		
		
		
		
	}
	
	
});

</script>
</html>