/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Connection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ANISH
 */
public class ForgetPasController extends HttpServlet {

   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
       
                        try{
                            Connection con=null;
                        String un=request.getParameter("un");
                        con=ConnectionProvider.DistributeConn();
                        String sq="select * from UserDetails where Username='"+un+"'";
                        Statement s=con.createStatement();
                        ResultSet r=s.executeQuery(sq);
                        if(r.next()){
                        con=ConnectionProvider.DistributeConn();
                        String sql="select * from UserDetails where Username='"+un+"'";
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery(sql);
                        if(rs.next()){
                            String m=rs.getString("Password");
                            RequestDispatcher rd=request.getRequestDispatcher("forget_pass.jsp");
                            request.setAttribute("Pass", m);
                            rd.forward(request, response);
                        }
                        }  else{
                             String ms="This Username is Not Exist in Databse";
                             RequestDispatcher rd=request.getRequestDispatcher("forget_pass.jsp");
                             request.setAttribute("MSG", ms );
                            rd.forward(request, response);
                        }    
}catch(Exception e){

}
        
    }
}