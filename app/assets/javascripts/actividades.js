$(document).ready(function(){
	$('#properli').click(function(){
		$('#tabpro').css("display", "none");
		$('#prodem').css("display", "none");
		$('#propos').css("display", "none");
		$('#proper').css("display", "block");
	});
	$('#tabproli').click(function(){
		$('#proper').css("display", "none");
		$('#prodem').css("display", "none");
		$('#propos').css("display", "none");
		$('#tabpro').css("display", "block");
	});
	$('#prodemli').click(function(){
		$('#proper').css("display", "none");
		$('#tabpro').css("display", "none");
		$('#propos').css("display", "none");
		$('#prodem').css("display", "block");
	});
	$('#proposli').click(function(){
		$('#proper').css("display", "none");
		$('#tabpro').css("display", "none");
		$('#prodem').css("display", "none");
		$('#propos').css("display", "block");
	});
});