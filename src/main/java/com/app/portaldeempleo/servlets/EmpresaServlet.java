package com.app.portaldeempleo.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.portaldeempleo.daos.EmpresaDAO;
import com.app.portaldeempleo.dto.Empresa;

/**
 * Servlet implementation class EmpresaServlet
 */
@WebServlet("/EmpresaServlet")
public class EmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpresaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    
		  String nombreEmpresa = request.getParameter("nombreEmpresa");
		  String correoEmpresa = request.getParameter("correoEmpresa");
		  String direccionEmpresa = request.getParameter("direccionEmpresa");
		  String telefono = request.getParameter("telefono");
		  
		  Empresa empresa = new Empresa();
		  empresa.setNombreEmpresa(nombreEmpresa);
		  empresa.setCorreoElectronico(correoEmpresa);
		  empresa.setDireccion(direccionEmpresa);
		  empresa.setTelefono(telefono);
		  
		  try {
		        EmpresaDAO empresaDAO = new EmpresaDAO();
		        
		        empresaDAO.insertarEmpresa(empresa);
		        
		        response.sendRedirect(request.getContextPath() + "/crear-trabajo");
		        
		    } catch (SQLException e) {
		    	
		        e.printStackTrace();
		        
		        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		    }
		  
	}

}
