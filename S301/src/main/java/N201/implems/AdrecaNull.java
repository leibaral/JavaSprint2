package N201.implems;

import N201.interf.Adreca;

public class AdrecaNull implements Adreca {
    public AdrecaNull(String nom, String carrer, String numero, String cp, String localitat){
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
