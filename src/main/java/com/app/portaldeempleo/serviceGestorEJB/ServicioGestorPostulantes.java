package com.app.portaldeempleo.serviceGestorEJB;

import java.sql.SQLException;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.app.portaldeempleo.daos.PostulanteDAO;
import com.app.portaldeempleo.entidades.Postulante;
import com.app.portaldeempleo.entidades.Usuario;
import com.app.portaldeempleo.gestorpostulantes.dto.PostulanteBusquedad;

/**
 * Session Bean implementation class ServicioGestorPostulantes
 */
@Stateless
@LocalBean
public class ServicioGestorPostulantes {

	@PersistenceContext(unitName = "core_app_jpa")
	private EntityManager em;
    /**
     * Default constructor. 
     */
    public ServicioGestorPostulantes() {
        // TODO Auto-generated constructor stub
    }

    
    public List<PostulanteBusquedad> consultarPostulante(String searchTerm) {
    	
    	PostulanteDAO postulanteDAO = new PostulanteDAO();
		
        List<PostulanteBusquedad> list_postulantes = null;
        
         try {
        	 if(searchTerm != null) {
        		 list_postulantes = postulanteDAO.buscarPostulante(searchTerm);
        	 } else {
        		 list_postulantes = postulanteDAO.getPostulantes();
        	 }
 	    } catch (SQLException e) {
 	        e.printStackTrace();
 	    }
         
		return list_postulantes;
    }
    
    
    public void actualizarEstado(int idPostulante, String nuevoEstado) {
    	
    		int estadoId;
		  
		  	if(nuevoEstado.equals("pendiente")) {
			    estadoId = 1;
			} else if(nuevoEstado.equals("enviado")) {
			    estadoId = 2;
			} else if(nuevoEstado.equals("rechazado")) {
			    estadoId = 3;
			} else if(nuevoEstado.equals("finalista")) {
			    estadoId = 4;
			} else {
			    estadoId = 3;
			}
		    
		  	
        try {
        	
          PostulanteDAO postulanteDAO = new PostulanteDAO();
          postulanteDAO.actualizarEstado(idPostulante, estadoId);
          
        } catch (SQLException e) {
        	
          e.printStackTrace();
         
        }
    }
    
    public PostulanteBusquedad buscarPostulantePorId(int id) {
        
    	   String jpql = "SELECT p FROM Postulante p " +
                   "JOIN FETCH p.usuario u " +
                   "JOIN FETCH p.puestoTrabajo pt " +
                   "JOIN FETCH p.estatusPuestoTrabajo et " +
                   "WHERE p.id = :id";

        TypedQuery<Postulante> query = em.createQuery(jpql, Postulante.class);
        query.setParameter("id", id);

        Postulante postulante = query.getSingleResult();

        PostulanteBusquedad postulanteBusqueda = new PostulanteBusquedad();
        postulanteBusqueda.setId(postulante.getId());
        postulanteBusqueda.setIdUsuario(postulante.getUsuario().getId());
        postulanteBusqueda.setIdPuestoTrabajo(postulante.getPuestoTrabajo().getId());
        postulanteBusqueda.setMensaje(postulante.getMensaje());
        postulanteBusqueda.setEstatusPuestoTrabajoId(postulante.getEstatusPuestoTrabajo().getId());
        postulanteBusqueda.setSalarioPropuesto(postulante.getSalarioPropuesto());
        postulanteBusqueda.setNombreUsuario(postulante.getUsuario());
        postulanteBusqueda.setEstado(postulante.getEstatusPuestoTrabajo());
        postulanteBusqueda.setPuestoTrabajo(postulante.getPuestoTrabajo());
        String habilidades = postulante.getUsuario().getHabilidades();
        String[] habilidadesArray = habilidades.split(",");

        postulanteBusqueda.setHabilidades(habilidadesArray);
       

		System.out.println(":: dddddd---- "  + postulante.getUsuario().getHabilidades());

        return postulanteBusqueda;
    }
}