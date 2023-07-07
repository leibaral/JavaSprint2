package N201;

import java.util.Scanner;

public class PaymentMethod {
    public char paymentMethod;
    private String hash = "12345";

    public PaymentMethod(char paymentMethod){
        this.paymentMethod = paymentMethod;
    }

    public boolean acceptMethod(String password) {
        Scanner input = new Scanner(System.in);
        boolean resp = false;

        for(int i=2;i>0;i--){
            if(!this.hash.equals(password)){
                System.out.println("\nPassword incorrecte\n");
                System.out.println("Et queden " + (i) + " intents...");
                password = input.nextLine();
                if(i==1 && !this.hash.equals(password)){
                    i=0;
                    resp = false;
                } else if(i==1 && this.hash.equals(password)) {
                    i=0;
                    resp = true;
                }
            } else {
                i=0;
                System.out.println("Password correcte\n");
                resp = true;
            }
        }
        input.close();
        return resp;
    }
}
