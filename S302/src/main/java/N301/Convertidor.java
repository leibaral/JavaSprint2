package N301;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Convertidor {
    Map<String, Float> conversions;

    public Convertidor(){
        conversions = new HashMap<String, Float>();
        conversions.put("EUR", 1f);
        conversions.put("USD", 1.09f);
        conversions.put("GBP", 0.85f);
        conversions.put("JPY", 156.67f);
    }

    public float convertir (String conversio, float importEur){
        return importEur*(conversions.get(conversio));
    }
}
