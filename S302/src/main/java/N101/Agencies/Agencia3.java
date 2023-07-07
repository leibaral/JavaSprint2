
package N101.Agencies;
import N101.Observable;
import N101.Observer;

public class Agencia3 implements Observer {
    private Observable broker;

    public Agencia3(Observable broker) {
        this.broker = broker;
        this.broker.addObserver(this);
    }

    @Override
    public void update() {
        System.out.println("Agencia3: Se ha producido un cambio en la bolsa.");
    }
}