
package N101.Agencies;
import N101.Observable;
import N101.Observer;

public class Agencia1 implements Observer {
    private Observable broker;

    public Agencia1(Observable broker) {
        this.broker = broker;
        this.broker.addObserver(this);
    }

    @Override
    public void update() {
        System.out.println("Agencia1: Se ha producido un cambio en la bolsa.");
    }
}
