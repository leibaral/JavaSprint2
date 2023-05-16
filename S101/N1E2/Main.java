package N1E2;

public class Main {
    public static void main (String[] args) {
        Cotxe cotxe1 = new Cotxe ("Ibiza");

        Cotxe.frenar(); // el mètode estàtic es crida des de la classe, ja que afecta a TOTA la classe
        cotxe1.accelerar(); // el mètode no-estàtic es crida des de cada instància
    }
}
