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
<style>

/* #productInfo:hover {
  background-color: rgba(117, 20, 133, 0.3);
} */
.selectall {
	text-align: center;
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
<script>
	
</script>
</head>
<body>
	<%-- 	<%
	ProductServices ps = new ProductServices();
	List<ProductVO> plist = ps.selectAllProduct(1,20);
	request.setAttribute("plist", plist);
	%> --%>
	<div class="selectall">
		<c:forEach items="${productList}" var="p">

			<button data-bs-toggle="modal" data-bs-target="#exampleModal"
				data-bs-whatever="@mdo" data-pname="${p.productName}"
				data-ppro="${p.promotion}" data-pprice="${p.price}"
				data-pbrand="${p.brand}" data-pimg="${p.productImg }"
				class="productInfo ${p.brand == 'CU' ? 'btnCU' : 
                                      p.brand == 'GS25' ? 'btnGS25' :
                                      p.brand == 'SEVENELEVEN' ? 'btnSEVENELEVEN' :
                                      p.brand == 'MINISTOP' ? 'btnMINISTOP' :
                                      p.brand == 'C-SPACE' ? 'btnC-SPACE' : 'btnEMART24'}">
				<!-- CU, GS25, emart24, 7-ELEVEn, MINISTOP, cspace -->
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
							<td class="tg-8n49" rowspan="2"><img src="${p.productImg}"
								alt="Image"
								style="width: 100px; height: 100px; object-fit: contain;"></td>
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
			<hr class="hrselectall">
			<br>

		</c:forEach>
		<%@ include file="DetailModal.jsp"%>

	</div>
</body>

</html>