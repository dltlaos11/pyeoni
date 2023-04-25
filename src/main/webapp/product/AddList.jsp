<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="selectall">
	<c:forEach items="${productList}" var="p">

			<button data-bs-toggle="modal" data-bs-target="#exampleModal"
			data-bs-whatever="@mdo" data-pname="${p.productName}"
			data-ppro="${p.promotion}" data-pprice="${p.price}"
			data-pbrand="${p.brand}"
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
						<td class="tg-8n49" rowspan="2"><img
							src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 496 512'%3e%3cpath fill='%23000000' d='M368.5 363.9l28.8-13.9c11.1 22.9 26 43.2 44.1 60.9 34-42.5 54.5-96.3 54.5-154.9 0-58.5-20.4-112.2-54.2-154.6-17.8 17.3-32.6 37.1-43.6 59.5l-28.7-14.1c12.8-26 30-49 50.8-69C375.6 34.7 315 8 248 8 181.1 8 120.5 34.6 75.9 77.7c20.7 19.9 37.9 42.9 50.7 68.8l-28.7 14.1c-11-22.3-25.7-42.1-43.5-59.4C20.4 143.7 0 197.4 0 256c0 58.6 20.4 112.3 54.4 154.7 18.2-17.7 33.2-38 44.3-61l28.8 13.9c-12.9 26.7-30.3 50.3-51.5 70.7 44.5 43.1 105.1 69.7 172 69.7 66.8 0 127.3-26.5 171.9-69.5-21.1-20.4-38.5-43.9-51.4-70.6zm-228.3-32l-30.5-9.8c14.9-46.4 12.7-93.8-.6-134l30.4-10c15 45.6 18 99.9.7 153.8zm216.3-153.4l30.4 10c-13.2 40.1-15.5 87.5-.6 134l-30.5 9.8c-17.3-54-14.3-108.3.7-153.8z'/%3e%3c/svg%3e"
							alt="Image" width="100" height="100"></td>
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