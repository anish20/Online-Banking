/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;
import java.sql.*;

/**
 *
 * @author ANISH
 */
public class ConnectionProvider {
 /*public  static String ConUrl="jdbc:mysql://localhost:3306/JanBank";
  public static  String Drivername="com.mysql.jdbc.Driver";
  public static  String User="root";
  public static  String Pass="root";*/
  static {
      try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           //Class.forName(Drivername);
         System.out.println("Driver Loaded");
       }catch(Exception e){
           System.out.println("Driver Loading erorr"+e);
       }
  }
   public static Connection DistributeConn(){
       Connection con=null;
       try {
          con=DriverManager.getConnection("Jdbc:Odbc:OnlineBanking");
           //con=DriverManager.getConnection(ConUrl, User, Pass);
          System.out.println("Connection  Opened");
       } catch (Exception e) {
        System.out.println("connecting error"+ e);   
       }
       return con;
   }
}
