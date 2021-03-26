/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Gabriel
 */
public class Partido implements Comparable<Partido> {
    private int id;
    private String demonimacion;
    private String siglas;
    private String logo;
    private int votos;

    public Partido(String demonimacion, String siglas, String logo, int votos) {
        this.demonimacion = demonimacion;
        this.siglas = siglas;
        this.logo = logo;
        this.votos = votos;
    }

    public Partido(int id, String demonimacion, String siglas, String logo, int votos) {
        this.id = id;
        this.demonimacion = demonimacion;
        this.siglas = siglas;
        this.logo = logo;
        this.votos = votos;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDemonimacion() {
        return demonimacion;
    }

    public void setDemonimacion(String demonimacion) {
        this.demonimacion = demonimacion;
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

    public int getVotos() {
        return votos;
    }

    public void setVotos(int votos) {
        this.votos = votos;
    }

    @Override
    public String toString() {
        return "Partido{" + "id=" + id + ", demonimacion=" + demonimacion + ", siglas=" + siglas + ", logo=" + logo + ", votos=" + votos + '}';
    }
    
    @Override
    public int compareTo(Partido o){
        if(this.votos<o.votos){
            return -1;
        }else if(this.votos>o.votos){
            return 1;
        }
        return 0;
    }
}
