package N1E2;

public class Cotxe {
    final static String MARCA = "Seat";
    static String model;
    final int POTENCIA = 150;

    public Cotxe (String model){
        this.model = model;
    }

    public static void frenar(){
        System.out.println("El vehicle està frenant");
    }

    public void accelerar(){
        System.out.println("El vehicle està accelerant");
    }

}
