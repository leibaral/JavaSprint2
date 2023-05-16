package N3E1;

import java.util.ArrayList;
import java.util.Scanner;


public class Redactor {
    private String nom;
    private final String DNI;
    private static int sou;
    public Set<Noticia> llistaNoticiesDelRedactor;
    static ArrayList<Redactor> llistaRedactors = new ArrayList<Redactor>();

    public Redactor (String nom, String dni){
        this.nom = nom;
        this.DNI = dni;
        this.sou = 1500;
        llistaNoticiesDelRedactor = new hashSet<Noticia>();
    }

    public static String demanaString(String missatge) {
        Scanner input = new Scanner(System.in);
        System.out.println(missatge);
        return input.nextLine();
    }

    public String getNom(){
        return nom;
    }
    public String getDNI(){
        return DNI;
    }
    public int getSou(){
        return sou;
    }
    public static void setSou(int augmentSou){   //augment de sou a tothom igual
        int nouSou = sou + augmentSou;
    }

    public void crearNoticia(){
        char tipusNoticia = demanaString("A - Futbol\B - Bàsquet\C - Tennis\D - Fòrmula1\E - Motociclisme").toUpperCase().charAt(0);
        String titolar = demanaString("Escriu un titolar per a la notícia");
        String texte = demanaString("Redacta la notícia");
        Noticia novaNoticia = new Noticia(DNI, tipusNoticia, titolar, texte);
        llistaNoticiesDelRedactor.add(novaNoticia);
    }
}
