// Tu nombre, apellidos y DNI


/*
1.3. Pedir tres notas de un alumno por el prompt.
(recuerda que para pedir un valor en el prompt se utiliza window.prompt).
*/

// Solicitar notas al usuario
let nota1 = parseFloat(window.prompt("Ingresa la primera nota:"));
let nota2 = parseFloat(window.prompt("Ingresa la segunda nota:"));
let nota3 = parseFloat(window.prompt("Ingresa la tercera nota:"));

// Calcular la media de las 3 notas
let media = (nota1 + nota2 + nota3) / 3;

/*
1.5. Chequea si está suspenso o aprobado
(nota media mayor o igual a 5).
*/

// Determinar si está aprobado o suspendido
let resultado = media >= 5 ? "Aprobado" : "Suspenso";

/*
1.6. Que se muestre en el html el resultado si es aprobado:
*/

// Mostrar el resultado en el HTML
document.body.innerHTML = "<h3>Resultado:</h3>" +
                           "<p>La nota final es: " + resultado + "</p>";

