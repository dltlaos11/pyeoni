<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 관리 페이지</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#comment-div {
	position: fixed;
	width: 600px;
	transform: translate(-50%, -30%);
}
</style>
<script type="text/javascript">
	function life(event) {
		let mememail = $(event).attr('data-memEmail');
		const choies = $(event).text();
		/* const button = event.target;
		 */
		console.log(mememail+' '+choies);

		var result = confirm("정말 "+choies+"하시겠습니까?");
		var coin = choies==="복구"?0:1;
			
		if (result) {
			// 삭제를 진행하는 로직
			$.ajax({
				url : 'controlllife.do',
				data : {
					"coin" : coin,
					"Email" : mememail
				},
				success : function(responseData) {
					// 삭제가 성공했을 때 commentlist.do로 리다이렉트합니다.
					$("#here").html(responseData);

				},
				error : function(xhr, status, error) {
					console.log(xhr.responseText);
					console.log(status);
					console.log(error);
					alert('오류가 발생했습니다!');
				}

			});
			alert(choies+"되었습니다.");
		} else {
			alert(choies+"가 취소되었습니다.");
		} 
	}
</script>
</head>
<body>
	<div style="text-align: center" id="comment-div">
		<h1>회원 정보 관리</h1>
		<br>

		<table class="table">
			<thead>
				<tr class="table-dark">
					<th>순번</th>
					<th>회원 이메일</th>
					<th>회원 이름</th>
					<th>등급</th>
					<th>탈퇴 여부</th>
					<th>버튼</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${MemList}" var="mem" varStatus="status">
					<tr class="${mem.withDraw == 0? 'table-success' : 'table-danger'}"
						style="${mem.isAdmin == 1 ? 'font-weight: bold;' : ''} ">
						<td>${status.count}</td>
						<td>${mem.email}</td>
						<td>${mem.userName}</td>
						<td>${mem.isAdmin == 1 ? "관리자" : "일반 회원"}</td>
						<td>${mem.withDraw == 1 ? "탈퇴" : "가입"}</td>
						<td><button class="com_btn" onclick="life(this)" data-memEmail=${mem.email} >${mem.withDraw == 1 ? '복구' : '제명'}</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>