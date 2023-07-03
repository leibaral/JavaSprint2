package N201.implems;

import N201.interf.Telefon;

public class TelefonINT implements Telefon {
    private String prefijo;
    private String numero;
    public TelefonINT(String prefix, String number){
        this.prefijo = prefix;
        this.numero = number;
    }

    public String getPrefijo() {
        return prefijo;
    }

    public void setPrefijo(String prefix) {
        this.prefijo = prefix;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String number) {
        this.numero = number;
    }
    @Override
    public void anotar(){ System.out.println("Telèfon "+ getPrefijo() + getNumero() + " guardat a l'agenda."); }
    @Override
    public void editar(){
        System.out.println("Telèfon "+ getPrefijo() + getNumero() + " editat.");
    } //sólo a modo de ejemplo
    @Override
    public void eliminar(){ System.out.println("Telèfon "+ getPrefijo() + getNumero() + " eliminat de l'agenda."); }
}
