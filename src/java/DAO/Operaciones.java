/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Modelo.ApplicationErrorException;
import Modelo.Electo;
import Modelo.Escaño;
import Modelo.Parametro;
import Modelo.Partido;
import Modelo.Votante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author addaw19
 */
public class Operaciones extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Operaciones</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Operaciones at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

//   
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

    public void insertarVotante(Votante OVotante, Connection Conexion) throws ApplicationErrorException {
        Parametro ObjParametro = cargarParametros(Conexion);
        String estadoEscrutinio = ObjParametro.getEstado_escrutinio();
        if (estadoEscrutinio.equals("cerrado")) {
            try {
                //Insertar votante
                String OrdenSQL = "INSERT INTO VOTANTE VALUES ( null,?,?,?,?,?, AES_ENCRYPT(?,'gabriel'),'N', 'Votante')";
                PreparedStatement PrepStm = Conexion.prepareStatement(OrdenSQL);

                PrepStm.setString(1, OVotante.getNif());
                PrepStm.setString(2, OVotante.getNombre());
                PrepStm.setString(3, OVotante.getApellidos());
                PrepStm.setString(4, OVotante.getDomicilio());
                PrepStm.setDate(5, java.sql.Date.valueOf(OVotante.getFechaNac()));
                PrepStm.setString(6, OVotante.getPassword());

                int filas = PrepStm.executeUpdate();
                if (filas != 1) {
                    throw new ApplicationErrorException("Votante no creado", 0, "Operaciones.insertarVotante()");
                }

            } catch (SQLException SQLE) {
                String mensaje = SQLE.getMessage();
                int codigoerror = SQLE.getErrorCode();
                throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
            }
        } else {
            throw new ApplicationErrorException("No puedes darte de alta, el escrutinio no está cerrado.", 0, "Operaciones.insertarVotante()");
        }
    }

    public void eliminarVotante(String nif, Connection Conexion) throws ApplicationErrorException {
        try {

            PreparedStatement PrepStm = Conexion.prepareStatement("DELETE FROM VOTANTE WHERE NIF=?");
            PrepStm.setString(1, nif);
            int filas = PrepStm.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("Votante no borrado", 0, "Operaciones.eliminarVotante()");
            }

        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
        }
    }

    public Votante iniciarSesionVotante(String nif, String password, Connection Conexion) throws ApplicationErrorException {
        try {
            //PreparedStatement PrepStm = Conexion.prepareStatement("SELECT * FROM VOTANTE WHERE NIF= ? AND AES_DECRYPT(PASSWORD,'gabriel')=? AND VOTADO = 'N'");
            PreparedStatement PrepStm = Conexion.prepareStatement("SELECT * FROM VOTANTE WHERE NIF= ? AND AES_DECRYPT(PASSWORD,'gabriel')=?");
            PrepStm.setString(1, nif);
            PrepStm.setString(2, password);
            ResultSet rs = PrepStm.executeQuery();
            Votante OVotante;
            if (rs.next()) {
                LocalDate fechaNac = LocalDate.parse(rs.getString("fecha_nac"));
                return OVotante = new Votante(rs.getString("nif"), rs.getString("nombre"), rs.getString("apellidos"), rs.getString("domicilio"), fechaNac, password, rs.getString("votado"), rs.getString("rol"));
            } else {
                return OVotante = new Votante();
            }
        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
        }
    }

    public void modificarVotante(Votante OVotante, Connection Conexion) throws ApplicationErrorException {
        try {
            String OrdenSQL = "UPDATE VOTANTE SET nombre=?, apellidos=?, domicilio=?, fecha_nac=?, password=AES_ENCRYPT(?,'gabriel') WHERE nif=?";
            PreparedStatement PrepStm = Conexion.prepareStatement(OrdenSQL);

            PrepStm.setString(1, OVotante.getNombre());
            PrepStm.setString(2, OVotante.getApellidos());
            PrepStm.setString(3, OVotante.getDomicilio());
            PrepStm.setDate(4, java.sql.Date.valueOf(OVotante.getFechaNac()));
            PrepStm.setString(5, OVotante.getPassword());
            PrepStm.setString(6, OVotante.getNif());

            int filas = PrepStm.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("Votante no modificado", 0, "Operaciones.modificarVotante()");
            }
        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
        }
    }

    public ArrayList listarCenso(Connection Conexion) throws ApplicationErrorException {
        try {
            Statement stmt = Conexion.createStatement();
            ResultSet OrdenSQL = stmt.executeQuery("SELECT * FROM votante");

            ArrayList<Votante> listadoCenso = new ArrayList<Votante>();

            while (OrdenSQL.next()) {

                String nif = OrdenSQL.getString("nif");
                String nombre = OrdenSQL.getString("nombre");
                String apellidos = OrdenSQL.getString("apellidos");
                String domicilio = OrdenSQL.getString("domicilio");
                LocalDate fechaNac = LocalDate.parse(OrdenSQL.getString("fecha_nac"));
                String password = OrdenSQL.getString("password");
                String votado = OrdenSQL.getString("votado");
                String rol = OrdenSQL.getString("rol");

                Votante ObjVotante = new Votante(nif, nombre, apellidos, domicilio, fechaNac, password, votado, rol);
                listadoCenso.add(ObjVotante);
            }
            if (OrdenSQL.next()) {
                return listadoCenso;
            } else {
                return listadoCenso;
            }

        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
        }

    }

    public String escrutinio(String estado_escrutinio, Connection Conexion) throws ApplicationErrorException {
        try {
            String estado = "estado";
            if (estado_escrutinio.equals("cerrado")) {
                //Aquí hacer el update para abrirlo
                String OrdenSQL = "UPDATE parametros SET estado_escrutinio=?";
                PreparedStatement PrepStm = Conexion.prepareStatement(OrdenSQL);
                PrepStm.setString(1, "abierto");
                estado = "abierto";

                int filas = PrepStm.executeUpdate();
                if (filas != 1) {
                    throw new ApplicationErrorException("Escrutinio no modificado", 0, "Operaciones.escrutinio()");
                } else {
                    return estado;
                }
            }
            if (estado_escrutinio.equals("abierto")) {
                //Aquí hacer el update para abrirlo
                String OrdenSQL = "UPDATE parametros SET estado_escrutinio=?";
                PreparedStatement PrepStm = Conexion.prepareStatement(OrdenSQL);
                PrepStm.setString(1, "finalizado");
                estado = "finalizado";

                int filas = PrepStm.executeUpdate();
                if (filas != 1) {
                    throw new ApplicationErrorException("Escrutinio no modificado", 0, "Operaciones.escrutinio()");
                } else {
                    return estado;
                }
            }

        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "Error SQL en escrutinio");
        }
        return null;
    }

    public Parametro cargarParametros(Connection Conexion) throws ApplicationErrorException {
        try {
            PreparedStatement PrepStm = Conexion.prepareStatement("SELECT * FROM PARAMETROS");
            ResultSet rs = PrepStm.executeQuery();
            Parametro ObjParametro;
            if (rs.next()) {
                LocalDate fecha_consulta = LocalDate.parse(rs.getString("fecha_consulta"));
                return ObjParametro = new Parametro(rs.getString("circuscripcion"), rs.getInt("candidatos_elegir"), rs.getString("tipo_consulta"), fecha_consulta, rs.getString("estado_escrutinio"), rs.getString("frase"));
            } else {
                return ObjParametro = new Parametro();
            }
        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
        }
    }

    public ArrayList listarPartido(Connection Conexion) throws ApplicationErrorException {
        try {
            Statement stmt = Conexion.createStatement();
            ResultSet OrdenSQL = stmt.executeQuery("SELECT * FROM partido");

            ArrayList<Partido> listadoPartido = new ArrayList<Partido>();

            while (OrdenSQL.next()) {

                String denominacion = OrdenSQL.getString("denominacion");
                String siglas = OrdenSQL.getString("siglas");
                String logo = OrdenSQL.getString("logo");
                int votos = OrdenSQL.getInt("votos");

                Partido ObjPartido = new Partido(denominacion, siglas, logo, votos);
                listadoPartido.add(ObjPartido);
            }
            if (OrdenSQL.next()) {
                return listadoPartido;
            } else {
                return listadoPartido;
            }

        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
        }
    }

    public void votar(Votante ObjVotante, Connection Conexion) throws ApplicationErrorException {
        try {
            String OrdenSQL = "UPDATE VOTANTE SET votado='S' WHERE nif=?";
            PreparedStatement PrepStm = Conexion.prepareStatement(OrdenSQL);

            PrepStm.setString(1, ObjVotante.getNif());

            int filas = PrepStm.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("Votante no modificado", 0, "Operaciones.votar()");
            }
        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
        }
    }

    public void registrarVoto(String siglas, Connection Conexion) throws ApplicationErrorException {
        try {
            String OrdenSQL = "UPDATE PARTIDO SET votos=votos + 1 WHERE siglas=?";
            PreparedStatement PrepStm = Conexion.prepareStatement(OrdenSQL);

            PrepStm.setString(1, siglas);

            int filas = PrepStm.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("Partido no modificado", 0, "Operaciones.registrarVoto()");
            }
        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
        }
    }

    public ArrayList<Electo> getElectos(int numeroEscaños, Connection Conexion) throws ApplicationErrorException {
        try {
            Statement stmt = Conexion.createStatement();
            String OrdenSQL = "Select * FROM PARTIDO";
            ResultSet rs = stmt.executeQuery(OrdenSQL);

            ArrayList<Partido> ArrayPartidos = new ArrayList();

            while (rs.next()) {
                int id = rs.getInt("id");
                String denominacion = rs.getString("denominacion");
                String siglas = rs.getString("siglas");
                String logo = rs.getString("logo");
                int votos = rs.getInt("votos");

                Partido ObjPartido = new Partido(id, denominacion, siglas, logo, votos);
                ArrayPartidos.add(ObjPartido);
            }

            ArrayPartidos.sort(Collections.reverseOrder());

            ArrayList<Escaño> ArrayEscaños = new ArrayList();

            for (int i = 0; i < numeroEscaños; i++) {
                int idPartido = ArrayPartidos.get(0).getId();
                String siglas = ArrayPartidos.get(0).getSiglas();
                String logo = ArrayPartidos.get(0).getLogo();

                Escaño ObjEscaño = new Escaño(idPartido, siglas, logo, 1);
                int indice = ArrayEscaños.indexOf(ObjEscaño);

                if (indice == -1) {
                    ArrayEscaños.add(ObjEscaño);
                } else {
                    ObjEscaño = ArrayEscaños.get(indice);
                    ObjEscaño.setNumeroEscaños(ObjEscaño.getNumeroEscaños() + 1);
                    ArrayEscaños.set(indice, ObjEscaño);
                }

                ArrayPartidos.get(0).setVotos(ArrayPartidos.get(0).getVotos() / 2);

                ArrayPartidos.sort(Collections.reverseOrder());
            }

            ArrayList<Electo> ArrayElectos = new ArrayList();
            for (Escaño ObjEscaño : ArrayEscaños) {
                String OrdenSQL2 = "SELECT C.id ,C.nombre_apellidos, P.siglas, P.logo FROM Candidatos C, partido P WHERE P.id=C.id_partido AND id_partido=" + ObjEscaño.getId() + " AND C.orden BETWEEN 1 AND " + ObjEscaño.getNumeroEscaños() + " ORDER BY orden";

                Statement stment = Conexion.createStatement();
                ResultSet rset = stment.executeQuery(OrdenSQL2);
                while (rset.next()) {

                    ArrayElectos.add(new Electo(rset.getInt("id"), rset.getString("siglas"), rset.getString("logo"), rset.getString("nombre_apellidos")));

                }
            }
            return ArrayElectos;
        } catch (SQLException SQLE) {
            String mensaje = SQLE.getMessage();
            int codigoerror = SQLE.getErrorCode();
            throw new ApplicationErrorException(mensaje, codigoerror, "TEXTO ERROR");
        }
    }
}
