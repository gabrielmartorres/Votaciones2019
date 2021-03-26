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
import java.util.ArrayList;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author addaw19
 */
public class ControladorVotarPartido extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try{
            Conexion ConexionObj = Conexion.Conectar();
            Connection Conexion = ConexionObj.getConexion();
            
            String siglas = request.getParameter("partidos");
            HttpSession Session = (HttpSession) request.getSession();
            Votante ObjVotante = (Votante) Session.getAttribute("Votante");
            
            Conexion.setAutoCommit(false);
            new Operaciones().votar(ObjVotante, Conexion);   
           
            new Operaciones().registrarVoto(siglas, Conexion);
            Conexion.commit();
            Conexion.setAutoCommit(true);
            response.sendRedirect("Vistas/VistaMensajeVotar.jsp?codigo=voto_ok"); 
            
        } catch (ClassNotFoundException ex) {
            // conexión no encontrada
           out.println("error clase no encontrada");
        } catch (SQLException ex) {
            // error de conexión
           out.println("error conexión");
           Conexion.rollback();
        } catch (ApplicationErrorException ex) {
            // error insetar dao ex.getError() ---- ex.getMessage() ----ex.getLugar()
            if(ex.getError() == 1062){
                response.sendRedirect("Vistas/VistaError.jsp?codigo=Error en el listado");
            }else{
                out.println("error listar: " + ex.getMessage());
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
