package com.app.portaldeempleo.serviceGestorEJB;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.app.portaldeempleo.dto.Perfil;
import com.app.portaldeempleo.entidades.Usuario;
import javax.persistence.NoResultException;

/**
 * Session Bean implementation class ServicioGestorUsuarios
 */
@Stateless
@LocalBean
public class ServicioGestorUsuarios {

	
	@PersistenceContext(unitName = "core_app_jpa")
	private EntityManager em;
	
    /**
     * Default constructor. 
     */
    public ServicioGestorUsuarios() {
        // TODO Auto-generated constructor stub
    }

    public void registrarUsuario(Usuario usuario) {
	  	
    	em.persist(usuario);
    }
    
    public Usuario actualizarUsuario(Perfil usuario)
    {
    	Usuario u = em.find(Usuario.class, usuario.getId());
    	u.setNombre(usuario.getNombre());
		u.setApellido(usuario.getApellido());
		u.setPassword(usuario.getPassword());
		u.setCorreoElectronico(usuario.getCorreoElectronico());
		u.setDireccion(usuario.getDireccion());
		u.setTelefono(usuario.getTelefono());
		u.setCiudad(usuario.getCiudad());
		u.setAcercaMi(usuario.getAcercaMi());
		u.setPais(usuario.getPais());
		u.setAniosExperiencia(usuario.getAniosExperiencia());
		u.setExperienciaLaboral(usuario.getExperienciaLaboral());
		u.setHabilidades(usuario.getHabilidades());
    	em.persist(u);
    	
    	return u;
    }

	public Usuario obtenerUsuario(int idUsuario) {
		
		Usuario u = em.find(Usuario.class, idUsuario);
    	
		return u;
	}
	
	public Usuario buscarUsuario(String correo, String password) {
		
		try {
			
			Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.correoElectronico = :correo AND u.password = :password");
			query.setParameter("correo", correo);
			query.setParameter("password", password);
			Usuario usuario = (Usuario) query.getSingleResult();
			return usuario;
	    
	    } catch(NoResultException e) {
	    	
	    	 return null;
	    	 
	    }
	}
	
	public Usuario buscarEmail(String correo) {
		
		try {
			
			Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.correoElectronico = :correo");
			query.setParameter("correo", correo);
			Usuario usuario = (Usuario) query.getSingleResult();
			return usuario;
	    
	    } catch(NoResultException e) {
	    	
	    	 return null;
	    	 
	    }
	}
}
