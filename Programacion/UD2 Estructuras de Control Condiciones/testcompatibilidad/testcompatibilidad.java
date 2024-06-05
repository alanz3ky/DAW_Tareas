
import java.util.Scanner;

public class testcompatibilidad {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int comidaPuntos = 0;
        int deportePuntos = 0;
        int destinosPuntos = 0;
        int hobbiesPuntos = 0;

        System.out.println("Elige tus preferencias de comida:");
        System.out.println("1) Ensalada Cesar.");
        System.out.println("2) Lentejas.");
        System.out.println("3) Pasta Carbonara.");
        System.out.println("4) Fabada.");

        int opcionComida = scanner.nextInt();

        if (opcionComida == 1) {
            comidaPuntos += 5;
        } else if (opcionComida == 2) {
            comidaPuntos += 4;
        } else if (opcionComida == 3) {
            comidaPuntos += 3;
        } else if (opcionComida == 4) {
            comidaPuntos += 2;
        } else {
                System.out.println("Opción no valida. Intente de nuevo.");
            return;
        }

        System.out.println("Elige sus preferencias de deporte:");
        System.out.println("1) Fútbol.");
        System.out.println("2) Baloncesto.");
        System.out.println("3) Tenis.");
        System.out.println("4) Natacion.");

        int opcionDeporte = scanner.nextInt();

        if (opcionDeporte == 1) {
            deportePuntos += 5;
        } else if (opcionDeporte == 2) {
            deportePuntos += 4;
        } else if (opcionDeporte == 3) {
            deportePuntos += 3;
        } else if (opcionDeporte == 4) {
            deportePuntos += 2;
        } else {
                System.out.println("Opción no valida. Intente de nuevo.");
            return;
        }

        System.out.println("Elige sus preferencias de destinos:");
        System.out.println("1) Bali.");
        System.out.println("2) Boston.");
        System.out.println("3) Burgos.");
        System.out.println("4) Barcelona.");
        
        
        int opcionDestinos = scanner.nextInt();
        
        if(opcionDestinos == 1) {
            deportePuntos += 5;
        } else if (opcionDestinos == 2) {
            deportePuntos += 4;
        } else if (opcionDestinos == 3) {
            deportePuntos += 3;
        } else if (opcionDestinos == 4) {
            deportePuntos += 2;
        } else {
                System.out.println("Opción no valida. Intente de nuevo.");
            return;
        }
        
         System.out.println("Elige sus preferencias de hobbies:");
        System.out.println("1) Leer.");
        System.out.println("2) Pintar.");
        System.out.println("3) Jugar videojuegos.");
        System.out.println("4) Cocinar.");
        
        
        int opcionHobbies = scanner.nextInt();
        
        if(opcionHobbies == 1) {
            deportePuntos += 5;
        } else if (opcionHobbies == 2) {
            deportePuntos += 4;
        } else if (opcionHobbies == 3) {
            deportePuntos += 3;
        } else if (opcionHobbies == 4) {
            deportePuntos += 2;
        } else {
                System.out.println("Opción no valida. Intente de nuevo.");
            return;
        }

        

        double porcentajeCompatibilidad = calcularPorcentaje(comidaPuntos, deportePuntos , destinosPuntos , hobbiesPuntos);

        System.out.println("Tu porcentaje de compatibilidad es: " + porcentajeCompatibilidad + "%");

        scanner.close();
    }

    public static double calcularPorcentaje(int comida, int deporte, int destinos , int hobby) {
        int totalPuntosPosibles = 20;
        int totalPuntos = comida + deporte;
        return (double) totalPuntos / totalPuntosPosibles * 100;
    }
}
