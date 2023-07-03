package N301.accions;

import N301.Vehicle;

public class FrenarVehicle implements Accio {
    private Vehicle vehicle;
    public FrenarVehicle(Vehicle vehicle){
        this.vehicle = vehicle;
    }
    @Override
    public void execute(){
        vehicle.frenar();
    }
}
