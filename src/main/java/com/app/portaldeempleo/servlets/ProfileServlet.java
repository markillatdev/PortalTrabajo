package com.app.portaldeempleo.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.portaldeempleo.dto.Perfil;
import com.app.portaldeempleo.entidades.Usuario;
import com.app.portaldeempleo.serviceGestorEJB.ServicioGestorUsuarios;
import com.app.portaldeempleo.utils.PasswordUtils;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private ServicioGestorUsuarios servicioGestorUsuarios;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
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
		
		String userId = request.getParameter("userId");
		String nombre = request.getParameter("nombreCompleto");
		String apellido = request.getParameter("apellidoCompleto");
		String email = request.getParameter("email");
		String telefono = request.getParameter("telefono");
		String direccion = request.getParameter("direccion");
		String password = request.getParameter("password");
		String ciudad = request.getParameter("ciudad");
		String pais = request.getParameter("pais");
		String anioExp = request.getParameter("anioExp");
		String acercaMi = request.getParameter("acercaMi");
		String experienciaLaboral = request.getParameter("experienciaLaboral");
		String[] habilidades = request.getParameterValues("habilidades");
		
		List<String> habilidadesSeleccionadas = new ArrayList<>();

		if (habilidades != null) {
		    for (String habilidad : habilidades) {
		    	System.out.println("habilidades: " + habilidad );
		    
		        habilidadesSeleccionadas.add(habilidad);
		    }
		}
		
		String habilidadesString = String.join(",", habilidadesSeleccionadas);

		Integer idUsuario = null;
		
		if(userId == "" || userId == null) {
			
			HttpSession session = request.getSession();
    		
    		idUsuario = (Integer) session.getAttribute("idUsuario");
    		
		} else {
			idUsuario = Integer.parseInt(userId);
		}
		
		Perfil perfil = new Perfil();
		perfil.setId(idUsuario);
		perfil.setNombre(nombre);
		perfil.setApellido(apellido);
		perfil.setPassword(PasswordUtils.hashPassword(password));
		perfil.setCorreoElectronico(email);
		perfil.setDireccion(direccion);
		perfil.setTelefono(telefono);
		perfil.setCiudad(ciudad);
		perfil.setAcercaMi(acercaMi);
		perfil.setPais(pais);
		perfil.setAniosExperiencia(anioExp);
		perfil.setExperienciaLaboral(experienciaLaboral);
		perfil.setHabilidades(habilidadesString);
		
		Usuario usuarioActualizado = servicioGestorUsuarios.actualizarUsuario(perfil);
		
		request.setAttribute("perfil", true);	
	    
	    request.setAttribute("usuario", usuarioActualizado);
	    
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/gestorusuarios/candidate-profile.jsp");
        
		dispatcher.forward(request, response);
	}
}
