package com.app.portaldeempleo.dto;

import java.util.Date;

public class Postulante {

	  	private int id;
	    private int idUsuario;
	    private int idPuestoTrabajo;
	    private String mensaje;
	    private int estatusPuestoTrabajoId;
	    private String curriculumVitae;
	    private Date fechaCreacion;
	    private String salarioPropuesto;
	    private PuestoTrabajo puesto;
	    private Usuario usuario;
	    private EstadoPuestoTrabajo estado;

	    public Postulante() {}

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

	    public String getCurriculumVitae() {
	        return curriculumVitae;
	    }

	    public void setCurriculumVitae(String curriculumVitae) {
	        this.curriculumVitae = curriculumVitae;
	    }

	    public Date getFechaCreacion() {
	        return fechaCreacion;
	    }

	    public void setFechaCreacion(Date fechaCreacion) {
	        this.fechaCreacion = fechaCreacion;
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
	    
	    
	    public EstadoPuestoTrabajo getEstado() {
	    	return estado;
	    }
	    
	    public void setEstado(EstadoPuestoTrabajo estado) {
	    	this.estado = estado;
	    }
	   
}