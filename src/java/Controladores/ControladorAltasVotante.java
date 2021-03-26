/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.Conexion;
import DAO.Operaciones;
import Modelo.ApplicationErrorException;
import Modelo.Votante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
//import java.util.logging.Level;
//import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author addaw19
 */
public class ControladorAltasVotante extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try{
            
            Conexion ConexionObj = Conexion.Conectar();
            Connection Conexion = ConexionObj.getConexion();
            
            String nif = request.getParameter("nif");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String domicilio = request.getParameter("domicilio");
            LocalDate fechaNac = LocalDate.parse(request.getParameter("fechaNac"));
            String password = request.getParameter("password");
            
            Votante OVotante = new Votante(nif, nombre, apellidos, domicilio, fechaNac, password);
            
            new Operaciones().insertarVotante(OVotante, Conexion);
            
            response.sendRedirect("Vistas/VistaMensajeVotar.jsp?codigo=alta_ok");
            
        } catch (ClassNotFoundException ex) {
            // conexión no encontrada
           out.println("error clase no encontrada");
        } catch (SQLException ex) {
            // error de conexión
           out.println("error conexión");
        } catch (ApplicationErrorException ex) {
            // error insetar dao ex.getError() ---- ex.getMessage() ----ex.getLugar()
            if(ex.getError() == 1062){
                response.sendRedirect("Vistas/VistaError.jsp?codigo=ya existe este login");
            }else{
                out.println("error insertar: " + ex.getMessage());
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
