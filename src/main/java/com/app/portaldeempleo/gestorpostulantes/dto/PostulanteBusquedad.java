package com.app.portaldeempleo.gestorpostulantes.dto;

//import com.app.portaldeempleo.dto.EstadoPuestoTrabajo;
//import com.app.portaldeempleo.dto.PuestoTrabajo;
//import com.app.portaldeempleo.dto.Usuario;
import com.app.portaldeempleo.entidades.Usuario;
import com.app.portaldeempleo.entidades.EstatusPuestoTrabajo;
import com.app.portaldeempleo.entidades.PuestoTrabajo;

public class PostulanteBusquedad {
	
 	private int id;
    private int idUsuario;
    private int idPuestoTrabajo;
    private String mensaje;
    private int estatusPuestoTrabajoId;
    private String salarioPropuesto;
    private PuestoTrabajo puesto;
    private Usuario usuario;
    private EstatusPuestoTrabajo estado;
   private String[] habilidades;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdPuestoTrabajo() {
        return idPuestoTrabajo;
    }

    public void setIdPuestoTrabajo(int idPuestoTrabajo) {
        this.idPuestoTrabajo = idPuestoTrabajo;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public int getEstatusPuestoTrabajoId() {
        return estatusPuestoTrabajoId;
    }

    public void setEstatusPuestoTrabajoId(int estatusPuestoTrabajoId) {
        this.estatusPuestoTrabajoId = estatusPuestoTrabajoId;
    }
    
    public String getSalarioPropuesto() {
    	return salarioPropuesto;
    }
    
    public void setSalarioPropuesto(String salarioPropuesto) {
    	this.salarioPropuesto = salarioPropuesto;
    }
    
    public PuestoTrabajo getPuestoTrabajo() {
    	return puesto;
    }
    
    public void setPuestoTrabajo(PuestoTrabajo puestoTrabajo) {
    	this.puesto = puestoTrabajo;
    }
    
    public Usuario getNombreUsuario() {
    	return usuario;
    }
    
    public void setNombreUsuario(Usuario usuario) {
    	this.usuario = usuario;
    }
    
    
    public EstatusPuestoTrabajo getEstado() {
    	return estado;
    }
    
    public void setEstado(EstatusPuestoTrabajo estado) {
    	this.estado = estado;
    }
    
    public String[] getHabilidades() {
	    return habilidades;
	}
	    
	public void setHabilidades(String[] habilidades) {
	   this.habilidades = habilidades;
	}
	
}
