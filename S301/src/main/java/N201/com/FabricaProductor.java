package N201.com;

import N201.interf.FabricaAbstracta;

public class FabricaProductor {
    public static FabricaAbstracta getFactory(String tipoDeFabrica){
        if(tipoDeFabrica.equalsIgnoreCase("ADRECA")){
            return new FabricaAdreces();
        } else if(tipoDeFabrica.equalsIgnoreCase("TELEFON")){
            return new FabricaTelefons();
        }
        return null;
    }
}
