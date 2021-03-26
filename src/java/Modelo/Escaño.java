/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Objects;

/**
 *
 * @author addaw19
 */
public class Escaño {
    private int id;
    private String siglas;
    private String logo;
    private int numeroEscaños;

    public Escaño(int id, String siglas, String logo, int numeroEscaños) {
        this.id = id;
        this.siglas = siglas;
        this.logo = logo;
        this.numeroEscaños = numeroEscaños;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSiglas() {
        return siglas;
    }

    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getNumeroEscaños() {
        return numeroEscaños;
    }

    public void setNumeroEscaños(int numeroEscaños) {
        this.numeroEscaños = numeroEscaños;
    }

    @Override
    public String toString() {
        return "Esca\u00f1o{" + "id=" + id + ", siglas=" + siglas + ", logo=" + logo + ", numeroEsca\u00f1os=" + numeroEscaños + '}';
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + Objects.hashCode(this.siglas);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Escaño other = (Escaño) obj;
        if (!Objects.equals(this.siglas, other.siglas)) {
            return false;
        }
        return true;
    }

    
    
    
}
