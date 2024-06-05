package tarea_filtro;

import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class Filtro {
    private Logger logger;
    private FileHandler fh;

    public Filtro() {
        try {
            // Configurar el logger para escribir en un archivo de registro llamado "filtro.log"
            logger = Logger.getLogger("Filtro");
            fh = new FileHandler("filtro.log");
            logger.addHandler(fh);
            SimpleFormatter formatter = new SimpleFormatter();
            fh.setFormatter(formatter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean filtrar(String stream) {
        // Expresiones regulares para detectar los patrones especificados
        String regexURL = "(https?://|www\\.)[-a-zA-Z0-9+&@#/%?=~_|!:.;]*[-a-zA-Z0-9+&@#/%=~_|]";
        String regexIP = "\\b(?:\\d{1,3}\\.){3}\\d{1,3}\\b";
        String regexCeros = "[0]{10,}";
        String regexMayusculasMinisculas = "([A-Z][a-z]){6,}";

        // Procesar el stream de datos
        String[] palabras = stream.split("\\s+");
        for (String palabra : palabras) {
            if (palabra.matches(regexURL) || palabra.matches(regexIP) ||
                palabra.matches(regexCeros) || palabra.matches(regexMayusculasMinisculas)) {
                // Si se detecta alguna coincidencia, registrar el mensaje y retornar verdadero
                logger.severe("Se ha detectado un patrón malicioso en el stream: " + palabra);
                return true; // Retornar true si se detecta un patrón malicioso
            }
        }
        return false; // Retornar false si no se detecta ningún patrón malicioso
    }
}
