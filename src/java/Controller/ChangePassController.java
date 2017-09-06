/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Connection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ANISH
 */
public class ChangePassController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        try {
           String Un=request.getParameter("un");
           String p=request.getParameter("ps");
           String cp=request.getParameter("cps");
           cp=p;
           Connection con=null;
           con=ConnectionProvider.DistributeConn();
           String sql="select * from UserDetails where Username='"+Un+"'";
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery(sql);
           if(rs.next()){
            con=ConnectionProvider.DistributeConn(); 
            String up="update UserDetails set Password='"+cp+"' where Username='"+Un+"'   ";
            Statement st1=con.createStatement();
            int i=st1.executeUpdate(up);
            if(i>0){
               String ms="Password Successfully Upadated.. ";
               RequestDispatcher rd=request.getRequestDispatcher("change_Pass.jsp");
               request.setAttribute("CHNG", ms );
               rd.forward(request, response);
            }
           }else{
               String ms1="This Username is Not Exist in Databse";
               RequestDispatcher rd=request.getRequestDispatcher("change_Pass.jsp");
               request.setAttribute("MSG", ms1 );
               rd.forward(request, response);
           }
        } catch (Exception e) {
            System.out.print(e);
        }
        
        
    }
}