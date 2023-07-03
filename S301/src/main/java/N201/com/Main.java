package N201.com;

import N201.implems.AdrecaINT;
import N201.implems.TelefonINT;
import N201.interf.Adreca;
import N201.interf.FabricaAbstracta;
import N201.interf.Telefon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Main {
    public static void main(String[] args) {


        // ********ADRECES**********
        List<Adreca> agendaAdreces = new ArrayList<Adreca>();

        FabricaAbstracta fabrAdr = FabricaProductor.getFactory("Adreca");
        Adreca adr1 = fabrAdr.getAdreca("Espanya", "Banco de España", "Av.España", "1-10", "28010", "Madrid");
        agendaAdreces.add(adr1);
        adr1.anotar();
        System.out.println("\n" + "\n");

        Adreca adr2 = fabrAdr.getAdreca("França", "Banc Lyonnais", "Rue de la Bastille", "1200", "58001", "Lyon");
        agendaAdreces.add(adr2);
        adr2.anotar();
        System.out.println("\n" + "\n");


        // ********TELEFONS**********
        List<Telefon> agendaTelefons = new ArrayList<Telefon>();

        FabricaAbstracta fabrTel = FabricaProductor.getFactory("Telefon");
        Telefon tel1 = fabrTel.getTelefon("Espanya", "911011020");
        agendaTelefons.add(tel1);
        tel1.anotar();
        System.out.println("\n");

        Telefon tel2 = fabrTel.getTelefon("Alemania", "453-388-400");
        agendaTelefons.add(tel2);
        tel2.anotar();
        System.out.println("\n");
        agendaTelefons.remove(tel2);
        tel2.eliminar();
        System.out.println("\n");

        // **********AGENDES***********
        System.out.println("\n" + "\n");
        System.out.println("AGENDA D'ADRECES:" + "\n");
        for (Adreca adr : agendaAdreces) {
            AdrecaINT adri1 = (AdrecaINT) adr;
            System.out.println(adri1.getName() + "\n" + adri1.getStreet() + ", " + adri1.getNumber() + "\n" + adri1.getPostCode() + " " + adri1.getLocation());
        }
        ;

        System.out.println("\n" + "\n");
        System.out.println("AGENDA DE TELEFONS:" + "\n");
        for (Telefon tel : agendaTelefons) {
            TelefonINT teli1 = (TelefonINT) tel;
            System.out.println(teli1.getPrefijo() + " " + teli1.getNumero());

        }
    }
}
