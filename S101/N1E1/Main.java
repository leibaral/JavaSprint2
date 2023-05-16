package N1E1;

// Grup de musica>instruments> vent, corda, percussio
// Atributs: nom, preu. Metode: tocar() abstracte a la classe instrument
//
public class Main {
    public static void main(String[] args) {
        instrumentPercussio piano = new instrumentPercussio("piano", 1000); //carreguem la classe pq instanciem
        instrumentCorda guitarra = new instrumentCorda("guitarra", 500); //carreguem la classe pq instanciem
        piano.tocar();
        guitarra.tocar();
        instrumentVent.tocarVent(); //carreguem la classe pq cridem un mètode static seu
    }
}
