package com.app.portaldeempleo.serviceGestorEJB;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.app.portaldeempleo.entidades.Usuario;
import com.google.common.base.Preconditions;
import org.apache.commons.lang3.StringUtils; // Apache Commons Lang
import org.slf4j.Logger;
import org.slf4j.LoggerFactory; // Logback/SLF4J

@Stateless
@LocalBean
public class ServicioSession {

    // Logger para Logback
    private static final Logger logger = LoggerFactory.getLogger(ServicioSession.class);

    public ServicioSession() {
        // Constructor vacío
    }

    public void almacenarDatosSession(HttpServletRequest request, Usuario user) {
        // Validar parámetros principales
        Preconditions.checkNotNull(request, "El objeto HttpServletRequest no puede ser nulo");
        Preconditions.checkNotNull(user, "El objeto Usuario no puede ser nulo");
        Preconditions.checkNotNull(user.getId(), "El ID del usuario no puede ser nulo");

        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(60 * 60); // 1 hora

        // Determinar el rol
        int role = (user.getRole() == null || user.getRole().getId() == 1) ? 1 : 2;

        // Manejar nombre con Apache Commons
        String nombreUsuario = StringUtils.defaultString(user.getNombre(), "UsuarioDesconocido");
        if (user.getNombre() == null) {
            logger.warn("El nombre del usuario con ID {} es nulo, se usará el valor por defecto: {}", 
                        user.getId(), nombreUsuario);
        }

        // Manejar correo con Guava
        String correoElectronico = StringUtils.defaultString(user.getCorreoElectronico(), "sin_correo@dominio.com");
        if (user.getCorreoElectronico() == null) {
            logger.warn("El correo electrónico del usuario con ID {} es nulo, se usará el valor por defecto: {}", 
                        user.getId(), correoElectronico);
        }

        // Almacenar en la sesión
        session.setAttribute("nombreUsuario", nombreUsuario);
        session.setAttribute("correoElectronico", correoElectronico);
        session.setAttribute("idUsuario", user.getId());
        session.setAttribute("role", role);

        logger.info("Datos de usuario almacenados en la sesión para ID: {}", user.getId());
    }
}