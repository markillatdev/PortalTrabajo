package com.app.portaldeempleo.servlets;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.portaldeempleo.gestorpostulantes.dto.PostulanteBusquedad;
import com.app.portaldeempleo.serviceGestorEJB.ServicioGestorPostulantes;

/**
 * Servlet implementation class BackOfficeServlet
 */
@WebServlet("/lista-candidatos")
public class BackOfficeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private ServicioGestorPostulantes servicioGestorPostulantes;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackOfficeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String searchTerm = request.getParameter("value");
		
        List<PostulanteBusquedad> list_postulantes = servicioGestorPostulantes.consultarPostulante(searchTerm);
         
        request.setAttribute("postulantes", list_postulantes);	
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Template/manage-candidate.jsp");
        
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		  int idPostulante = Integer.parseInt(request.getParameter("id"));
		    
		  String nuevoEstado = request.getParameter("estado");
		 
		  servicioGestorPostulantes.actualizarEstado(idPostulante, nuevoEstado);
		 
		  response.sendRedirect(request.getContextPath() + "/lista-candidatos");
	}
}
