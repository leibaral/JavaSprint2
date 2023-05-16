package N3E1;

import java.util.Scanner;

public class Noticia {
    private String dniRedactor;
    private String titolar;
    private String texte = "";
    private char tipusNoticia = 'A';
    private static int idNoticia = 0;
    private int puntuacioNoticia = 0;
    private int preuNoticia = 0;

    public Noticia(String dniRedactor, char tipusNoticia, String titolar, String texte){
        this.dniRedactor = dniRedactor;
        this.tipusNoticia = tipusNoticia;
        this.titolar = titolar;
        this.texte = texte;
        idNoticia++;

        switch(tipusNoticia){
            case 'A':
                puntuacioNoticia = 5;
                preuNoticia = 300;
                if(demanaString("Lliga de Campions? S/N").toUpperCase().charAt(0) == 'S'){
                    puntuacioNoticia += 3;
                    preuNoticia += 100;
                }
                if(demanaString("Lliga? S/N").toUpperCase().charAt(0) == 'S'){ puntuacioNoticia += 2;}
                if(demanaString("Barça i/o Madrid? S/N").toUpperCase().charAt(0) == 'S'){
                    puntuacioNoticia += 1;
                    preuNoticia += 100;
                }
                if(demanaString("Ferran Torres i/o Benzema? S/N").toUpperCase().charAt(0) == 'S'){
                    puntuacioNoticia += 1;
                    preuNoticia += 50;
                }
                break;
            case 'B':
                puntuacioNoticia = 4;
                preuNoticia = 250;
                if(demanaString("Eurolliga? S/N").toUpperCase().charAt(0) == 'S'){
                    puntuacioNoticia += 3;
                    preuNoticia += 75;
                }
                if(demanaString("ACB? S/N").toUpperCase().charAt(0) == 'S'){ puntuacioNoticia += 2;}
                if(demanaString("Barça i/o Madrid? S/N").toUpperCase().charAt(0) == 'S') {
                    puntuacioNoticia += 1;
                    preuNoticia += 75;
                }
                break;
            case 'C':
                puntuacioNoticia = 4;
                preuNoticia = 150;
                if(demanaString("Federer, Nadal o Djokovic? S/N").toUpperCase().charAt(0) == 'S'){
                    puntuacioNoticia += 3;
                    preuNoticia += 100;
                }
                break;
            case 'D':
                puntuacioNoticia = 4;
                preuNoticia = 100;
                if(demanaString("Ferrari o Mercedes? S/N").toUpperCase().charAt(0) == 'S'){
                    puntuacioNoticia += 2;
                    preuNoticia += 50;
                }
                break;
            case 'E':
                puntuacioNoticia = 3;
                preuNoticia = 100;
                if(demanaString("Honda o Yamaha? S/N").toUpperCase().charAt(0) == 'S'){
                    puntuacioNoticia += 3;
                    preuNoticia += 50;
                }
                break;
            default:
                System.out.println("Opció no vàlida");
        }
    }

    // GETTERS
    public int getIdNoticia() {
        return idNoticia;
    }
    public String getTitolar() {
        return titolar;
    }
    public String getTexteNoticia() {
        return texte;
    }
    public char getTipusNoticia() {
        return tipusNoticia;
    }
    public char getPuntuacioNoticia() {
        return puntuacioNoticia;
    }
    public char getPreuNoticia() {
        return preuNoticia;
    }
    public static String demanaString(String missatge) {
        Scanner input = new Scanner(System.in);
        System.out.println(missatge);
        return input.nextLine();
    }
}


