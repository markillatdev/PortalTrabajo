package com.app.portaldeempleo.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.portaldeempleo.daos.EmpresaDAO;
import com.app.portaldeempleo.daos.PuestoTrabajoDAO;
import com.app.portaldeempleo.dto.Empresa;
import com.app.portaldeempleo.dto.PuestoTrabajo;

/**
 * Servlet implementation class PuestoTrabajoServlet
 */
@WebServlet("/crear-trabajo")
public class PuestoTrabajoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PuestoTrabajoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	 EmpresaDAO empresaDAO = new EmpresaDAO();
    	
    	 Empresa empresa = null;
	        
         try {
        	 empresa = empresaDAO.getEmpresaByLastId();
        	 
 	    } catch (SQLException e) {
 	        e.printStackTrace();
 	    }
         
        request.setAttribute("empresa", empresa);	
    	
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Template/create-job.jsp");
        
        dispatcher.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 
	    String nombrePuesto = request.getParameter("nombrePuesto");
	    String salario = request.getParameter("salario");
	    String tipoTrabajo = request.getParameter("tipo_trabajo");
	    String descripcion = request.getParameter("descripcion");
	    String empresa = request.getParameter("empresaId");
	    Date fechaCierre = new Date();
	    
	    int empresaId = Integer.parseInt(empresa);

	    PuestoTrabajo nuevoPuesto = new PuestoTrabajo();
	    nuevoPuesto.setNombrePuesto(nombrePuesto);
	    nuevoPuesto.setDescripcion(descripcion);
	    nuevoPuesto.setSalario(salario);
	    nuevoPuesto.setFechaCierre(fechaCierre);
	    nuevoPuesto.setIdEmpresa(empresaId);
	    nuevoPuesto.setTipoTrabajo(tipoTrabajo);
	    

	    PuestoTrabajoDAO puestoTrabajoDAO = new PuestoTrabajoDAO();
	    
	    try {
	        puestoTrabajoDAO.insertarPuestoDeTrabajo(nuevoPuesto);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    response.sendRedirect(request.getContextPath() + "/puestos-trabajo");
	}

}
