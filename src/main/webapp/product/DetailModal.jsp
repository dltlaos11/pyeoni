<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 미완성 코드 -->


<style>
.products {
	display: flex;
	flex-direction: row;
	align-items: center;
	gap: 20px;
}

.detail {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
	flex: 1;
	text-align: left;
	font-size: 1.5rem;
}

.comments {
	margin-top: 20px;
}

.modalcomment {
	list-style: none;
}

.products img {
	width: 150px;
	height: 150px;
	object-fit: cover;
}

#cokeimg {
	width: 150px;
	height: 300px;
}
</style>
<script>
	$(function() {

		$('#btnaddcomment').on('click', addComment);

		function addComment() {
			var comment = $('#textComment').val();
			var prodname = $('#prodname').val();
			var prodpromotion = $('#prodpromotion').val();
			var prodprice = $('#prodprice').val();
			var prodbrand = $('#prodbrand img').attr('alt');
			$.ajax({
				method : 'POST',
				url : '/pyeoni/auth/...........',//댓글컨트롤러
				//url : "/auth/login.view",
				data : {
					"comment" : comment,
					"productname" : prodname,
					"promotion" :prodpromotion,
					"price" :prodprice,
					"brand" : prodbrand
				},
				success : function(responseData) {
					//console.log(responseData);
					if (responseData == "OK") {
						//댓글 추가 성공
						//댓글 refresh
					}
				},
				error : function() { // 괄호 추가
					alert("실패");
				}
			});
		}
		
		
		function viewComment() {//모달이 열리면 실행되어야함
			var comment = $('#textComment').val();
			var prodname = $('#prodname').val();
			var prodpromotion = $('#prodpromotion').val();
			var prodprice = $('#prodprice').val();
			var prodbrand = $('#prodbrand img').attr('alt');
			$.ajax({
				method : 'GET',
				url : '/pyeoni/auth/...........',//댓글컨트롤러
				//url : "/auth/login.view",
				success : function(responseData) {
					//console.log(responseData);
					if (responseData == "OK") {
						//댓글 refresh
						//div commentsection에 쓰기
					}
				},
				error : function() { // 괄호 추가
					alert("실패");
				}
			});
		}
		

	});
</script>

</head>
<body>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">상품</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<ul>
						<li class="modalcomment">
							<div class="products">
								<div>
									<img id="cokeimg" src="../img/coke.png">
								</div>
								<div class="detail">
									<span id = "prodbrand"><img id="cu_logo" src="../img/logo_CU.png"
										style="object-fit: contain; max-width: 100%; max-height: 100%;"></span><br>
									<div class="product">
										<span id="prodname"></span><br> <span id="prodpromotion"></span><br>
										<span id="prodprice"></span><br>
									</div>
								</div>
							</div>
						</li>
						<!-- 댓글 목록 -->
						<li class="modalcomment">
							<hr>
							<div id="commentsection">댓글</div>
							<hr>
							<div class="card mb-2">
								<textarea id="textComment" rows="3"></textarea>
								<button type="button" class="btn btn-dark mt-3"
									id="btnaddcomment">댓글 작성</button>
							</div>
						</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>

</html>