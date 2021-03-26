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
public class Parametro {
    private int id;
    private String circuscripcion;
    private int candidatos_elegir;
    private String tipo_consulta;
    private LocalDate fecha_consulta;
    private String estado_escrutinio;
    private String frase;

    public Parametro(String circuscripcion, int candidatos_elegir, String tipo_consulta, LocalDate fecha_consulta, String estado_escrutinio, String frase) {
        this.circuscripcion = circuscripcion;
        this.candidatos_elegir = candidatos_elegir;
        this.tipo_consulta = tipo_consulta;
        this.fecha_consulta = fecha_consulta;
        this.estado_escrutinio = estado_escrutinio;
        this.frase = frase;
    }

    public Parametro() {
      
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCircuscripcion() {
        return circuscripcion;
    }

    public void setCircuscripcion(String circuscripcion) {
        this.circuscripcion = circuscripcion;
    }

    public int getCandidatos_elegir() {
        return candidatos_elegir;
    }

    public void setCandidatos_elegir(int candidatos_elegir) {
        this.candidatos_elegir = candidatos_elegir;
    }

    public String getTipo_consulta() {
        return tipo_consulta;
    }

    public void setTipo_consulta(String tipo_consulta) {
        this.tipo_consulta = tipo_consulta;
    }

    public String getEstado_escrutinio() {
        return estado_escrutinio;
    }

    public void setEstado_escrutinio(String estado_escrutinio) {
        this.estado_escrutinio = estado_escrutinio;
    }

    public String getFrase() {
        return frase;
    }

    public void setFrase(String frase) {
        this.frase = frase;
    }
    
//    public String getFecha_consulta() {
//        return fecha_consulta;
//    }
//
//    public void setFecha_consulta(String fecha_consulta) {
//        this.fecha_consulta = fecha_consulta;
//    }
    
    public LocalDate getFecha_consulta() {
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String Fecha = fecha_consulta.format(formato);
        LocalDate FechaFormateada = LocalDate.parse(Fecha, formato);
        return FechaFormateada;
    }

    public String getFechaConsultaString() {
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return fecha_consulta.format(formato);
    }

    @Override
    public String toString() {
        return "Parametro{" + "id=" + id + ", circuscripcion=" + circuscripcion + ", candidatos_elegir=" + candidatos_elegir + ", tipo_consulta=" + tipo_consulta + ", fecha_consulta=" + fecha_consulta + ", estado_escrutinio=" + estado_escrutinio + ", frase=" + frase + '}';
    }
    
    
    
    
    
}


