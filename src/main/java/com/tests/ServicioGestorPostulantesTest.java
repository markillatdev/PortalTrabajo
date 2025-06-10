package com.tests;

import com.app.portaldeempleo.entidades.*;
import com.app.portaldeempleo.gestorpostulantes.dto.PostulanteBusquedad;
import com.app.portaldeempleo.serviceGestorEJB.ServicioGestorPostulantes;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.lang.reflect.Field;

public class ServicioGestorPostulantesTest {

    private ServicioGestorPostulantes servicioGestorPostulantes;
    private EntityManager emMock;
    private TypedQuery<Postulante> queryMock;

    @BeforeEach
    public void setUp() throws Exception {
        servicioGestorPostulantes = new ServicioGestorPostulantes();
        emMock = mock(EntityManager.class);
        queryMock = mock(TypedQuery.class);

        Field emField = ServicioGestorPostulantes.class.getDeclaredField("em");
        emField.setAccessible(true);
        emField.set(servicioGestorPostulantes, emMock);
    }

    @Test
    public void testBuscarPostulantePorId() {
        Postulante postulanteMock = mock(Postulante.class);
        Usuario usuarioMock = mock(Usuario.class);
        PuestoTrabajo puestoTrabajoMock = mock(PuestoTrabajo.class);
        EstatusPuestoTrabajo estatusMock = mock(EstatusPuestoTrabajo.class);

        when(emMock.createQuery(anyString(), eq(Postulante.class))).thenReturn(queryMock);
        when(queryMock.setParameter(eq("id"), eq(1))).thenReturn(queryMock);
        when(queryMock.getSingleResult()).thenReturn(postulanteMock);

        when(postulanteMock.getId()).thenReturn(1);
        when(postulanteMock.getUsuario()).thenReturn(usuarioMock);
        when(postulanteMock.getPuestoTrabajo()).thenReturn(puestoTrabajoMock);
        when(postulanteMock.getEstatusPuestoTrabajo()).thenReturn(estatusMock);
        when(postulanteMock.getMensaje()).thenReturn("Mensaje prueba");
        when(postulanteMock.getSalarioPropuesto()).thenReturn("5000.0");

        when(usuarioMock.getId()).thenReturn(10);
        when(usuarioMock.getHabilidades()).thenReturn("Java,Spring");

        when(puestoTrabajoMock.getId()).thenReturn(20);
        when(estatusMock.getId()).thenReturn(30);

        PostulanteBusquedad resultado = servicioGestorPostulantes.buscarPostulantePorId(1);

        assertNotNull(resultado);
        assertEquals(1, resultado.getId());
        assertEquals(10, resultado.getIdUsuario());
        assertEquals(20, resultado.getIdPuestoTrabajo());
        assertEquals("Mensaje prueba", resultado.getMensaje());
        assertEquals(30, resultado.getEstatusPuestoTrabajoId());
        assertEquals("5000.0", resultado.getSalarioPropuesto());
        assertArrayEquals(new String[]{"Java", "Spring"}, resultado.getHabilidades());

        verify(emMock).createQuery(anyString(), eq(Postulante.class));
        verify(queryMock).setParameter("id", 1);
        verify(queryMock).getSingleResult();
    }
}
