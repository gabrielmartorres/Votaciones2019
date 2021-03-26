/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

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
public class ControladorDispatcher extends HttpServlet {

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

        /* TODO output your page here. You may use following sample code. */
        //Conexion ConexionObj = Conexion.Conectar();
        //Connection Conexion = ConexionObj.getConexion();
        HttpSession Session = (HttpSession) request.getSession();
        Votante ObjVotante = (Votante) Session.getAttribute("Votante");
        String rol = ObjVotante.getRol();
        //String votado = ObjVotante.getVotado();

        Parametro ObjParametro = (Parametro) Session.getAttribute("Parametro");
        String estadoEscrutinio = ObjParametro.getEstado_escrutinio();

        String opcion = request.getParameter("opcion");

        switch (rol) {
            case "Administrador":
                switch (estadoEscrutinio) {
                    case "cerrado":
                        switch (opcion) {
                            case "ListadoCenso":
                                response.sendRedirect("ControladorListadoCenso");
                                break;
                            case "AltaVotante":
                                response.sendRedirect("Vistas/VistaAltaVotante.jsp");
                                break;
                            case "ModificarVotante":
                                response.sendRedirect("Vistas/VistaModificarVotante.jsp");
                                break;
                            case "BajaVotante":
                                response.sendRedirect("Vistas/VistaBajaVotante.jsp");
                                break;
                            case "Escrutinio":
                                response.sendRedirect("Vistas/VistaEscrutinio.jsp");
                                break;
                            default:
                                response.sendRedirect("Vistas/VistaError.jsp?codigo=Escrutinio cerrado");
                        }
                        break;
                    case "abierto":
                        switch (opcion) {
                            case "ListadoCenso":
                                response.sendRedirect("ControladorListadoCenso");
                                break;
                            case "Votar":
                                if(ObjVotante.getVotado().equals("S")){
                                    response.sendRedirect("Vistas/VistaError.jsp?codigo=votado_ok");
                                }else{
                                    response.sendRedirect("ControladorObtenerPartidos");
                                }
                                break;
                            case "Escrutinio":
                                response.sendRedirect("Vistas/VistaEscrutinio.jsp");
                                break;
                            default:
                                response.sendRedirect("Vistas/VistaError.jsp?codigo=Escrutinio abierto");
                        }
                        break;
                    case "finalizado":
                        switch (opcion) {
                            case "ListadoCenso":
                                response.sendRedirect("ControladorListadoCenso");
                                break;
                            case "Electos":
                                response.sendRedirect("ControladorMostrarElectos");
                                break;
                            case "Escrutinio":
                                response.sendRedirect("Vistas/VistaEscrutinio.jsp");
                                break;
                            default:
                                response.sendRedirect("Vistas/VistaError.jsp?codigo=Escrutinio finalizado");
                        }
                        break;
                    
                }
                break;

            case "Votante":
                switch (estadoEscrutinio) {
                    case "cerrado":
                        switch (opcion) {
                            case "AltaVotante":
                                response.sendRedirect("Vistas/VistaAltaVotante.jsp");
                                break;
                            case "ModificarVotante":
                                response.sendRedirect("Vistas/VistaModificarVotante.jsp");
                                break;
                            case "BajaVotante":
                                response.sendRedirect("Vistas/VistaBajaVotante.jsp");
                                break;
                            default:
                                response.sendRedirect("Vistas/VistaError.jsp?codigo=Escrutinio cerrado");
                        }
                        break;
                    case "abierto":
                        switch (opcion) {
                            case "Votar":
                                if(ObjVotante.getVotado().equals("S")){
                                    response.sendRedirect("Vistas/VistaError.jsp?codigo=votado_ok");
                                }else{
                                    response.sendRedirect("ControladorObtenerPartidos");
                                }
                                break;
                            default:
                                response.sendRedirect("Vistas/VistaError.jsp?codigo=Escrutinio abierto");
                        }
                        break;
                    case "finalizado":
                        switch (opcion) {
                            case "Electos":
                                response.sendRedirect("ControladorMostrarElectos");
                                break;
                            default:
                                response.sendRedirect("Vistas/VistaError.jsp?codigo=Escrutinio finalizado");
                        }
                        break;
                    
                }
                
                break;
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
