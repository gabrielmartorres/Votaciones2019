/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.Conexion;
import DAO.Operaciones;
import Modelo.ApplicationErrorException;
import Modelo.Parametro;
import Modelo.Votante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author addaw19
 */
public class ControladorEscrutinio extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            Conexion ConexionObj = Conexion.Conectar();
            Connection Conexion = ConexionObj.getConexion();
            
            HttpSession Session = (HttpSession) request.getSession();
            Parametro ObjParametro = (Parametro) Session.getAttribute("Parametro");
            String estado_escrutinio = ObjParametro.getEstado_escrutinio();
           
            //String estado = request.getParameter("estado");
            
            String estado = new Operaciones().escrutinio(estado_escrutinio,Conexion);
            
            if(estado != null){
                ObjParametro.setEstado_escrutinio(estado);
            }
            
            response.sendRedirect("Vistas/VistaMensaje.jsp?codigo=escrutinio_ok");
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
                out.println("Error insertar: " + ex.getMessage());
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