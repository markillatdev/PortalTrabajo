package com.app.portaldeempleo.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.portaldeempleo.daos.EmpresaDAO;
import com.app.portaldeempleo.daos.PuestoTrabajoDAO;
import com.app.portaldeempleo.dto.Empresa;
import com.app.portaldeempleo.dto.PuestoTrabajo;
import com.app.portaldeempleo.entidades.Usuario;
import com.app.portaldeempleo.serviceGestorEJB.ServicioGestorUsuarios;


/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("/FrontControllerServlet")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private ServicioGestorUsuarios servicioGestorUsuarios;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	String uri = request.getRequestURI();
    	System.out.println("uri: " + uri);
    	if (uri.endsWith("/puestos-trabajo")) {
    		
		  	PuestoTrabajoDAO puestosTrabajoDAO = new PuestoTrabajoDAO();
	        List<PuestoTrabajo> list_puestos = null;         
	         try {
	        	 list_puestos = puestosTrabajoDAO.getPuestosDeTrabajo();
	 	    } catch (SQLException e) {
	 	        e.printStackTrace();
	 	    }
		    System.out.println("list_puestos: " + list_puestos);
	        request.setAttribute("puestosTrabajo", list_puestos);	
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Template/index.jsp");
	        dispatcher.forward(request, response);
    	        
    	} else if(uri.endsWith("/detalle-trabajo")) {
    		
    		String trabajoId = request.getParameter("trabajoId");
    	    int trabajoIdInt = Integer.parseInt(trabajoId);

    		PuestoTrabajoDAO puestosTrabajoDAO = new PuestoTrabajoDAO();
	        PuestoTrabajo detalleTrabajo = null;
	        
	        EmpresaDAO empresaDAO = new EmpresaDAO();
	        Empresa empresa = null;
	        
	         try {
	        	 
	        	 detalleTrabajo = puestosTrabajoDAO.obtenerPorId(trabajoIdInt);
	        	 empresa = empresaDAO.getEmpresaById(detalleTrabajo.getIdEmpresa());
	        	 
	 	    } catch (SQLException e) {
	 	        e.printStackTrace();
	 	    }
	         
	        request.setAttribute("detalleTrabajo", detalleTrabajo);	
	        request.setAttribute("empresa", empresa);	
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Template/job-detail.jsp");
	        dispatcher.forward(request, response);
    	
    	} else if(uri.endsWith("/completar-registro")) {
    		
    		 
    		HttpSession session = request.getSession();
    		    		
    		Integer idUsuario = (Integer) session.getAttribute("idUsuario");
    		
    		System.out.println("idUsuario" + idUsuario );

    		
    		if (idUsuario == null) {
    			
    			response.sendRedirect(request.getContextPath() + "/puestos-trabajo");
    			
    		} else {
    			
    			Usuario user = servicioGestorUsuarios.obtenerUsuario(idUsuario);
    			
    			request.setAttribute("perfil", true);	
    			
    			request.setAttribute("usuario", user);	
    	    		
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/gestorusuarios/candidate-profile.jsp");
	 	        
	    		dispatcher.forward(request, response);
    		}

    		
    	} else {
    	    response.sendError(HttpServletResponse.SC_NOT_FOUND);
    	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String joblist = request.getParameter("joblist");
		
		PuestoTrabajoDAO puestosTrabajoDAO = new PuestoTrabajoDAO();
		
        List<PuestoTrabajo> puestos = null;  
        
         try {
        	 puestos = puestosTrabajoDAO.buscarPuestoTrabajo(joblist);
 	    } catch (SQLException e) {
 	        e.printStackTrace();
 	    }

        request.setAttribute("puestosTrabajo", puestos);	
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Template/index.jsp");
        
        dispatcher.forward(request, response);
	        
	}
}
