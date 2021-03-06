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
public class Usuario {
    
    private String email;
    private String password;
    private String name;
    private String apellido;
    private int edad;
    private String genero;
    private int rol;
    private boolean activo;

    public Usuario(String email, String name, String apellido, int edad, String genero) {
        this.email = email;
        this.name = name;
        this.apellido = apellido;
        this.edad = edad;
        this.genero = genero;
    }

    public Usuario(String email, String name, String apellido, boolean activo) {
        this.email = email;
        this.name = name;
        this.apellido = apellido;
        this.activo = activo;
    }

    public Usuario(String email, int rol) {
        this.email = email;
        this.rol = rol;
    }
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    } 
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }  

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public boolean isActivo() {
        return activo;
    }

}
