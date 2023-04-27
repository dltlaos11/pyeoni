<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="selectall">
		<c:forEach items="${productList}" var="p">

			<button data-bs-target="#exampleModal" data-bs-whatever="@mdo"
				data-pname="${p.productName}" data-ppro="${p.promotion}"
				data-pprice="${p.price}" data-pbrand="${p.brand}"
				data-pimg="${p.productImg }"
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
							<td onclick="showModal(this)" class="prodshow tg-8n49" rowspan="2"><img src="${p.productImg}"
								alt="Image"
								style="width: 100px; height: 100px; object-fit: contain;"></td>
							<td onclick="showModal(this)" class="prodshow tg-7eit">${p.productName}<br></td>
							<td onclick="showModal(this)" class="prodshow tg-8n49" rowspan="2"></td>
							<td onclick="showModal(this)" class="prodshow tg-8n49">${p.price}원<br></td>			
							<td onclick="showModal(this)" class="prodshow tg-7eit" rowspan="2"><div class="right_area">
									<c:choose>
										<c:when test="${p.check == 1}">
											<span style="margin-left: 7px;" class="icon heart active"
												onclick="delbtn(this,'${p.productName}','${p.promotion}','${p.brand}','${p.price}')">
												<img
												src="https://cdn-icons-png.flaticon.com/512/803/803087.png"
												alt="찜하기 완료">
											</span>
										</c:when>
										<c:otherwise>
											<span style="margin-left: 7px;" class="icon heart"
												onclick="likebtn(this,'${p.productName}','${p.promotion}','${p.brand}','${p.price}')">
												<img
												src="https://cdn-icons-png.flaticon.com/512/812/812327.png"
												alt="찜하기">
											</span>
										</c:otherwise>
									</c:choose>
								</div> <br>
							<div class="likenum">${p.likenum }</div></td>
						</tr>
						<tr>
							<td onclick="showModal(this)" class="prodshow tg-7eit">${p.promotion}</td>
							<td onclick="showModal(this)" class="prodshow tg-7eit">${p.brand}</td>
						</tr>
					</thead>
				</table>
			</button>

			<br>
			<br>
			<hr class="hrselectall">
			<br>

		</c:forEach>
</div>