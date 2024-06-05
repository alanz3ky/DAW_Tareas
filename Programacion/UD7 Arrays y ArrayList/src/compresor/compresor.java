/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compresor;

import java.util.Scanner;

/**
 *
 * @author Alan Ezequiel Matia
 */
public class compresor {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner tec = new Scanner(System.in);
        System.out.print("Introduce una cadena con repeticiones (sin digitos):");
        String cadenaO=tec.nextLine();
        String comprimida="";
        int i,j;
        for(i=0;i<cadenaO.length();i++){
            for(j=i+1;
                j<cadenaO.length() && cadenaO.charAt(i)==cadenaO.charAt(j) ;
                j++);
            if (j-i>1){
                comprimida+= (j-i);
                comprimida+= cadenaO.charAt(i);
                i=j-1;
            }else{
                comprimida+= cadenaO.charAt(i); 
            }
            
        }
        System.out.println("La cadena comprimida es:"+comprimida);
        
        // Descompresión
        System.out.print("Introduce una cadena comprimida:");
        String cadenaComprimida = tec.nextLine();
        String descomprimida = "";
        i = 0;
        while (i < cadenaComprimida.length()) {
            if (Character.isDigit(cadenaComprimida.charAt(i))) {
                int inicio = i;
                while (i < cadenaComprimida.length() && Character.isDigit(cadenaComprimida.charAt(i))) {
                    i++;
                }
                int repeticiones = Integer.parseInt(cadenaComprimida.substring(inicio, i));
                char caracter = cadenaComprimida.charAt(i);
                for (int k = 0; k < repeticiones; k++) {
                    descomprimida += caracter;
                }
                i++;
            } else {
                descomprimida += cadenaComprimida.charAt(i);
                i++;
            }
        }
        System.out.println("La cadena descomprimida es:" + descomprimida);
    }
}

        
    

