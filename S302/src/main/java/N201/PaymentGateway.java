package N201;

public abstract class PaymentGateway {
    public abstract void processPayment(PaymentMethod pm, PaymentCallback callback);
}
