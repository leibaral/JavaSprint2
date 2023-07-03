package N201.interf;

import N201.com.FabricaAdreces;
import N201.com.FabricaTelefons;


public interface FabricaAbstracta {
    public Adreca getAdreca(String pais, String nom, String carrer, String numero, String cp, String localitat);
    public Telefon getTelefon(String pais, String numtel);
}
