<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
img.scape_hidden { display: none; }
img.scape_visible { display: block; }
</style>
<script type="text/javascript">
$(document).ready(function() {
	var handle;
	function viewSlide() {
		var slider = $("#slider");
		slider.find("img.scape_visible").removeClass("scape_visible");
        slider.find("img:first").appendTo(slider).addClass("scape_visible");
        }
	
	$("#slideStart").click(function() {
		handle = setInterval(viewSlide, 2000);
	});
	$("#slideStop").click(function() {
		clearInterval(handle);
	});	
	viewSlide();
});
</script>
</head>
<body>
<form action="template.jsp" method="post">
<br><br>
<div style="text-align:center" align="center"> <br>
	<div id="slider" align="center">
		<img class="scape_hidden" src="img/1.jpg"/>
		<img class="scape_hidden" src="img/2.jpg"/>
		<img class="scape_hidden" src="img/3.jpg"/>
	</div><br>
	 <button type="button" class="btn btn-outline-light btn-sm" button id="slideStart">Slide Show!</button>
	 <button type="button" class="btn btn-outline-light btn-sm" button id="slideStop">Stop Slide Show!</button>
</div> 
<br><br>
</form>
</body>
</html>