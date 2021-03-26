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
public class ApplicationErrorException extends Exception {
    private String lugar;
    private int error;
    public ApplicationErrorException(String message, int error, String lugar) {
        super(message); 
        setLugar(lugar);
        setError(error);
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public int getError() {
        return error;
    }

    public void setError(int error) {
        this.error = error;
    }

    @Override
    public String toString() {
        return "ApplicationErrorException{" + "lugar=" + lugar + ", error=" + error + '}';
    }
    
    
    
}
