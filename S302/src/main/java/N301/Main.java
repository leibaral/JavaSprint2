package N301;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Consulta preuCamisaEUR = new Consulta("Camisa", "EUR", new Convertidor());
        System.out.println("El preu de l'article " + preuCamisaEUR.article + " en " + preuCamisaEUR.moneda + " és de " + preuCamisaEUR.consultarPreu() + preuCamisaEUR.moneda);

        Consulta preuCamisaGBP = new Consulta("Camisa", "GBP", new Convertidor());
        System.out.println("El preu de l'article " + preuCamisaGBP.article + " en " + preuCamisaGBP.moneda + " és de " + preuCamisaGBP.consultarPreu() + preuCamisaGBP.moneda);

        Consulta preuPantaloJPY = new Consulta("Pantaló", "JPY", new Convertidor());
        System.out.println("El preu de l'article " + preuPantaloJPY.article + " en " + preuPantaloJPY.moneda + " és de " + preuPantaloJPY.consultarPreu() + preuPantaloJPY.moneda);

        Consulta preuPantaloUSD = new Consulta("Pantaló", "USD", new Convertidor());
        System.out.println("El preu de l'article " + preuPantaloUSD.article + " en " + preuPantaloUSD.moneda + " és de " + preuPantaloUSD.consultarPreu() + preuPantaloUSD.moneda);

    }
}
