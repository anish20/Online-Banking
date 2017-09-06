/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Bean.RegisterUser;
import Connection.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 *
 * @author ANISH
 */
public class UserData {
    public static int DataProvider(RegisterUser us){
        int i=0;
        try {
            Connection con=ConnectionProvider.DistributeConn();
            String sql="insert into UserDetails values('"+us.getSalutation()+"','"+us.getFname()+"','"+us.getDOB()+"','"+us.getEmail_ID()+"','"+us.getUsername()+"','"+us.getMobile_no()+"','"+us.getPassword()+"','"+us.getCountry()+"')";
            /*PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, us.getSalutation());
            ps.setString(2, us.getFname());
            ps.setString(3, us.getDOB());
            ps.setString(4, us.getEmail_ID());
            ps.setString(5, us.getUsername());
            ps.setLong(6, us.getMobile_no());
            ps.setString(7, us.getPassword());
            ps.setString(8, us.getCountry());
            i=ps.executeUpdate();*/
            Statement st=con.createStatement();
            i=st.executeUpdate(sql);
            if(i>=1){
                System.out.print("inserted...");
            }
        } catch (Exception e) {
            System.out.print("Something Went wrong!!!"+e);
        }
        return i;
    }
}
