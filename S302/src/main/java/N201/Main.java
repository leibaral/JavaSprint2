package N201;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        PaymentGateway passarela1 = new PaymentGateway() {
            @Override
            public void processPayment(PaymentMethod pm, PaymentCallback callback) {

                Scanner input = new Scanner(System.in);
                System.out.println("\nEntra la forma de pagament:\n");
                System.out.println("T - Targeta");
                System.out.println("P - Paypal");
                System.out.println("C - Número de compte\n");
                char fp = input.nextLine().charAt(0);
                pm = new PaymentMethod(fp);

                System.out.println("\nIntrodueix la contrassenya:");
                boolean PagamentOk = pm.acceptMethod(input.nextLine());

                if(PagamentOk) {
                    callback.onPaymentSuccess();
                } else {
                    callback.onPaymentFailure();
                };
            }
        };
        Sabateria tenda1 = new Sabateria(passarela1);
        PaymentMethod pm1 = new PaymentMethod('T');
        tenda1.processPayment(pm1);
    }
}
