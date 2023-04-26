<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	$(function() {
		var currentUrl = window.location.href;
		var eventChange = $(".change_event");

		if (currentUrl.indexOf("event_type=1") !== -1) {
			$('#allproduct').append("1+1");

		} else if (currentUrl.indexOf("event_type=2") !== -1) {
			$('#allproduct').append("2+1");

		} else if (currentUrl.indexOf("event_type=3") !== -1) {
			$('#allproduct').append("3+1");

		} else {
			$('#allproduct').append("전체");

		}

		if ($('#prodtype').val() == "음료") {
			$('#allproduct').append(" 음료 목록입니다.");

		} else if ($('#prodtype').val() == "아이스크림") {
			$('#allproduct').append(" 아이스크림 목록입니다.");

		} else if ($('#prodtype').val() == "생활용품") {
			$('#allproduct').append(" 생활용품 목록입니다.");

		} else if ($('#prodtype').val() == "식품") {
			$('#allproduct').append(" 식품 목록입니다.");

		} else if ($('#prodtype').val() == "과자류") {
			$('#allproduct').append(" 과자 목록입니다.");
		}
	});
</script>

<!-- 1+1, 2+1 텍스트 -->
<div class="change_event">
	<div id="allproduct">
		<i class='bx bxs-megaphone'></i><span></span>
	</div>

</div>