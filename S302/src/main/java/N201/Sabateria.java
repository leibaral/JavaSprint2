package N201;

import java.util.Scanner;


public class Sabateria {
    private PaymentGateway pasarelaPago;

    public Sabateria(PaymentGateway pasarelaPago){
        this.pasarelaPago = pasarelaPago;
    }

    public void processPayment(PaymentMethod pm){
        PaymentCallback callback = new PaymentCallback() {
            @Override
            public void onPaymentSuccess() {
                System.out.println("\nEl pagament s'ha efectuat amb èxit.\n");
            }

            @Override
            public void onPaymentFailure() {
                System.out.println("\nEl pagament NO s'ha pogut realitzar correctament.\n");
            }
        };

        pasarelaPago.processPayment(pm, callback);
    }
}
