package N301;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Vehicle> flota = new ArrayList<>();
        flota.add(new Vehicle("cotxe"));
        flota.add(new Vehicle("bicicletaAmbMotor"));
        flota.add(new Vehicle("avio"));
        flota.add(new Vehicle("vaixell"));

        VigilantParking Manolo = new VigilantParking();

        //accions per Cotxe:
        flota.get(0).arrencar();
        flota.get(0).accelerar();
        flota.get(0).frenar();

        //accions per Vaixell:
        flota.get(3).arrencar();
        flota.get(3).accelerar();
        flota.get(3).frenar();

        //accions per Bicicleta (amb motor):
        flota.get(1).frenar();
        flota.get(1).arrencar();
        flota.get(1).accelerar();

    }
}
