/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Connection.ConnectionProvider;
import Model.Services;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ANISH
 */
public class doDeposit extends HttpServlet {

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
            long ac;
            String fn;
            double amt;
             String Operate="DEPOSIT";
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String Txn_Date=dateFormat.format(date);
             String evnt="Yes";
            ac=Long.parseLong(request.getParameter("acn"));
            fn=request.getParameter("nm");
            amt=Double.parseDouble(request.getParameter("amt"));
            Connection con=null;
            con=ConnectionProvider.DistributeConn();
            Statement st=con.createStatement();
            String s="select * from CustomerAccount where Account_No='"+ac+"' AND Cust_Name='"+fn+"'";
            ResultSet rs=st.executeQuery(s);
            boolean check=rs.next();
            con.close();
            if(check==true){
               String bal_Sql="select Balance from Account_Info where Account_No='"+ac+"' AND Cust_Name='"+fn+"' AND Event_Status='Yes' " ;
               double bal=Services.getBalance(bal_Sql);
               if(bal==0){
                   System.out.print("Current Balance"+bal);
                   bal =bal+amt;
                   System.out.print("Current Balance"+bal);
               }else{
                   bal=bal+amt;
                   String update_Sql="update Account_Info SET Event_Status='No'where Account_No='"+ac+"' AND Cust_Name='"+fn+"' AND Event_Status='Yes'";
                   double update_bal=Services.updateBalance(update_Sql);
                   System.out.print(bal);
               }
               String sql_insert="insert into Account_Info (Account_No,Cust_Name,Amount,Balance,Operated_By,Txn_Date,Event_Status) values('"+ac+"','"+fn+"','"+amt+"','"+bal+"','"+Operate+"','"+Txn_Date+"','"+evnt+"')";
               double update=Services.updateBalance(sql_insert);
               if(update>0){
                   Connection c=ConnectionProvider.DistributeConn();
                   String sqls="select Balance from Account_Info where Account_No='"+ac+"' AND Event_Status='Yes'";
                   Statement st1=c.createStatement();
                   ResultSet rst=st1.executeQuery(sqls);
                   while(rst.next()){
                    String mst=rst.getString("Balance");
                  RequestDispatcher rd=request.getRequestDispatcher("Deposit.jsp");
                  String ms="Amount Deposited into Account..";
                  request.setAttribute("Amt", ms);
                   request.setAttribute("Amt1", mst);
                  rd.forward(request, response);
                   }
                  
                   
               }else{
                   pw.print("Sorry something went wrong");
               }
            }
        } catch (Exception e) {
            pw.print("Sorry...Errrorr"+e);
            System.out.print("Sorry...Errrorr"+e);
        }
    }
}