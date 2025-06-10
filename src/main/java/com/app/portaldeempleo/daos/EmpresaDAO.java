package com.app.portaldeempleo.daos;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.app.portaldeempleo.dto.Empresa;

public class EmpresaDAO {

    private DataSource dataSource;

    public EmpresaDAO() {
        try {
            InitialContext initialContext = new InitialContext();
            dataSource = (DataSource) initialContext.lookup("java:/jdbc/db_portal_job");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<Empresa> getEmpresas() throws SQLException {
        List<Empresa> empresas = new ArrayList<>();
        String query = "SELECT * FROM empresa";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Empresa empresa = new Empresa();
                empresa.setId(resultSet.getInt("id"));
                empresa.setNombreEmpresa(resultSet.getString("nombre_empresa"));
                empresa.setDireccion(resultSet.getString("direccion"));
                empresa.setTelefono(resultSet.getString("telefono"));
                empresas.add(empresa);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return empresas;
    }

    public Empresa getEmpresaById(int id) throws SQLException {
        Empresa empresa = null;
        String query = "SELECT * FROM empresa WHERE id = " + id;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
            		 ResultSet resultSet = preparedStatement.executeQuery()) {
            
                if (resultSet.next()) {
                    empresa = new Empresa();
                    empresa.setId(resultSet.getInt("id"));
                    empresa.setNombreEmpresa(resultSet.getString("nombre_empresa"));
                    empresa.setDireccion(resultSet.getString("direccion"));
                    empresa.setTelefono(resultSet.getString("telefono"));
                    empresa.setCorreoElectronico(resultSet.getString("correo_electronico"));
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return empresa;
    }
    
    public Empresa getEmpresaByLastId() throws SQLException {
        Empresa empresa = null;
        String query = "SELECT * FROM empresa ORDER BY id DESC LIMIT 1";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
            		 ResultSet resultSet = preparedStatement.executeQuery()) {
            
                if (resultSet.next()) {
                    empresa = new Empresa();
                    empresa.setId(resultSet.getInt("id"));
                    empresa.setNombreEmpresa(resultSet.getString("nombre_empresa"));
                    empresa.setDireccion(resultSet.getString("direccion"));
                    empresa.setTelefono(resultSet.getString("telefono"));
                    empresa.setCorreoElectronico(resultSet.getString("correo_electronico"));
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return empresa;
    }

    public void insertarEmpresa(Empresa empresa) throws SQLException {
        String query = "INSERT INTO empresa (nombre_empresa, direccion, telefono, correo_electronico) VALUES (?, ?, ?, ?)";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, empresa.getNombreEmpresa());
            preparedStatement.setString(2, empresa.getDireccion());
            preparedStatement.setString(3, empresa.getTelefono());
            preparedStatement.setString(4, empresa.getCorreoElectronico());
	        preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateEmpresa(Empresa empresa) throws SQLException {
        boolean result = false;
        String query = "UPDATE empresa SET nombre_empresa = ?, direccion = ?, telefono = ? WHERE id = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, empresa.getNombreEmpresa());
            preparedStatement.setString(2, empresa.getDireccion());
            preparedStatement.setString(3, empresa.getTelefono());
            preparedStatement.setInt(4, empresa.getId());
            result = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
