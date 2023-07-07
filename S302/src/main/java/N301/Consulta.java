package N301;

import java.util.HashMap;
import java.util.Map;

public class Consulta {
    public String article;
    public String moneda;
    private Convertidor convertidor;
    Map<String, Float> llistaPreus = new HashMap<String, Float>();
    public Consulta(String article, String moneda, Convertidor convertidor){
        this.article = article;
        this.moneda = moneda;
        this.convertidor = convertidor;

        llistaPreus.put("Camisa", 28.15f);
        llistaPreus.put("Pantaló", 35.19f);
        llistaPreus.put("Jersei", 52.85f);
        llistaPreus.put("Bufanda", 23.19f);
        llistaPreus.put("Mitjons", 12.99f);
        llistaPreus.put("Cinturó", 18.49f);
    }

    public float consultarPreu(){
        float preuEur = llistaPreus.get(this.article);
        return convertidor.convertir(this.moneda, preuEur);
    }
}
