/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author addaw19
 */
public class Conexion {

    public static void rollback() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  
    private Connection conexion;
    private static Conexion conexionUnica = null;
    
    private Conexion() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        String connectionUrl = "jdbc:mysql://localhost/bd_votaciones";
        this.conexion = DriverManager.getConnection(connectionUrl, "root", "");
    }
    
    public synchronized static Conexion Conectar() throws ClassNotFoundException, SQLException{
        if(conexionUnica == null){
            conexionUnica = new Conexion();
        }
        return conexionUnica;
    }
    
    public Connection getConexion(){
        return conexion;
    }
    
    public void destroy() throws SQLException{
        conexion.close();
    }
   
}
