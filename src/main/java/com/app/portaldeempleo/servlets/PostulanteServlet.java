package com.app.portaldeempleo.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.portaldeempleo.daos.PostulanteDAO;
import com.app.portaldeempleo.daos.UserDAO;
import com.app.portaldeempleo.dto.Postulante;
import com.app.portaldeempleo.entidades.Usuario;
import com.app.portaldeempleo.gestorpostulantes.dto.PostulanteBusquedad;
import com.app.portaldeempleo.serviceGestorEJB.ServicioGestorPostulantes;
import com.app.portaldeempleo.serviceGestorEJB.ServicioGestorUsuarios;

/**
 * Servlet implementation class PostulanteServlet
 */
@WebServlet("/PostulanteServlet")
public class PostulanteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private ServicioGestorUsuarios servicioGestorUsuarios;
	
	@Inject
	private ServicioGestorPostulantes servicioGestorPostulantes;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostulanteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,  IOException {
	
        
	    String candidatoId = request.getParameter("id");

		int id = Integer.parseInt(candidatoId);

	    System.out.println("candidatoId"  + candidatoId);
	    
	    PostulanteBusquedad postulante = servicioGestorPostulantes.buscarPostulantePorId(id);
	    
	    request.setAttribute("postulante", postulante);
	    
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/gestorpostulantes/candidate-detail.jsp");
        
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String salario = request.getParameter("salario");
	    String mensaje = request.getParameter("mensaje");
	    String puestoTrabajoId = request.getParameter("puestoTrabajoId");
	    String cv = "cv_example.pdf";
	    int statusTrabajoId = 2;
	    int puestoTrabajo = Integer.parseInt(puestoTrabajoId);

	  	Postulante postulante = new Postulante();
	  	postulante.setIdPuestoTrabajo(puestoTrabajo);
	  	postulante.setMensaje(mensaje);
	  	postulante.setEstatusPuestoTrabajoId(statusTrabajoId);
	  	postulante.setCurriculumVitae(cv);
	  	postulante.setSalarioPropuesto(salario);

	  	
	  	try {
	  		
	  		HttpSession session = request.getSession();
    		
    		Integer idUsuario = (Integer) session.getAttribute("idUsuario");
    		
    		System.out.println("idUsuario" + idUsuario );

    		
    		if (idUsuario == null) {
    			
    			response.sendRedirect(request.getContextPath() + "/puestos-trabajo");
    			
    		} else {
    			
    			Usuario user = servicioGestorUsuarios.obtenerUsuario(idUsuario);
    		
    			postulante.setIdUsuario(user.getId());

    	        PostulanteDAO postulanteDAO = new PostulanteDAO();
    	        
    	        postulanteDAO.insertarPostulante(postulante);
    		}
	        
	        response.sendRedirect(request.getContextPath() + "/puestos-trabajo");
	        
	    } catch (SQLException e) {
	    	
	        e.printStackTrace();
	        
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	    }
	}
}
