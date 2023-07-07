package N101;
import java.util.ArrayList;
import java.util.List;

public class Broker implements Observable {
    private List<Observer> observers;

    public Broker() {
        this.observers = new ArrayList<>();
    }

    @Override
    public void addObserver(Observer observer) {
        observers.add(observer);
    }

    @Override
    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    @Override
    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.update();
        }
    }

    public void setStockPrice(String stockName, double price) {
        notifyObservers();
    }
}
