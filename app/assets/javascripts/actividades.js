var loadPartial=function(name){
	var xmlhttp;
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("partial").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", name + ".html.erb",true);
	xmlhttp.send();
}

var hello = function(){
	confirm("Hello");
};

var hidePartials = function(){
	document.getElementById("proper").style.visibility = "hidden";
	// document.getElementById("prodem").style.visibility = "hidden";
	// document.getElementById("propos").style.visibility = "hidden";
	// document.getElementById("tabpro").style.visibility = "hidden";
	// document.getElementById("quiz").style.visibility = "hidden";
}

window.onload=function(){
	hidePartials();
};

var loadPartials = function(pagina){
	hidePartials();
	document.getElementById(pagina).style.visibility = "visible";
};