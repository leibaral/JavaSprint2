package N1E1;

public abstract class instrumentVent extends Instrument {
    public instrumentVent(String nom, int preu) {
        super(nom, preu);
    }

    public static void tocarVent(){
        System.out.println("Està sonant un instrument de vent");
    }
}