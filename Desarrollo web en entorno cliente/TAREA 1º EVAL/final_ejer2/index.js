// Tu nombre, apellidos y DNI


/*
2.3. Que pida un número n por el prompt.
*/

// Solicitar un número al usuario
let numero = parseInt(window.prompt("Ingresa un número:"));

// Utilizando bucles que pinten por pantalla la estructura

for (x = numero; x > 0; x--) {
    for (j = x; j >= 1; j--)
        document.write(j);
document.write("</br>");
}


/*
Ejemplo de salida introduciendo el número 3:

321
21
1

Ejemplo de salida introduciendo el número 5:

54321
4321
321
21
1
*/

