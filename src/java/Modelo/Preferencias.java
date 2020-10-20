/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author dario
 */
public class Preferencias {
    
    private String email;
    private Boolean relacion;
    private int deportes;
    private int arte;
    private int politica;
    private boolean hijos;
    private String interes;

    public Preferencias(String email, Boolean relacion, int deportes, int arte, int politica, boolean hijos, String interes) {
        this.email = email;
        this.relacion = relacion;
        this.deportes = deportes;
        this.arte = arte;
        this.politica = politica;
        this.hijos = hijos;
        this.interes = interes;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getRelacion() {
        return relacion;
    }

    public void setRelacion(Boolean relacion) {
        this.relacion = relacion;
    }

    public int getDeportes() {
        return deportes;
    }

    public void setDeportes(int deportes) {
        this.deportes = deportes;
    }

    public int getArte() {
        return arte;
    }

    public void setArte(int arte) {
        this.arte = arte;
    }

    public int getPolitica() {
        return politica;
    }

    public void setPolitica(int politica) {
        this.politica = politica;
    }

    public boolean isHijos() {
        return hijos;
    }

    public void setHijos(boolean hijos) {
        this.hijos = hijos;
    }

    public String getInteres() {
        return interes;
    }

    public void setInteres(String interes) {
        this.interes = interes;
    }
    
}
