/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Connection.ConnectionProvider;
import java.sql.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ANISH
 */
public class LoginController extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        try {
            HttpSession s=request.getSession();
            String un=request.getParameter("un");
            String pass=request.getParameter("up");
            
              Connection con=ConnectionProvider.DistributeConn();
            String query="select * from UserDetails where Username='"+un+"' AND Password='"+pass+"' ";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
            if(rs.next()){
             Connection con1=ConnectionProvider.DistributeConn();
           String Query="select Name from UserDetails join CustomerAccount Cust_Name ON Name=Cust_Name where Username='"+un+"'";
           Statement st1=con1.createStatement();
           ResultSet rs1=st1.executeQuery(Query);
           if(rs1.next()){
             s.setAttribute("User", un);
                response.sendRedirect("main.jsp");  
           }else{
           pw.print("<font color='Red'>Sorry! your Account is not yet Completed So please Complete First"+"\t"+"<a href='OpenAccount.jsp'>Move Next</a>"+"<br>");
           pw.print("If You want to Dismiss Your Account Request..</font>"+"<a href='Dismiss.jsp'>Dismiss");
           } 
            }else{
               RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
               String msg="Sorry incorrect username and Password";
               request.setAttribute("MSG", msg);
               rd.forward(request, response);
            } 
           
         
        } catch (Exception e) {
            pw.print("Sorry Something went wrong"+e);
        }
       
    }
}
