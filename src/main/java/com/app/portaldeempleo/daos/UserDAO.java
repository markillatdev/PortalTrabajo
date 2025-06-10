package com.app.portaldeempleo.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.app.portaldeempleo.dto.Usuario;

public class UserDAO {

	private DataSource dataSource;
	
    public UserDAO() {
    	 try {
             InitialContext initialContext = new InitialContext();
             dataSource = (DataSource) initialContext.lookup("java:/jdbc/db_portal_job");
         } catch (NamingException e) {
             e.printStackTrace();
         }
    }

    public List<Usuario> getUsuarios() throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String query = "SELECT * FROM usuarios";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(resultSet.getInt("id"));
                usuario.setNombre(resultSet.getString("nombre"));
                usuario.setCorreoElectronico(resultSet.getString("correo_electronico"));
                usuario.setPassword(resultSet.getString("password"));
                usuario.setTelefono(resultSet.getString("telefono"));
                usuario.setFechaNacimiento(resultSet.getDate("fecha_nacimiento"));
                usuario.setDireccion(resultSet.getString("direccion"));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    public void agregarUsuario(Usuario usuario) throws SQLException {
        String query = "INSERT INTO usuarios (nombre, correo_electronico, password, telefono, fecha_nacimiento, direccion, fecha_creacion) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, usuario.getNombre());
            preparedStatement.setString(2, usuario.getCorreoElectronico());
            preparedStatement.setString(3, usuario.getPassword());
            preparedStatement.setString(4, usuario.getTelefono());
            preparedStatement.setDate(5, new java.sql.Date(usuario.getFechaNacimiento().getTime()));
            preparedStatement.setString(6, usuario.getDireccion());
            preparedStatement.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Usuario buscarUsuarioPorId(int id) throws SQLException {
        String query = "SELECT * FROM usuarios WHERE id = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    Usuario usuario = new Usuario();
                    usuario.setId(resultSet.getInt("id"));
                    usuario.setNombre(resultSet.getString("nombre"));
                    usuario.setCorreoElectronico(resultSet.getString("correo_electronico"));
                    usuario.setPassword(resultSet.getString("password"));
                    usuario.setTelefono(resultSet.getString("telefono"));
                    usuario.setFechaNacimiento(resultSet.getDate("fecha_nacimiento"));
                    usuario.setDireccion(resultSet.getString("direccion"));
                    return usuario;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public Usuario getLastUser() throws SQLException {
    	  String query = "SELECT * FROM usuarios ORDER BY id DESC LIMIT 1";
          try (Connection connection = dataSource.getConnection();
               PreparedStatement preparedStatement = connection.prepareStatement(query)) {
              try (ResultSet resultSet = preparedStatement.executeQuery()) {
                  if (resultSet.next()) {
                      Usuario usuario = new Usuario();
                      usuario.setId(resultSet.getInt("id"));
                      usuario.setNombre(resultSet.getString("nombre"));
                      usuario.setCorreoElectronico(resultSet.getString("correo_electronico"));
                      usuario.setPassword(resultSet.getString("password"));
                      usuario.setTelefono(resultSet.getString("telefono"));
                      usuario.setFechaNacimiento(resultSet.getDate("fecha_nacimiento"));
                      usuario.setDireccion(resultSet.getString("direccion"));
                      return usuario;
                  }
              }
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return null;
    }
}
