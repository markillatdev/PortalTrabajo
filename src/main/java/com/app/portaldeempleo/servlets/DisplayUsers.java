package com.app.portaldeempleo.servlets;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.portaldeempleo.entidades.Usuario;
import com.app.portaldeempleo.serviceGestorEJB.ServicioGestorUsuarios;
import com.app.portaldeempleo.serviceGestorEJB.ServicioSession;
import com.app.portaldeempleo.utils.PasswordUtils;

import java.util.Date;


/**
 * Servlet implementation class DisplayUsers
 */
@WebServlet("/DisplayUsers")
public class DisplayUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioGestorUsuarios servicioGestorUsuarios;
	
	@Inject
	private ServicioSession servicioSession;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		String username = request.getParameter("nombre");
		String email = request.getParameter("email");
		String telefono = request.getParameter("telefono");
		String direccion = request.getParameter("direccion");
		String password = request.getParameter("password");
	    Date fechaNacimiento = new Date();
		
		Usuario user = new Usuario();
		user.setNombre(username);
		user.setPassword(PasswordUtils.hashPassword(password));
		user.setCorreoElectronico(email);
		user.setDireccion(direccion);
		user.setTelefono(telefono);
		user.setFechaNacimiento(fechaNacimiento);
		
		servicioGestorUsuarios.registrarUsuario(user);
		
		servicioSession.almacenarDatosSession(request, user);
		
	    //response.sendRedirect(request.getContextPath() + "/completar-registro");
	    
	    request.setAttribute("registro", true);	
	    
	    request.setAttribute("usuario", user);
		 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/gestorusuarios/candidate-profile.jsp");
	        
		dispatcher.forward(request, response);

	}
	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

}
