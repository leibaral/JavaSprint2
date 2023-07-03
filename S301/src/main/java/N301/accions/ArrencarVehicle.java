package N301.accions;

import N301.Vehicle;

public class ArrencarVehicle implements Accio {
    private Vehicle vehicle;
    public ArrencarVehicle(Vehicle vehicle){
        this.vehicle = vehicle;
    }
    @Override
    public void execute(){
        vehicle.arrencar();
    }
}
