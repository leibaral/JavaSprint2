package N3E1;

import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Set;

import static N3E1.Redactor.llistaRedactors;

public class Main {


    public static void main(String[] args) {
        int opcioMenu;
        do {
            switch (menu()) {
                case 0:                     //SORTIR DE L'APLICACIÓ
                    opcioMenu = 0;
                    break;
                case 1:                    //DONAR D'ALTA REDACTOR
                    Scanner inputDniNouRedactor = new Scanner(System.in);
                    String dniNouRedactor = inputDniNouRedactor.nextLine(); //demanem DNI per comparar-lo que no hi sigui
                    Scanner inputNomNouRedactor = new Scanner(System.in);
                    String nomNouRedactor = inputNomNouRedactor.nextLine();

                    for (int i=0; i<llistaRedactors.size(); i++){
                        if(dniNouRedactor.equals(llistaRedactors.get(i).getDNI()) {
                            System.out.println("Aquest redactor ja és a la nostra BB.DD.");
                            opcioMenu = 10;
                            break;
                        }
                    }
                    Redactor nouRedactor = new Redactor(nomNouRedactor, dniNouRedactor); //si DNI és nou, instanciem
                    llistaRedactors.add(nouRedactor);   //i afegim a la llista de redactors
                    System.out.println();
                    System.out.println("Nou redactor guardat");
                    System.out.println();
                    opcioMenu = 10;
                    break;
                case 2:                    //ELIMINAR REDACTOR
                    System.out.println();
                    System.out.println("Escull redactor pel seu DNI:");
                    System.out.println();
                    for(int i=0; i<llistaRedactors.size(); i++){
                        System.out.println(i + " - " + llistaRedactors.get(i).getDNI() + llistaRedactors.get(i).getNom());
                    }
                    Scanner inputRedactor = new Scanner(System.in);
                    String redactorEliminar = inputRedactor.nextLine();
                    int comptador = 0;
                    while (comptador<llistaRedactors.size() && !redactorEliminar.equalsIgnoreCase(llistaRedactors.get(comptador).getDNI())) {
                        comptador++;
                    }
                    if (comptador == llistaRedactors.size() && !redactorEliminar.equalsIgnoreCase(llistaRedactors.get(comptador).getDNI())) {
                        System.out.println("Aquest redactor no és a la nostra base de dades");
                        System.out.println("");
                        comptador = -1;
                    }
                    llistaRedactors.remove(comptador);
                    System.out.println();
                    System.out.println("Redactor eliminat de la BB.DD.");
                    System.out.println();
                    opcioMenu = 10;
                    break;
                case 3:                    //INTRODUIR NOTICIA AMB TITULAR A REDACTOR
                    System.out.println();
                    System.out.println("DNI del redactor:");
                    System.out.println();
                    for(int i=0; i<llistaRedactors.size(); i++){
                        System.out.println(i + " - " + llistaRedactors.get(i).getDNI() + llistaRedactors.get(i).getNom());
                    }
                    Scanner inputDNIRedactor = new Scanner(System.in);
                    String dniRedactorEscriure = inputDNIRedactor.nextLine();
                    int comptador = 0;
                    while (comptador<llistaRedactors.size() && !dniRedactorEscriure.equalsIgnoreCase(llistaRedactors.get(comptador).getDNI())) {
                        comptador++;
                    }
                    if (comptador == llistaRedactors.size() && !dniRedactorEscriure.equalsIgnoreCase(llistaRedactors.get(comptador).getDNI())) {
                        System.out.println("Aquest redactor no és a la nostra base de dades");
                        System.out.println("");
                        comptador = -1;
                    }
                    llistaRedactors.get(comptador).crearNoticia();
                    System.out.println();
                    System.out.println("Notícia guardada");
                    System.out.println();
                    opcioMenu = 10;
                    break;

                case 4:                    //ELIMINAR NOTICIA (TITULAR Y REDACTOR)
                    System.out.println();
                    System.out.println("DNI del redactor:");
                    System.out.println();
                    for(int i=0; i<llistaRedactors.size(); i++){
                        System.out.println(i + " - " + llistaRedactors.get(i).getDNI() + llistaRedactors.get(i).getNom());
                    }
                    Scanner inputDNIRedactor = new Scanner(System.in);
                    String dniRedactor = inputDNIRedactor.nextLine();
                    int comptador = 0;
                    while (comptador<llistaRedactors.size() && !dniRedactor.equalsIgnoreCase(llistaRedactors.get(comptador).getDNI())) {
                        comptador++;
                    }
                    if (comptador == llistaRedactors.size() && !dniRedactor.equalsIgnoreCase(llistaRedactors.get(comptador).getDNI())) {
                        System.out.println("Aquest redactor no és a la nostra base de dades");
                        System.out.println("");
                        comptador = -1;
                    }
                    System.out.println("Id de la notícia a esborrar : ");
                    for(int i=0; i<llistaRedactors.get(comptador).llistaNoticiesDelRedactor.size(); i++){
                        System.out.println(llistaRedactors.get(comptador).llistaNoticiesDelRedactor.get(i));
                    }
                    Scanner input = new Scanner(System.in);
                    int idNoticiaEsborrar = input.nextInt();
                    llistaRedactors.get(comptador).llistaNoticiesDelRedactor.remove(idNoticiaEsborrar);
                    System.out.println();
                    System.out.println("Notícia eliminada");
                    System.out.println();
                    opcioMenu = 10;
                    break;

                case 5:                    //MOSTRAR NOTICIES PER REDACTOR
                    System.out.println();
                    System.out.println("DNI del redactor:");
                    System.out.println();
                    for(int i=0; i<llistaRedactors.size(); i++){
                        System.out.println(i + " - " + llistaRedactors.get(i).getDNI() + llistaRedactors.get(i).getNom());
                    }
                    Scanner inputDNIRedactor = new Scanner(System.in);
                    String dniRedactor = inputDNIRedactor.nextLine();
                    int comptador = 0;
                    while (comptador<llistaRedactors.size() && !dniRedactor.equalsIgnoreCase(llistaRedactors.get(comptador).getDNI())) {
                        comptador++;
                    }
                    if (comptador == llistaRedactors.size() && !dniRedactor.equalsIgnoreCase(llistaRedactors.get(comptador).getDNI())) {
                        System.out.println("Aquest redactor no és a la nostra base de dades");
                        System.out.println("");
                        comptador = -1;
                    }
                    // Printem totes les noticies del redactor:
                    for (int i=0; i<llistaRedactors.get(comptador).llistaNoticiesDelRedactor.size(); i++){
                        llistaRedactors.get(comptador).llistaNoticiesDelRedactor.get(i).getIdNoticia();


                    }

                    opcioMenu = 10;
                    break;

                case 6:                    //CALCULAR PUNTUACIÓ NOTICIA
                    System.out.println();
                    System.out.println("Escull un d'aquests redactors:");
                    System.out.println();

                    opcioMenu = 10;
                    break;

                case 7:                    //CALCULAR PREU NOTICIA
                    System.out.println();
                    System.out.println("Escull un d'aquests redactors:");
                    System.out.println();

                    opcioMenu = 10;
                    break;

                default:
                    System.out.println();
                    System.out.println("opcio inexistent");
                    System.out.println();
                    opcioMenu = 10;
            }
        } while (opcioMenu > 0);
    }


    public static int menu() {
        ArrayList<String> indexMenu = new ArrayList<String>();
        indexMenu.add("0 - Sortir de l'aplicacio");
        indexMenu.add("1 - Introduir redactor");
        indexMenu.add("2 - Eliminar redactor");
        indexMenu.add("3 - Introduir notícia a un redactor");
        indexMenu.add("4 - Eliminar notícia");
        indexMenu.add("5 - Mostrar totes les notícies d'un redactor");
        indexMenu.add("6 - Calcular puntuació d'una notícia");
        indexMenu.add("7 - Calcular preu d'una notícia");
        System.out.println();
        for (int i = 0; i < indexMenu.size(); i++) {
            System.out.println(indexMenu.get(i));
        }
        Scanner input = new Scanner(System.in);
        return input.nextInt();
    }

    public static int demanaInt(String missatge) {
        Scanner input = new Scanner(System.in);
        System.out.println(missatge);
        return input.nextInt();
    }

    public static String demanaString(String missatge) {
        Scanner input = new Scanner(System.in);
        System.out.println(missatge);
        return input.nextLine();
    }
}
