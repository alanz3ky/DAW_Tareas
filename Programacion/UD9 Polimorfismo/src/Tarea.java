import java.time.LocalDate;
import java.util.ArrayList;


public class Tarea {
    public static void main(String[] args) {
        ArrayList<ProductoNetflix> netflixCollection = new ArrayList<>();

        // Crear instancias de Serie
        Serie serie1 = new Serie("Breaking Bad", LocalDate.of(2008, 1, 20), "Una serie sobre un profesor de química que se convierte en fabricante de metanfetaminas.");
        Serie serie2 = new Serie("Stranger Things", LocalDate.of(2016, 7, 15), "Una serie sobre misterios sobrenaturales en un pequeño pueblo.");
        serie1.agregarEpisodio(new ProductoNetflix("Pilot", LocalDate.of(2008, 1, 20), "Primer episodio de Breaking Bad"));
        serie1.agregarEpisodio(new ProductoNetflix("Un loco punhado de nada'", LocalDate.of(2008, 2, 24), "Episodio icónico de Breaking Bad"));
        serie2.agregarEpisodio(new ProductoNetflix("Capítulo 1: El desvanecimiento de Will Byers", LocalDate.of(2016, 7, 15), "Primer episodio de Stranger Things"));
        netflixCollection.add(serie1);
        netflixCollection.add(serie2);

        // Crear instancias de Pelicula
        ArrayList<String> repartoPelicula = new ArrayList<>();
        repartoPelicula.add("Leonardo DiCaprio");
        repartoPelicula.add("Joseph Gordon-Levitt");
        Pelicula pelicula1 = new Pelicula("Origen", LocalDate.of(2010, 7, 16), "Un ladrón de ideas se adentra en el subconsciente de sus objetivos.", "Ciencia ficción", repartoPelicula);
        netflixCollection.add(pelicula1);

        // Probar los métodos
        for (ProductoNetflix producto : netflixCollection) {
            producto.mostrarInfo();
            System.out.println("Días en pantalla: " + producto.calculoDiasEnPantalla(LocalDate.now()));
            System.out.println();
        }
    }
}

class ProductoNetflix {
    private String titulo;
    private LocalDate fechaEstreno;
    private String resumen;

    public ProductoNetflix(String titulo, LocalDate fechaEstreno, String resumen) {
        this.titulo = titulo;
        this.fechaEstreno = fechaEstreno;
        this.resumen = resumen;
    }

    public void mostrarInfo() {
        System.out.println("Título: " + titulo);
        System.out.println("Fecha de estreno: " + fechaEstreno);
        System.out.println("Resumen: " + resumen);
    }

    public long calculoDiasEnPantalla(LocalDate fechaActual) {
        return fechaActual.toEpochDay() - fechaEstreno.toEpochDay();
    }
}

class Serie extends ProductoNetflix {
    private ArrayList<ProductoNetflix> episodios;

    public Serie(String titulo, LocalDate fechaEstreno, String resumen) {
        super(titulo, fechaEstreno, resumen);
        this.episodios = new ArrayList<>();
    }

    public void agregarEpisodio(ProductoNetflix episodio) {
        episodios.add(episodio);
    }

    @Override
    public void mostrarInfo() {
        super.mostrarInfo();
        System.out.println("Episodios:");
        for (ProductoNetflix episodio : episodios) {
            episodio.mostrarInfo();
        }
    }
}

class Pelicula extends ProductoNetflix {
    private String genero;
    private ArrayList<String> reparto;

    public Pelicula(String titulo, LocalDate fechaEstreno, String resumen, String genero, ArrayList<String> reparto) {
        super(titulo, fechaEstreno, resumen);
        this.genero = genero;
        this.reparto = reparto;
    }

    @Override
    public void mostrarInfo() {
        super.mostrarInfo();
        System.out.println("Género: " + genero);
        System.out.println("Reparto:");
        for (String actor : reparto) {
            System.out.println(actor);
        }
    }
}


