
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>
<script type="text/javascript">

	function er(){
		console.log('야야야야');
	}
	
	$(function() {
		
		$.ajax({
			url : 'commentlist.do',
			success : function(responseData) {
				var datas = JSON.parse(responseData);
				var commentList = datas.commentList;
				
				$.each(commentList,function(index,comment) {
					console.log("commentid is")
					console.log(comment['commentId']);
					var commentid = comment['commentId'];
					console.log(commentid);
					
					commentHTML = `
						<tr>
							<th scope="row">${"${index+1}"}</th>
							<td>${"${comment['commentId']}"}</td>
							<td><button onclick="er()" class="Comment">${"${comment['content']}"}</button></td>
							<td>${"${comment['email']}"}</td>
							<td>${"${comment['commentDate']}"}</td>
						</tr>
					`;
					
					$('tbody').append(commentHTML);
				});
			},
			error : function(xhr, status, error) {
				console.log(xhr.responseText);
				console.log(status);
				console.log(error);
				alert('오류가 발생했습니다!');
			}
		});
		
		
		
	});
</script>
</head>
<body>
	<div>
		<h1>전체 댓글 관리</h1>

		<table class="table table-dark">
			<thead>
				<tr>
					<th scope="col">순번</th>
					<th scope="col">댓글 번호</th>
					<th scope="col">내용</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
</html>