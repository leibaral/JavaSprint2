package N201.com;

import N201.implems.TelefonINT;
import N201.interf.Adreca;
import N201.implems.TelefonNull;
import N201.interf.FabricaAbstracta;
import N201.interf.Telefon;

public class FabricaTelefons implements FabricaAbstracta {
    @Override
    public Adreca getAdreca(String pais, String nom, String carrer, String numero, String cp, String localitat){
        return null;
    }

    @Override
    public Telefon getTelefon(String pais, String numtel) {
        if (pais.equalsIgnoreCase("FRANÇA")) {
            return new TelefonINT("+33 ", numtel);
        } else if (pais.equalsIgnoreCase("ITALIA")) {
            return new TelefonINT("+39 ", numtel);
        } else if (pais.equalsIgnoreCase("ESPANYA")) {
            return new TelefonINT("+34 ", numtel);
        } else if (pais.equalsIgnoreCase("ALEMANIA")) {
            return new TelefonINT("+49 ", numtel);
        } else {
            return new TelefonNull("", "");
        }
    }
}
