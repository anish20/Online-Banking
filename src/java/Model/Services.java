/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import Connection.ConnectionProvider;
import java.sql.*;

public class Services {
    public static double getBalance(String sql){
       double balance=0;
       Connection con=null;
        try {
         con=ConnectionProvider.DistributeConn();
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery(sql);
         while(rs.next()){
             balance=rs.getDouble(1);
         }
         con.close();
         
        } catch (Exception e) {
             System.out.print("Hello"+e);
        }
        return  balance;
    }
    
    public static double updateBalance(String sql){
        double update=0;
        try {
          Connection con=ConnectionProvider.DistributeConn();
          Statement st=con.createStatement();
          update=st.executeUpdate(sql);
        } catch (Exception e) {
          System.out.print("Hey"+e);
        }
        return update;
    }
    
    
}
