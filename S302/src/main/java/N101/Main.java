
import N101.Agencies.Agencia3;
import N101.Observable;
import N101.Observer;
import N101.Agencies.Agencia1;
import N101.Agencies.Agencia2;
import N101.Broker;

public class Main {
    public static void main(String[] args) {
        // Crear el objeto observable (broker)
        Observable broker = new Broker();

        // Crear los observadores (agencias de bolsa)
        Observer agencia1 = new Agencia1(broker);
        Observer agencia2 = new Agencia2(broker);
        Observer agencia3 = new Agencia3(broker);

        // Simular cambios en la bolsa
        ((Broker) broker).setStockPrice("AAPL", 150.50); // Precio inicial
        ((Broker) broker).setStockPrice("AAPL", 160.75); // Precio actualizado
        ((Broker) broker).setStockPrice("AAPL", 155.20); // Precio actualizado
    }
}

