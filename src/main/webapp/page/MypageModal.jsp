<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#delmember{
		margin: 0 auto;
		background-color: red;
	}
</style>
</head>
<body>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Mypage</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				
				<div class="modal-body">
					<form method="post" action="" class="mb-3">
						<table>
							<tr class="form-floating">
								<td><label for="employee_id">회원정보 수정</label></td>							
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="email" name="email" maxlength="20"></td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td><input type="password" name="password" required="required"></td>
							</tr>
							
							<tr style="text-align: right;">
								<td colspan="2"><input type="submit" value="수정"></td>
							</tr>
						</table>
					</form>

				</div>
				<form action="#">
					<div class="modal-footer">
						<button type="button" id="delmember" class="btn btn-secondary"
							data-bs-dismiss="modal">회원탈퇴</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>