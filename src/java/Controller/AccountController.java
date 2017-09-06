/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Connection.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ANISH
 */
public class AccountController extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        try {
            String bt=request.getParameter("btn");
            if(bt.equals("Continue")){
            //String Txn_Date=(new java.util.Date()).toString();
            double amt=500.0;
            double bal=0;
             bal=bal+amt;
           String Account_st="Active";
           String operate="New Account";
           Random r=new Random(); 
           char event_Status = (char) (r.nextInt(26) + 'A');
           
              long adhar_no=Long.parseLong(request.getParameter("adh"));
              String pan_no=request.getParameter("pn");
              String occcupation=request.getParameter("ocp");
              String industry=request.getParameter("ind");
              String income=request.getParameter("inc");
              String annl_incm_Rng=request.getParameter("ainc");
              String nominee=request.getParameter("nom");
              String nom_rel=request.getParameter("rl");
               String Ac_type="Saving Account";
              //Date opn_date=SimpleDate.DateFormat();
             Date date=new Date();
              SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
             String opn_date= sdf.format(date);
             String IsNew="YES";
             String security=request.getParameter("ans");
             SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date1 = new Date();
            String Txn_Date=dateFormat.format(date1);
             
              
                try {
                    
                     Connection con =ConnectionProvider.DistributeConn();
                    String sql="insert into CustomerAccount (Adhar_Card_No,Pan_Card_No,Occupation,Industry,Income_resource,Annual_Income_Rang,Nominee_Name,Nominee_Relation,Account_Type,Open_Date,Security_Answer,IsNew) values('"+adhar_no+"','"+pan_no+"','"+occcupation+"','"+industry+"','"+income+"','"+annl_incm_Rng+"','"+nominee+"','"+nom_rel+"','"+Ac_type+"','"+opn_date+"','"+security+"','"+IsNew+"')";
                    Statement st=con.createStatement();
                    int i=st.executeUpdate(sql);
                    if(i>0){
                      //pw.print("Your Account has been opened..");
                    Connection con1=ConnectionProvider.DistributeConn();
                    String sql1="update CustomerAccount set Cust_Name=(select Name from UserDetails  where isNew='Yes'),Customer_ID=(select Customer_ID from UserDetails where isNew='Yes') where Adhar_Card_No='"+adhar_no+"'  ";
                    Statement st1=con1.createStatement();
                    int j=st1.executeUpdate(sql1);
                    if(j>0){
                    Connection con2=ConnectionProvider.DistributeConn();
                    String sql2="update CustomerAccount set IsNew='NO'";
                    Statement st2=con2.createStatement();
                    int k=st2.executeUpdate(sql2);
                    if(k>0){
                    Connection con3=ConnectionProvider.DistributeConn();
                    String sql3="update CustomerAccount set IsNew='Yes' where Adhar_Card_No='"+adhar_no+"' ";
                    Statement st3=con3.createStatement(); 
                    int l=st3.executeUpdate(sql3);
                    if(l>0){
                    Connection con4=ConnectionProvider.DistributeConn();
                    String q="insert into Account_Info (Amount,Balance,Account_Status,Operated_By,Txn_Date,Event_Status) values('"+amt+"','"+bal+"','"+Account_st+"','"+operate+"','"+Txn_Date+"','"+event_Status+"')";
                    Statement st4=con4.createStatement();
                     int res=st4.executeUpdate(q);
                     if(res>0){
                      Connection con6=ConnectionProvider.DistributeConn(); 
                      String Que="update Account_Info SET Account_No=(select Account_No from CustomerAccount where Adhar_Card_No='"+adhar_no+"'),Cust_Name=(select Cust_Name from CustomerAccount where Adhar_Card_No='"+adhar_no+"'),Customer_ID=(select Customer_ID from CustomerAccount where Adhar_Card_No='"+adhar_no+"') where Event_Status='"+event_Status+"'";
                      Statement st6=con6.createStatement();
                      int m=st6.executeUpdate(Que);
                      if(m>0){
                       Connection con7=ConnectionProvider.DistributeConn(); 
                      String Qe="update Account_Info SET Event_Status='Yes' where Event_Status='"+event_Status+"'";
                      Statement st7=con7.createStatement();
                      int n=st7.executeUpdate(Qe);  
                      if(n>0){
                          response.sendRedirect("Welcome.jsp");
                      }else{
                          pw.println("Sorry something went wrong");
                      }
                      
                     }
                     }
                    }
                    }
                    }
                    }
                  
                } catch (Exception e) {
                    pw.println("Sorry something went wrong"+e);
                  }
              }
        } catch (Exception e) {
            System.out.print("hhhhhhh."+e);
        }
    }
}
