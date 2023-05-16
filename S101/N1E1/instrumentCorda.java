package N1E1;

public class instrumentCorda extends Instrument {
    public instrumentCorda(String nom, int preu) {
        super(nom, preu);
    }

    @Override
    public void tocar(){
        System.out.println("Està sonant un instrument de corda");
    }
}
