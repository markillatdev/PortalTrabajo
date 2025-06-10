package config;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	
	private DataSource dataSource;
	
	public DBConnection() {
		
		try {

			InitialContext ctx = new InitialContext();
			
			 System.out.println("ctx: " + ctx);
	         
	         dataSource = (DataSource) ctx.lookup("java:/jdbc/db_portal_job");

		         
		 } catch (NamingException ex) {
			 
	            System.out.println("dataSource: " + dataSource);

	            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
	     }
	}

	public Connection getConnection() throws SQLException {
		
	    Connection conn = null;
	    	        
	    try {
	        
	        conn = dataSource.getConnection();
	            
	    } catch (SQLException ex) {
	        	
	        Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
	            
	    }
	        
	    return conn;
	}
}