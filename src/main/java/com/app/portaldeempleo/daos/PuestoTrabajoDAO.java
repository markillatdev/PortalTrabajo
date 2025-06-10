package com.app.portaldeempleo.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.app.portaldeempleo.dto.Empresa;
import com.app.portaldeempleo.dto.PuestoTrabajo;

public class PuestoTrabajoDAO {

private DataSource dataSource;
	
	public PuestoTrabajoDAO() {
	    try {
	        InitialContext initialContext = new InitialContext();
	        dataSource = (DataSource) initialContext.lookup("java:/jdbc/db_portal_job");
	    } catch (NamingException e) {
	        e.printStackTrace();
	    }
	}

	public List<PuestoTrabajo> getPuestosDeTrabajo() throws SQLException {
	    List<PuestoTrabajo> listaPuestos = new ArrayList<>();
	    String query = "SELECT pt.*, e.nombre_empresa, e.direccion FROM puesto_trabajo pt JOIN empresa e ON pt.id_empresa = e.id";
	    try (Connection connection = dataSource.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(query);
	            ResultSet resultSet = preparedStatement.executeQuery()) {
	        while (resultSet.next()) {
	            PuestoTrabajo puesto = new PuestoTrabajo();
	            puesto.setId(resultSet.getInt("id"));
	            puesto.setNombrePuesto(resultSet.getString("nombre_puesto"));
	            puesto.setDescripcion(resultSet.getString("descripcion"));
	            puesto.setSalario(resultSet.getString("salario"));
	            puesto.setFechaCreacion(resultSet.getDate("fecha_creacion"));
	            puesto.setFechaCierre(resultSet.getDate("fecha_cierre"));
	            puesto.setEstado(resultSet.getBoolean("estado"));
	            puesto.setTipoTrabajo(resultSet.getString("tipo_trabajo"));
	            
	            Empresa empresa = new Empresa();
	            empresa.setId(resultSet.getInt("id_empresa"));
	            empresa.setDireccion(resultSet.getString("direccion"));
	            puesto.setEmpresa(empresa);
	            
	            listaPuestos.add(puesto);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return listaPuestos;
	}
	
	public PuestoTrabajo obtenerPorId(int id) throws SQLException {
        PuestoTrabajo puesto = null;
        String query = "SELECT * FROM puesto_trabajo WHERE id=" + id;

	    try (Connection connection = dataSource.getConnection();
	    		PreparedStatement preparedStatement = connection.prepareStatement(query);
	            ResultSet resultSet = preparedStatement.executeQuery()) {

            if (resultSet.next()) {
                puesto = new PuestoTrabajo();
                puesto.setId(resultSet.getInt("id"));
                puesto.setNombrePuesto(resultSet.getString("nombre_puesto"));
                puesto.setDescripcion(resultSet.getString("descripcion"));
                puesto.setSalario(resultSet.getString("salario"));
                puesto.setFechaCierre(resultSet.getDate("fecha_cierre"));
                puesto.setEstado(resultSet.getBoolean("estado"));
                puesto.setIdEmpresa(resultSet.getInt("id_empresa"));
	            puesto.setTipoTrabajo(resultSet.getString("tipo_trabajo"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return puesto;
    }
	
	public void insertarPuestoDeTrabajo(PuestoTrabajo puesto) throws SQLException {
	    String query = "INSERT INTO puesto_trabajo (nombre_puesto, descripcion, salario, fecha_cierre, id_empresa, tipo_trabajo) VALUES (?, ?, ?, ?, ?, ?)";
	    try (Connection connection = dataSource.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setString(1, puesto.getNombrePuesto());
	        preparedStatement.setString(2, puesto.getDescripcion());
	        preparedStatement.setString(3, puesto.getSalario());
	        preparedStatement.setDate(4, new java.sql.Date(puesto.getFechaCierre().getTime()));
	        preparedStatement.setInt(5, puesto.getIdEmpresa());
	        preparedStatement.setString(6, puesto.getTipoTrabajo());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public void actualizarPuestoDeTrabajo(PuestoTrabajo puesto) throws SQLException {
	    String query = "UPDATE puesto_trabajo SET nombre_puesto=?, descripcion=?, salario=?, fecha_cierre=?, estado=?, id_empresa=? WHERE id=?";
	    try (Connection connection = dataSource.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setString(1, puesto.getNombrePuesto());
	        preparedStatement.setString(2, puesto.getDescripcion());
	        preparedStatement.setString(3, puesto.getSalario());
	        preparedStatement.setDate(4, new java.sql.Date(puesto.getFechaCierre().getTime()));
	        preparedStatement.setBoolean(5, puesto.isEstado());
	        preparedStatement.setInt(6, puesto.getIdEmpresa());
	        preparedStatement.setInt(7, puesto.getId());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public void actualizarEstadoPuestoDeTrabajo(PuestoTrabajo puesto) throws SQLException {
	    String query = "UPDATE puesto_trabajo SET estado=? WHERE id=?";
	    try (Connection connection = dataSource.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setBoolean(1, puesto.isEstado());
	        preparedStatement.setInt(2, puesto.getId());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public List<PuestoTrabajo> buscarPuestoTrabajo(String value) throws SQLException {

        String query = "SELECT  pt.*, e.nombre_empresa, e.direccion FROM puesto_trabajo pt JOIN empresa e ON pt.id_empresa = e.id WHERE pt.nombre_puesto LIKE ?";
	    List<PuestoTrabajo> puestos = new ArrayList<PuestoTrabajo>();
	    
	    try (Connection connection = dataSource.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
		    	preparedStatement.setString(1, "%" + value + "%");
		    	ResultSet resultSet = preparedStatement.executeQuery();
		        while (resultSet.next()) {
		        
	        	 	PuestoTrabajo puesto = new PuestoTrabajo();
		            puesto.setId(resultSet.getInt("id"));
		            puesto.setNombrePuesto(resultSet.getString("nombre_puesto"));
		            puesto.setDescripcion(resultSet.getString("descripcion"));
		            puesto.setSalario(resultSet.getString("salario"));
		            puesto.setFechaCreacion(resultSet.getDate("fecha_creacion"));
		            puesto.setFechaCierre(resultSet.getDate("fecha_cierre"));
		            puesto.setEstado(resultSet.getBoolean("estado"));
		            puesto.setTipoTrabajo(resultSet.getString("tipo_trabajo"));
		            
		            Empresa empresa = new Empresa();
		            empresa.setId(resultSet.getInt("id_empresa"));
		            empresa.setDireccion(resultSet.getString("direccion"));
		            puesto.setEmpresa(empresa);
		           
		        	puestos.add(puesto);
		        }
	    } catch (SQLException e) {
	    	 e.printStackTrace();
	    } 
	    
	    return puestos;
	}
	
	public void eliminarPuestoDeTrabajo(int idPuesto) throws SQLException {
	    String query = "DELETE FROM puesto_trabajo WHERE id=?";
	    try (Connection connection = dataSource.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setInt(1, idPuesto);
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
}
