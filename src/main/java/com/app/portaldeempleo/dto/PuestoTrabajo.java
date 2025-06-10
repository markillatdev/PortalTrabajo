package com.app.portaldeempleo.dto;

import java.util.Date;

public class PuestoTrabajo {

    private int id;
    private String nombrePuesto;
    private String descripcion;
    private String salario;
    private Date fechaCreacion;
    private Date fechaCierre;
    private boolean estado;
    private int idEmpresa;
    private String tipoTrabajo;
    private Empresa empresa;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombrePuesto() {
        return nombrePuesto;
    }

    public void setNombrePuesto(String nombrePuesto) {
        this.nombrePuesto = nombrePuesto;
    }
    
    public String getTipoTrabajo() {
    	return tipoTrabajo;
    }
    
    public void setTipoTrabajo(String tipoTrabajo) {
    	this.tipoTrabajo = tipoTrabajo;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getSalario() {
        return salario;
    }

    public void setSalario(String salario) {
        this.salario = salario;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Date getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(Date fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }
    
    public Empresa getEmpresa()
    {
    	return this.empresa;
    }
    
    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }
}
