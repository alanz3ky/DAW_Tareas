# UD6 - Tarea1
Queremos hacer una aplicación en JavaScript que simule un pequeño tablero de dibujo. Para ello tendrás que dibujar una tablero de 30 celdas x 30 celdas con cada celda de ancho 10 px y alto 10 px. Para realizar el tablero de dibujo tendrás que emplear obligatoriamente los métodos de creación de nodos del DOM. Una vez generado el tablero lo meterás dentro del div con id "zonadibujo". Además tendrás una paleta con 5 colores de dibujo (que ya está creada y se facilita con el código .html)

Se te facilitará un fichero .html y un fichero .css con los estilos que tendrás que utilizar. La programación de la aplicación JavaScript la tendrás que realizar en un fichero .js adicional.

Si se modifican los colores programados en los estilos CSS (color1 a color 6) la aplicación tendrá que seguir funcionando correctamente.

La forma de funcionamiento de la aplicación será la siguiente:

1. Haremos click en alguno de los 5 colores de la paleta y se le asignará la clase "seleccionado".
2. Una vez seleccionado un color de la paleta, haremos un click en una celda (que se pintará del color activo en la paleta) y desde ese momento al mover el ratón por el tablero pintará del color activo todas las celdas por las que vayamos pasando el ratón. En el momento que volvamos a hacer click en otra celda dejará de pintar.
Podremos escoger un color diferente y repetir el proceso, incluso sobre celdas que ya han sido pintadas.
3. Para borrar una celda pintaremos con el color blanco de la paleta.
4. Cada vez que el pincel esté activado se mostrará un mensaje debajo de la paleta de colores indicando : PINCEL ACTIVADO o PINCEL DESACTIVADO.
5. Debes desarrollarlo para que funcione correctamente en Chrome.
6. Captura de cómo debería quedar la aplicación:
![Si ves este texto, no estas en la misma ruta que la imagen](./DWEC06-TAREA.jpg)

## Rúbrica
Dibujar el tablero empleando métodos del DOM.(2 puntos)
Añadir los eventos para implementar la funcinalidad requerida.(2,5 puntos)
Selección del color de dibujo en la paleta y ponerlo como color activo.(0,5 puntos)
Activar/desactivar el pincel.(1 puntos)
Pintar. (3 puntos)
Comentarios e indentación del código.(1 puntos)



