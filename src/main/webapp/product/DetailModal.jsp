<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
						<li class = "modalcomment">
							<div class="products">
								<div>
									<img id="cokeimg" src="../img/coke.png">
								</div>
								<div class="detail">
									<span><img id="cu_logo" src="../img/logo_CU.png"
										style="object-fit: contain; max-width: 100%; max-height: 100%;"></span><br>
									<div class="product">
										<span id  = "prodname"></span><br> 
										<span id  = "prodpromotion"></span><br> 
										<span id  = "prodprice"></span><br>
									</div>
								</div>
							</div>
						</li>
						<!-- 댓글 목록 -->
						<li class = "modalcomment">
							<div class="comments">
								<h3>댓글 목록</h3>
								<ul>
									<li class = "modalcomment">첫 번째 댓글입니다.</li>
									<li class = "modalcomment">두 번째 댓글입니다.</li>
									<li class = "modalcomment">세 번째 댓글입니다.</li>
									<li class = "modalcomment">세 번째 댓글입니다.</li>
									<li class = "modalcomment">세 번째 댓글입니다.</li>
									<li class = "modalcomment">세 번째 댓글입니다.</li>
									<li class = "modalcomment">세 번째 댓글입니다.</li>
									<li class = "modalcomment">세 번째 댓글입니다.</li>
									<li class = "modalcomment">세 번째 댓글입니다.</li>
									<li class = "modalcomment">세 번째 댓글입니다.</li>
									<li class = "modalcomment">세 번째 댓글입니다.</li>
								</ul>
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