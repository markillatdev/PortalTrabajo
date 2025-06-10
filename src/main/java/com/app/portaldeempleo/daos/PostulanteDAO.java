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

import com.app.portaldeempleo.entidades.EstatusPuestoTrabajo;
import com.app.portaldeempleo.dto.Postulante;
import com.app.portaldeempleo.entidades.PuestoTrabajo;
import com.app.portaldeempleo.entidades.Usuario;
import com.app.portaldeempleo.gestorpostulantes.dto.PostulanteBusquedad;

public class PostulanteDAO {

    	private DataSource dataSource;
    	
	    public PostulanteDAO() {
	    	   try {
	               InitialContext initialContext = new InitialContext();
	               dataSource = (DataSource) initialContext.lookup("java:/jdbc/db_portal_job");
	           } catch (NamingException e) {
	               e.printStackTrace();
	           }
	    }

	    public List<PostulanteBusquedad> getPostulantes()throws SQLException {
	        List<PostulanteBusquedad> postulantes = new ArrayList<PostulanteBusquedad>();
            String query = "SELECT p.*, pt.nombre_puesto, et.nombre AS estado, u.nombre, u.correo_electronico, u.telefono, u.fecha_nacimiento, u.direccion FROM postulantes p JOIN puesto_trabajo pt ON p.id_puesto_trabajo = pt.id JOIN usuarios u ON p.id_usuario = u.id JOIN estatus_puesto_trabajo et ON p.estatus_puesto_trabajo_id = et.id ";

	        try (Connection connection = dataSource.getConnection();
		            PreparedStatement preparedStatement = connection.prepareStatement(query);
		            ResultSet resultSet = preparedStatement.executeQuery()) {
		        while (resultSet.next()) {
		        	PostulanteBusquedad postulante = new PostulanteBusquedad();
	                postulante.setId(resultSet.getInt("id"));
	                postulante.setIdUsuario(resultSet.getInt("id_usuario"));
	                postulante.setIdPuestoTrabajo(resultSet.getInt("id_puesto_trabajo"));
	                postulante.setMensaje(resultSet.getString("mensaje"));
	                postulante.setEstatusPuestoTrabajoId(resultSet.getInt("estatus_puesto_trabajo_id"));
	                postulante.setSalarioPropuesto(resultSet.getString("salario_propuesto"));
	                
	                Usuario user = new Usuario();
	                user.setId(resultSet.getInt("id_usuario"));
	                user.setNombre(resultSet.getString("nombre"));
	                postulante.setNombreUsuario(user);
	                
	                EstatusPuestoTrabajo estado = new EstatusPuestoTrabajo();
	                estado.setId(resultSet.getInt("estatus_puesto_trabajo_id"));
	                estado.setNombre(resultSet.getString("estado"));
	                postulante.setEstado(estado);

	                PuestoTrabajo puesto = new PuestoTrabajo();
	                puesto.setId(resultSet.getInt("id_puesto_trabajo"));
	                puesto.setNombrePuesto(resultSet.getString("nombre_puesto"));
	                postulante.setPuestoTrabajo(puesto);
	                
	                postulantes.add(postulante);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return postulantes;
	    }
	    
	    public Postulante obtenerPorId(int id) throws SQLException {
	    	Postulante postulante = null;
	        String query = "SELECT * FROM postulantes WHERE id=" + id;

		    try (Connection connection = dataSource.getConnection();
		    		PreparedStatement preparedStatement = connection.prepareStatement(query);
		            ResultSet resultSet = preparedStatement.executeQuery()) {

	            if (resultSet.next()) {
	            	postulante = new Postulante();
	                postulante.setId(resultSet.getInt("id"));
	                postulante.setIdUsuario(resultSet.getInt("id_usuario"));
	                postulante.setIdPuestoTrabajo(resultSet.getInt("id_puesto_trabajo"));
	                postulante.setMensaje(resultSet.getString("mensaje"));
	                postulante.setEstatusPuestoTrabajoId(resultSet.getInt("estatus_puesto_trabajo_id"));
	                postulante.setCurriculumVitae(resultSet.getString("curriculum_vitae"));
	                postulante.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
	                postulante.setSalarioPropuesto(resultSet.getString("salario_propuesto"));
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return postulante;
	    }
	    
	    public void insertarPostulante(Postulante postulante) throws SQLException  {
	         String query = "INSERT INTO postulantes(id_usuario, id_puesto_trabajo, mensaje, estatus_puesto_trabajo_id, curriculum_vitae, salario_propuesto) VALUES (?, ?, ?, ?, ?, ?)";
	         try (Connection connection = dataSource.getConnection();
			     PreparedStatement preparedStatement = connection.prepareStatement(query)) { 
	        	 preparedStatement.setInt(1, postulante.getIdUsuario());
	        	 preparedStatement.setInt(2, postulante.getIdPuestoTrabajo());
	        	 preparedStatement.setString(3, postulante.getMensaje());
	        	 preparedStatement.setInt(4, postulante.getEstatusPuestoTrabajoId());
	        	 preparedStatement.setString(5, postulante.getCurriculumVitae());
	        	 preparedStatement.setString(6, postulante.getSalarioPropuesto());
			     preparedStatement.executeUpdate();
	         } catch (SQLException e) {
	             e.printStackTrace();
	         }
	    }
	 
	    public void actualizarPostulante(Postulante postulante) throws SQLException {
            String query = "UPDATE postulantes SET id_usuario = ?, id_puesto_trabajo = ?, mensaje = ?, estatus_puesto_trabajo_id = ?, curriculum_vitae = ? WHERE id = ?";
            try (Connection connection = dataSource.getConnection();
		            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            	preparedStatement.setInt(1, postulante.getIdUsuario());
	            	preparedStatement.setInt(2, postulante.getIdPuestoTrabajo());
	            	preparedStatement.setString(3, postulante.getMensaje());
		            preparedStatement.setInt(4, postulante.getEstatusPuestoTrabajoId());
		            preparedStatement.setString(5, postulante.getCurriculumVitae());
		            preparedStatement.setInt(6, postulante.getId());
		            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }    
	    
	    public void actualizarEstado(int Idpostulante, int Idestado) throws SQLException {
            String query = "UPDATE postulantes SET estatus_puesto_trabajo_id = ? WHERE id = ?";
            try (Connection connection = dataSource.getConnection();
		            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            	preparedStatement.setInt(1, Idestado);
	            	preparedStatement.setInt(2, Idpostulante);
		            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }    
	    
	    
	    public List<PostulanteBusquedad> buscarPostulante(String value) throws SQLException {
            String query = "SELECT p.*, pt.nombre_puesto, et.nombre AS estado, u.nombre, u.correo_electronico, u.telefono, u.fecha_nacimiento, u.direccion FROM postulantes p JOIN puesto_trabajo pt ON p.id_puesto_trabajo = pt.id JOIN usuarios u ON p.id_usuario = u.id JOIN estatus_puesto_trabajo et ON p.estatus_puesto_trabajo_id = et.id WHERE u.nombre LIKE ?";

		    List<PostulanteBusquedad> postulantes = new ArrayList<PostulanteBusquedad>();
		    
		    try (Connection connection = dataSource.getConnection();
		    		 PreparedStatement preparedStatement = connection.prepareStatement(query)) {
				     preparedStatement.setString(1, "%" + value + "%");
				     ResultSet resultSet = preparedStatement.executeQuery();
		        while (resultSet.next()) {
		        	PostulanteBusquedad postulante = new PostulanteBusquedad();
	                postulante.setId(resultSet.getInt("id"));
	                postulante.setIdUsuario(resultSet.getInt("id_usuario"));
	                postulante.setIdPuestoTrabajo(resultSet.getInt("id_puesto_trabajo"));
	                postulante.setMensaje(resultSet.getString("mensaje"));
	                postulante.setEstatusPuestoTrabajoId(resultSet.getInt("estatus_puesto_trabajo_id"));
	                postulante.setSalarioPropuesto(resultSet.getString("salario_propuesto"));
	                
	                Usuario user = new Usuario();
	                user.setId(resultSet.getInt("id_usuario"));
	                user.setNombre(resultSet.getString("nombre"));
	                postulante.setNombreUsuario(user);
	                
	                EstatusPuestoTrabajo estado = new EstatusPuestoTrabajo();
	                estado.setId(resultSet.getInt("estatus_puesto_trabajo_id"));
	                estado.setNombre(resultSet.getString("estado"));
	                postulante.setEstado(estado);

	                PuestoTrabajo puesto = new PuestoTrabajo();
	                puesto.setId(resultSet.getInt("id_puesto_trabajo"));
	                puesto.setNombrePuesto(resultSet.getString("nombre_puesto"));
	                postulante.setPuestoTrabajo(puesto);
	                
	                postulantes.add(postulante);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return postulantes;
		}
	   
}
