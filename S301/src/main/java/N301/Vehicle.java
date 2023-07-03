package N301;

public class Vehicle {
    private String tipus;
    boolean engegat = false;
    public Vehicle(String tipus){
        this.tipus = tipus;
    }


    public void arrencar(){
        if(engegat){
            System.out.println("El Vehicle tipus " + tipus + " ja està engegat" + "\n");
        } else {
            engegat = true;
            System.out.println(("Acabem d'engegar el " + tipus +"." + "\n"));
        }
    }

    public void accelerar(){
        if(engegat){
            System.out.println("El Vehicle tipus " + tipus + " està accelerant." + "\n");
        } else {
            System.out.println("El Vehicle tipus " + tipus + " no pot accelerar perque no està en marxa." + "\n");
        }
    }

    public void frenar(){
        if(engegat){
            System.out.println("El Vehicle tipus " + tipus + " està frenant." + "\n");
        } else {
            System.out.println("El Vehicle tipus " + tipus + " no pot frenar perque no està en marxa." + "\n");
        }
    }
}
