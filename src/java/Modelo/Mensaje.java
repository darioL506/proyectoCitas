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
public class Mensaje {
    private String asunto;
    private String cuerpo;
    private String emisor;
    private String receptor;
    private String fecha;
    private boolean leido;
    private String nombreArch;

    public Mensaje() {
    
    }

    public Mensaje(String asunto, String cuerpo, String emisor, String receptor, String fecha, boolean leido, String nombreArch) {
        this.asunto = asunto;
        this.cuerpo = cuerpo;
        this.emisor = emisor;
        this.receptor = receptor;
        this.fecha = fecha;
        this.leido = leido;
        this.nombreArch = nombreArch;
    }  

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getCuerpo() {
        return cuerpo;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
    }

    public String getEmisor() {
        return emisor;
    }

    public void setEmisor(String emisor) {
        this.emisor = emisor;
    }

    public String getReceptor() {
        return receptor;
    }

    public void setReceptor(String receptor) {
        this.receptor = receptor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public boolean isLeido() {
        return leido;
    }

    public void setLeido(boolean leido) {
        this.leido = leido;
    }
        
}
