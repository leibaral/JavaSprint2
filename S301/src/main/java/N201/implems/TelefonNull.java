package N201.implems;

import N201.interf.Telefon;

public class TelefonNull implements Telefon {
    public TelefonNull(String prefix, String number){
        System.out.println("Aquest país no és a la nostra BB.DD.");
    }
    @Override
    public void anotar() {
        System.out.println("Aquest país no és a la nostra BB.DD.");
    }

    @Override
    public void editar() {
        System.out.println("Aquest país no és a la nostra BB.DD.");
    }

    @Override
    public void eliminar() {
        System.out.println("Aquest país no és a la nostra BB.DD.");
    }
}
