# Ejercicio 1
Partiendo del código existente realiza una petición al api:
https://rickandmortyapi.com/api/episode/


1. Muestra cada uno de los episodios en un div y añádeles la clase existente episode-card. Estos divs se encontrarán dentro del div con id=episodes-container y clase grid-container. **1 punto**

2. Muestra para cada uno de los episodios los siguientes elementos:   
   
   2.1.Como un título h2 el nombre del episodio. **0,5 puntos**

   2.2 Como un párrafo p el id del episodio, como otro parrafo p el código del episodio y como otro párrafo p fecha de emisión del episodio .**0,5 puntos**

   2.3 Como un párrafo p el numero de total de personajes que intervienen en el episodio. **1 punto.**

   2.4 Filtra los episodios y que solo se muestren los que tenga ids impares. **1 punto.**

   2.5 En la petición que realizamos solo se recuperan los episodios de la primera página, recupera el resto de páginas y muestralas(que el código permita recurar n páginas). **1 punto.**

3. Añade los siguientes eventos:
   3.1 Añade un evento que cuando hagas click salte una alerta con los datos que se muestran en el div de cada episodio. **1 punto.**

   3.2 Añade un evento que al pasar el raton por encima de cada div con la clase episode-card cambie el color de fondod a #add8e6 y añada el texto "Esta es mas info." y cuando salgas vuelva a su estado normal (sin el color añadido y sin el texto). **2 puntos.**

   3.3 Añade un evento que al pulsar la tecla b, se cambie el color de fondo de todos los divs con la clase .episode-card a color amarillo. **2 puntos.**
