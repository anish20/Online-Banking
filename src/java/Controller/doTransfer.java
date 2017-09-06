/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Connection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ANISH
 */
public class doTransfer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String Txn_Date=dateFormat.format(date);
            long F_Ac;
            String bn_name;
            long t_ac;
            double amt;
            String Operate="DEBITED";
            F_Ac=Long.parseLong(request.getParameter("sl"));
            bn_name=request.getParameter("bn");
            t_ac =Long.parseLong(request.getParameter("tac"));
            amt=Double.parseDouble(request.getParameter("amt"));
            Connection con=ConnectionProvider.DistributeConn();
            String qurey="select * from Account_Info where Cust_Name='"+bn_name+"' and Account_No='"+t_ac+"'" ;
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(qurey);
            if(rs.next()){
                //String query1="insert into Account_Info  "
             Statement st1=con.createStatement();
             
            }else{
              pw.print("false");  
            }
            
        } catch (Exception e) {
            pw.print("something fault.."+e);
        }
    }
}