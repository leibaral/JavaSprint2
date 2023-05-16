package N1E1;

public class instrumentPercussio extends Instrument {
    public instrumentPercussio(String nom, int preu) {
        super(nom, preu);
    }

    public void tocar(){
        System.out.println("Està sonant un instrument de percussió");
    }
}
