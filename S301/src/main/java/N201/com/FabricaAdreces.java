package N201.com;

import N201.implems.AdrecaINT;
import N201.interf.Adreca;
import N201.implems.AdrecaNull;
import N201.interf.FabricaAbstracta;
import N201.interf.Telefon;

public class FabricaAdreces implements FabricaAbstracta {
    @Override
    public Adreca getAdreca(String pais, String nom, String carrer, String numero, String cp, String localitat){
        if(pais.equalsIgnoreCase("FRANÇA")){
            return new AdrecaINT(nom, carrer, numero, cp, localitat);
        } else if (pais.equalsIgnoreCase("ITALIA")) {
            return new AdrecaINT(nom, carrer, numero, cp, localitat);
        } else if (pais.equalsIgnoreCase("ESPANYA")) {
            return new AdrecaINT(nom, carrer, numero, cp, localitat);
        } else if (pais.equalsIgnoreCase("ALEMANIA")) {
            return new AdrecaINT(nom, carrer, numero, cp, localitat);
        } else {
            return new AdrecaNull(nom, carrer, numero, cp, localitat);
        }
    }

    @Override
    public Telefon getTelefon(String pais, String numtel){
        return null;
    }
}
