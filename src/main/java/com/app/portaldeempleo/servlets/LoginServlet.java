package com.app.portaldeempleo.servlets;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.portaldeempleo.entidades.Usuario;
import com.app.portaldeempleo.serviceGestorEJB.ServicioGestorUsuarios;
import com.app.portaldeempleo.serviceGestorEJB.ServicioSession;
import com.app.portaldeempleo.utils.PasswordUtils;
import com.google.common.base.Preconditions;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private ServicioGestorUsuarios servicioGestorUsuarios;
	
	@Inject
	private ServicioSession servicioSession;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
	
		String email = request.getParameter("correo");
		String password = request.getParameter("password");
		
		Preconditions.checkNotNull(email, "El email no puede ser nulo");
	    Preconditions.checkNotNull(password, "El password no puede ser nulo");

		Usuario user = servicioGestorUsuarios.buscarEmail(email);
		
		System.out.println("user" + user );
		
		if (user != null && PasswordUtils.checkPassword(password, user.getPassword())) {
			servicioSession.almacenarDatosSession(request, user);
		}

		response.sendRedirect(request.getContextPath() + "/puestos-trabajo");
	}
}
