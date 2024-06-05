package TestCompatibilidadSwitch;

import java.util.Scanner;

public class testCompatibilidadSwitch {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int comidaPuntos = 0;
        int deportePuntos = 0;
        int destinosPuntos = 0;
        int hobbiesPuntos = 0;

        System.out.println("Elige tus preferencias de comida:");
        System.out.println("1) Ensalada Cesar.");
        System.out.println("2) Lentejas.");
        System.	out.println("3) Pasta Carbonara.");
        System.out.println("4) Fabada.");

        int opcionComida = scanner.nextInt();
        switch (opcionComida) {
            case 1:
                comidaPuntos += 5;
                break;
            case 2:
                comidaPuntos += 4;
                break;
            case 3:
                comidaPuntos += 3;
                break;
            case 4:
                comidaPuntos += 2;
                break;
            default:
                System.out.println("Opción no valida. Intente de nuevo.");
                return;
        }

        System.out.println("Elige tus preferencias de deporte:");
        System.out.println("1) Fútbol.");
        System.out.println("2) Baloncesto.");
        System.out.println("3) Tenis.");
        System.out.println("4) Natación.");

        int opcionDeporte = scanner.nextInt();
        switch (opcionDeporte) {
            case 1:
                deportePuntos += 5;
                break;
            case 2:
                deportePuntos += 4;
                break;
            case 3:
                deportePuntos += 3;
                break;
            case 4:
                deportePuntos += 2;
                break;
            default:
                System.out.println("Opción no valida. Intente de nuevo.");
                return;
        }

        System.out.println("Elige tus preferencias de destinos:");
        System.out.println("1) Bali.");
        System.out.println("2) Boston.");
        System.out.println("3) Burgos.");
        System.out.println("4) Barcelona.");

        int opcionDestinos = scanner.nextInt();
        switch (opcionDestinos) {
            case 1:
                destinosPuntos += 5;
                break;
            case 2:
                destinosPuntos += 4;
                break;
            case 3:
                destinosPuntos += 3;
                break;
            case 4:
                destinosPuntos += 2;
                break;
            default:
                System.out.println("Opción no valida. Intente de nuevo.");
                return;
        }

        System.out.println("Elige tus preferencias de hobbies:");
        System.out.println("1) Leer.");
        System.out.println("2) Pintar.");
        System.out.println("3) Jugar videojuegos.");
        System.out.println("4) Cocinar.");

        int opcionHobbies = scanner.nextInt();
        switch (opcionHobbies) {
            case 1:
                hobbiesPuntos += 5;
                break;
            case 2:
                hobbiesPuntos += 4;
                break;
            case 3:
                hobbiesPuntos += 3;
                break;
            case 4:
                hobbiesPuntos += 2;
                break;
            default:
                System.out.println("Opción no valida. Intente de nuevo.");
                return;
        }

        double porcentajeCompatibilidad = calcularPorcentaje(comidaPuntos, deportePuntos, destinosPuntos, hobbiesPuntos);

        System.out.println("Tu porcentaje de compatibilidad es: " + porcentajeCompatibilidad + "%");

        scanner.close();
    }

    public static double calcularPorcentaje(int comida, int deporte, int destinos, int hobby) {
        int totalPuntosPosibles = 40; // 4 categorías x 10 puntos máximos cada una
        int totalPuntos = comida + deporte + destinos + hobby;
        return (double) totalPuntos / totalPuntosPosibles * 100;
    }
}
