package N101;

import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
        Undo u = Undo.getInstancia();
        Scanner input = new Scanner(System.in);
        System.out.println("Entra una comanda 1-5 ó opció:");
        System.out.println("1. Ctrl+C");
        System.out.println("2. Ctrl+V");
        System.out.println("3. Ctrl+X");
        System.out.println("4. Ctrl+S");
        System.out.println("5. Ctrl+D");
        System.out.println("");
        System.out.println("0. Undo (desfer la darrera comanda)");
        System.out.println("9. Llista les darreres comandes");
        System.out.println("10. Sortir de l'aplicació");
        int comanda = 0;

        while(!(comanda ==10)){
            comanda = input.nextInt();
            switch(comanda){
                case 1:
                    u.comandes.add("Ctrl+C");
                    break;
                case 2:
                    u.comandes.add("Ctrl+V");
                    break;
                case 3:
                    u.comandes.add("Ctrl+X");
                    break;
                case 4:
                    u.comandes.add("Ctrl+S");
                    break;
                case 5:
                    u.comandes.add("Ctrl+D");
                    break;
                case 0:
                    u.undo();
                    break;
                case 9:
                    u.comandes.forEach(System.out::println);
                    break;
                default:
                    if(comanda==10){
                        break;
                    }else {
                        System.out.println("No existeix aquesta opció.");
                    }
            } input.nextLine();
        }
    }
}
