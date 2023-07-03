package N301.accions;

import N301.Vehicle;

public class AccelerarVehicle implements Accio {
    public Vehicle vehicle;
    public AccelerarVehicle(Vehicle vehicle){
        this.vehicle = vehicle;
    }
    @Override
    public void execute(){
        vehicle.accelerar();
    }
}
