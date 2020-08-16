/**
 * 
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author user
 *
 */
public class Connectionmodel {
	 public Connection getconnection()
	    {
	       Connection con=null; 
	        try
	    {
	     Class.forName("com.mysql.jdbc.Driver");
	     
	     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb","root","root");
	       
	    }catch(Exception e)
	    {
	        e.printStackTrace();
	    }
	            
	  return con;  
	}

}
