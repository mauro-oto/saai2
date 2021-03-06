var frutas = ["pear", "apple", "tomato", "raspberry", "grapefruit", "orange", "banana"];
var herramientas = ["screwdriver", "plier", "hammer", "nail", "screw"];
var deportes = ["futbol", "basketball", "hockey", "tennis", "skiing", "rafting", "kayaking", "running", "walking", "sailing", "skating"];
var animales = ["camel", "elephant", "bat", "dog", "bee", "bird", "cow", "gorilla", "goat", "lamb", "crab", "ant", "duck", "butterfly", "horse"];
var nombresListas = ["frutas", "herramientas", "deportes", "animales"];
var listas = [frutas, herramientas, deportes, animales];
var validado = true;
var puntos = 0;
var numeroFilaActual = 1;
var letrasUsadas = [];
var letraActual;
var letras = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];

//Elige una letra que no se haya usado y la agrega a una fila nueva.
function proximaLetra(){
	var letra;
	do{
		letra = letras[Math.floor(Math.random()*26)];
	}while(letraUsada(letra));
	return letra;
}

//Verifica si la letra del parámetro fue usada antes, en caso que sí devuelve true, sino false.
function letraUsada(letra){
	for(var i = 0; i < letrasUsadas.length; i++){
		if(letra === letrasUsadas[i]){
			return true;
		}
	}
	return false;
}

function agregarFila(letra){
	var $fila = $("<tr></tr>");
	$fila.append("<td>" + letra + "</td>");
	for(var i = 0; i < listas.length; i++){
		$fila.append("<td><input type='text' class='fila fila" + numeroFilaActual + "' id='celda" + numeroFilaActual + i + "'></input></td>");
	}
	$fila.append("<td><input type='submit' class='btnlisto' value='Listo'></input></td>");
	$('tbody').append($fila);
	//Para sacar duplicados:
	$("tbody:nth-child("+(numeroFilaActual+1)+")").remove();
}

function crearHeaders(){
	var td;
	for(var i = 0; i < nombresListas.length; i++){
		th = "<th>" + nombresListas[i] + "</th>";
		$('#headers').append(th);
	}
}

//Busca palabras con determinada letra inicial y el índice de la lista.
function buscarPalabrasCon(letra, indice){
	var palabras = [];
	var j = 0;
	for(var i = 0; i < listas[indice].length; i++){
		if(listas[indice][i].substring(0,1).toUpperCase() === letra.toUpperCase()){
			palabras[j] = listas[indice][i];
			j++;
		}
	}
	return palabras;
}

function validar(){
	var listaPalabras;
	var palabra;
	var $celda;
	var encontrado;
	for(var i = 0; i < listas.length; i++){
		$celda = $('#celda' + numeroFilaActual + i);
		palabra = $celda.val();
		if(palabra.substring(0,1).toUpperCase() === letraActual){
			listaPalabras = buscarPalabrasCon(letraActual, i);
			encontrado = false;
			for(var j = 0; j < listaPalabras.length && !encontrado; j++){
				if(listaPalabras[j] === palabra){
					$celda.css("background-color","green");
					puntos += 5;
					encontrado = true;
				}
			}
			if(!encontrado && listaPalabras.length > 0){
				$celda.css("background-color","orange");
			}
			else if(listaPalabras.length === 0){
				$celda.css("background-color","yellow");
			}
		}
		else{
			$celda.css("background-color","red");
		}
	}
}

function borrarError(){
	$('#errores').empty();
}

function error(texto){
	borrarError();
	$('#errores').append("<p>" + texto + "</p>");
}

function actualizarPuntaje(){
	$('#puntos').empty();
	$('#puntos').append("Puntos: " + puntos);
	$('#puntos_hidden').val(puntos);
}

$(document).ready(function(){
	crearHeaders();
	$('#filaNueva').click(function(){
		if(validado){
			letraActual = proximaLetra().toUpperCase();
			agregarFila(letraActual);
			letrasUsadas.push(letraActual);
			validado = false;
		}
		else{
			error("Apretar botón 'Listo'!");
		}
    });
    
});
//Si se apreta la tecla enter.
$(document).on('keypress', 'input', function(e){
    if(e.which == 13) {
        validar();
    }
});
$(document).on("click", '.btnlisto' ,function(){
    validar();
    actualizarPuntaje();
    validado = true;
    numeroFilaActual++;
    $('.btnlisto').remove();
    borrarError();
 });
