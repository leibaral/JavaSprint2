package N1E1;

public abstract class Instrument {
    protected String nom;
    protected int preu = 0;

    public Instrument (String nom, int preu) {
        this.nom = nom;
        this.preu = preu;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nouNom) {
        nom = nouNom;
    }
    public int getPreu() {
        return preu;
    }
    public void setPreu(int nouPreu) {
        preu = nouPreu;
    }
    public abstract void tocar();
}
