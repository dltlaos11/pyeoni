<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('#exampleModal').on('show.bs.modal', function(event) {
			var prodname = $(event.relatedTarget).data('pname');
			console.log('안녕 '+prodname);
			var prodpromotion = $(event.relatedTarget).data('ppro');
			var prodprice = $(event.relatedTarget).data('pprice');
			var prodbrand = $(event.relatedTarget).data('pbrand');
			var imgurl = $(event.relatedTarget).data('pimg');

			$("#prodname").text(prodname);
			$("#prodpromotion").text(prodpromotion);
			$("#prodprice").text(prodprice + "원");
			$("#prodbrand").text(prodbrand);
			$("#modalimg").attr('src', imgurl);
			viewComment();
		});
	});
</script>