/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Account_User;
import Connection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
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
public class StatementController extends HttpServlet {

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
     ArrayList<Account_User> list =null;
     Connection con=null;
     ResultSet rs=null;
     Account_User u=null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        String button=request.getParameter("btn");
        if(button.equals("Get Statement")){
            long acc_no=Long.parseLong(request.getParameter("st1"));
            String tx=request.getParameter("st");
            if(tx.equals("Unknown")){
                pw.print("Sorry Unknown");
            }
            if(tx.equals("Top 5") || tx.equals("Top 10") || tx.equals("Full Statement")){
             
             //=null;
                if(tx.equals("Top 5")) {
                 try {
                   con=ConnectionProvider.DistributeConn();
                   String Query1="select TOP 5 Account_No,Amount,Balance,Operated_By,Txn_Date,Reference_No from Account_Info  "
                           + "where Account_No='"+acc_no+"' ORDER BY Txn_Date DESC ";
                   Statement st=con.createStatement();
                   st.executeQuery(Query1);
                   rs=st.getResultSet();
                     list=new ArrayList<Account_User>();
                   while(rs.next()){
                       u=new Account_User();
                       u.Ac_No=rs.getLong("Account_No");
                       u.Amount=rs.getDouble("Amount");
                       u.Balance=rs.getDouble("Balance");
                       u.Operate=rs.getString("Operated_By");
                       u.Tx_Date=rs.getString("Txn_Date");
                       u.Ref_No=rs.getString("Reference_No");
                       list.add(u);
                   }
                   
                   RequestDispatcher rd1=request.getRequestDispatcher("new.jsp");
   
                       request.setAttribute("LIST", list);
                       rd1.forward(request, response);
                       
                 } catch (Exception e) {
                 }
             } 
                 
                
                
           
        }if(tx.equals("Full Statement")){
            
                       try {
                con=ConnectionProvider.DistributeConn();
                   String Query="select Account_No,Amount,Balance,Operated_By,Txn_Date,Reference_No from Account_Info  "
                           + "where Account_No='"+acc_no+"'ORDER BY Txn_Date DESC";
                   Statement st1=con.createStatement(); 
                   rs=st1.executeQuery(Query);
                   while(rs.next()){
                      u=new Account_User();
                       u.Ac_No=rs.getLong("Account_No");
                       u.Amount=rs.getDouble("Amount");
                       u.Balance=rs.getDouble("Balance");
                       u.Operate=rs.getString("Operated_By");
                       u.Tx_Date=rs.getString("Txn_Date");
                       u.Ref_No=rs.getString("Reference_No");
                       list.add(u); 
                   }
                   RequestDispatcher rd1=request.getRequestDispatcher("new.jsp");
                   request.setAttribute("LIST", list);
                       rd1.forward(request, response);
            } catch (Exception e) {
            }
                   }
        
    }
    }
}