package N301;
import N301.accions.Accio;

import java.util.ArrayList;
import java.util.List;

public class VigilantParking {              //és el INVOCADOR de les Accions
    private List<Accio> llistaAccions = new ArrayList<>();

    public void queVolsFer(Accio accio){
        llistaAccions.add(accio);
    }

    public void fesAlgunaAccio(){
        for(Accio accio : llistaAccions){
            accio.execute();
        }
        llistaAccions.clear();
    }
}
