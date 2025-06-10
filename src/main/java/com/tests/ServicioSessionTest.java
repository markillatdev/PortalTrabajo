package com.tests;

import com.app.portaldeempleo.entidades.Usuario;
import com.app.portaldeempleo.serviceGestorEJB.ServicioSession;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.mockito.Mockito.*;

public class ServicioSessionTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpSession session;

    @InjectMocks
    private ServicioSession servicioSession;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
        when(request.getSession()).thenReturn(session);
    }

    @Test
    public void testAlmacenarDatosSession_NombreNulo() {
        Usuario user = new Usuario();
        user.setId(123);
        user.setCorreoElectronico("test@dominio.com");

        servicioSession.almacenarDatosSession(request, user);

        verify(session).setAttribute("nombreUsuario", "UsuarioDesconocido");
        verify(session).setAttribute("correoElectronico", "test@dominio.com");
        verify(session).setAttribute("idUsuario", 123);
        verify(session).setAttribute("role", 1);
        verify(session).setMaxInactiveInterval(60 * 60);
    }

    @Test
    public void testAlmacenarDatosSession_UsuarioValido() {
        Usuario user = new Usuario();
        user.setId(456);
        user.setNombre("Juan Perez");
        user.setCorreoElectronico("juan@dominio.com");

        servicioSession.almacenarDatosSession(request, user);
        
        verify(session).setAttribute("nombreUsuario", "Juan Perez");
        verify(session).setAttribute("correoElectronico", "juan@dominio.com");
        verify(session).setAttribute("idUsuario", 456);
        verify(session).setMaxInactiveInterval(60 * 60);
    }
}

