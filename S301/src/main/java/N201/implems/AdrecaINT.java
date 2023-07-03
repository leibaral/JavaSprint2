package N201.implems;

import N201.interf.Adreca;

public class AdrecaINT implements Adreca {
    private String name;
    private String street;
    private String number;
    private String postCode;
    private String location;


    public AdrecaINT(String name, String street, String number, String postCode, String location){
        this.street = street;
        this.postCode = postCode;
        this.number = number;
        this.name = name;
        this.location = location;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }   //metodos setter() para cuando necesitemos editar la dirección

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {   //metodos setter() para cuando necesitemos editar la dirección
        this.street = street;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {   //metodos setter() para cuando necesitemos editar la dirección
        this.number = number;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {   //metodos setter() para cuando necesitemos editar la dirección
        this.postCode = postCode;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {   //metodos setter() para cuando necesitemos editar la dirección
        this.location = location;
    }

    @Override
    public void anotar(){
        System.out.println(
            getName() +"\n"
            + getNumber() + ", " + getStreet() +"\n"
            + getPostCode() + " " + getLocation() +"\n" +"\n"
            + "Adreça guardada a l'agenda.");
    }

    @Override
    public void editar(){
        System.out.println(
            getName() +"\n"
            + getNumber() + ", " + getStreet() +"\n"
            + getPostCode() + " " + getLocation() +"\n" +"\n"
            + "Adreça editada.");
    }     // código no implementado, sólo a modo de ejemplo para elejercicio

    @Override
    public void eliminar(){
        System.out.println(
            getName() +"\n"
            + getNumber() + ", " + getStreet() +"\n"
            + getPostCode() + " " + getLocation() +"\n" +"\n"
            + "Adreça eliminada de l'agenda.");
    }

}
