/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author addaw19
 */
public class Votante {

    private int id;
    private String Nif;
    private String Nombre;
    private String Apellidos;
    private String Domicilio;
    private LocalDate FechaNac;
    private String Password;
    private String Votado;
    private String Rol;

    //Constructor para insertar Votante
    public Votante(String Nif, String Nombre, String Apellidos, String Domicilio, LocalDate FechaNac, String Password) {
        this.Nif = Nif;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.Domicilio = Domicilio;
        this.FechaNac = FechaNac;
        this.Password = Password;
    }

    //Constructor para el login (para crear la sesión)
    public Votante(String Nif, String Nombre, String Apellidos, String Domicilio, LocalDate FechaNac, String Password, String Votado, String Rol) {
        this.id = id;
        this.Nif = Nif;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.Domicilio = Domicilio;
        this.FechaNac = FechaNac;
        this.Password = Password;
        this.Votado = Votado;
        this.Rol = Rol;
    }
       
    public Votante(){
    
    }

    public Votante(String denominacion, String siglas, String logo, int votos) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNif() {
        return Nif;
    }

    public void setNif(String Nif) {
        this.Nif = Nif;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getDomicilio() {
        return Domicilio;
    }

    public void setDomicilio(String Domicilio) {
        this.Domicilio = Domicilio;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getVotado() {
        return Votado;
    }

    public void setVotado(String Votado) {
        this.Votado = Votado;
    }

    public String getRol() {
        return Rol;
    }

    public void setRol(String Rol) {
        this.Rol = Rol;
    }

    public LocalDate getFechaNac() {
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String Fecha = FechaNac.format(formato);
        LocalDate FechaFormateada = LocalDate.parse(Fecha, formato);
        return FechaFormateada;
    }

    public String getFechaNacString() {
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return FechaNac.format(formato);
    }
}
