/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Connection.ConnectionProvider;
import java.sql.*;

/**
 *
 * @author ANISH
 */
public class UpdateData {
    
    public static int updateEmail(String sql){
        int i=0;
        try {
          Connection con=ConnectionProvider.DistributeConn();
           Statement st=con.createStatement();
           i=st.executeUpdate(sql);
        } catch (Exception e) {
        }
        return i;
    }
   
    public static int updateContct(String sql){
        int j=0;
        try {
           Connection con=ConnectionProvider.DistributeConn();
           Statement st=con.createStatement();
           j=st.executeUpdate(sql); 
        } catch (Exception e) {
        }
        return j;
    }
    
    public static int updateAddress( String sql){
        int k=0;
        try {
           Connection con=ConnectionProvider.DistributeConn();
           Statement st=con.createStatement();
           k=st.executeUpdate(sql);
        } catch (Exception e) {
        System.out.print(e);
                
        }
        return k;
    }
}
