var contador = 0;
var elemArrastrableId = "";

var contadorRojo = 0;
var contadorMorado = 0;

// Evento D&D
function start(e) {
    console.log("start");
    e.dataTransfer.effectAllowed = "move"; // Efecto mover, permite arrastrar el cuadro

    //Guardar en memoria el elemento a mover
    e.dataTransfer.setData("Data", e.target.id);    //Data : arrastrable1

    // Se recibe en SetData el cuadrito pasado por medio de target.id
    $("#" + e.target.id).css("opacity", "0.4");     // Opacidad cuando se esta arrastrando

    elemArrastrableId = e.target.id;    // Se pasa el objeto cuadradito a la variable elemArrastrableId // arrastrable1
}

function enter(e) {
    console.log("enter");
    e.target.style.border = "12px dotted #555";
}

function leave(e) {
    console.log("leave");
    //e.target.style.border = ""
    $("#" + e.target.id).css("border", "");
}

function over(e) {
    console.log("over");
    var id = e.target.id;   // cuadro 3
    if ((id == "cuadro2") || (id == "cuadro3") || (id == "papelera")) {
        return false;   // te deja soltar las cosas;
    }
    else {
        return true;    // NO te deja soltar las cosas
    }
}

function end(e) {
    console.log("end");
    e.target.style.opacity = '';
    e.dataTransfer.clearData("Data");
    elemArrastrableId = "";
}

function drop(e) {
    console.log("drop");
    var elementoArrastrado = e.dataTransfer.getData("Data");
    e.target.appendChild(document.getElementById(elementoArrastrado));
    e.target.style.border = "";
}

function eliminar(e) {
    console.log("eliminar");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
    elementoArrastrado.parentNode.removeChild(elementoArrastrado);
    e.target.style.border = "";
}

function clonar(e) {
    console.log("clonar");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
    elementoArrastrado.style.opacity = "";

    if (contadorRojo < 3) {
        var elementoClonado = elementoArrastrado.cloneNode(true);
        elementoClonado.id = "ElementoClonado" + contador;
        contador++;
        elementoClonado.style.position = "static";
        e.target.appendChild(elementoClonado);
    }

    e.target.style.border = "";
}