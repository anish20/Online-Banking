/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.UpdateData;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ANISH
 */
public class UpdateController extends HttpServlet {

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
        String button=request.getParameter("btn");
        if(button.equals("Update Email")){
        String e=request.getParameter("email");
         String h=request.getParameter("hd");
         try {
            String sql="update UserDetails set Email_ID='"+e+"' where Username='"+h+"'";
            int result=UpdateData.updateEmail(sql);
            if(result>0){
               String ms="Email Update Sucessfully!";
               RequestDispatcher rd=request.getRequestDispatcher("Change_Email.jsp");
               request.setAttribute("Mes", ms);
               rd.forward(request, response);
            }
        } catch (Exception e1) {
            System.out.print(e1);
        }
        }
        else if(button.equals("Update Contact")){
            
            try {
               long contact=Long.parseLong(request.getParameter("cont"));
               String f=request.getParameter("hd");
               String sql="update UserDetails set Mobile_No='"+contact+"' where Username='"+f+"'";
            int result=UpdateData.updateContct(sql);
            if(result>0){
               String ms1="Contact No Update Sucessfully!";
               RequestDispatcher rd=request.getRequestDispatcher("Change_Contact.jsp");
               request.setAttribute("Me", ms1);
               rd.forward(request, response);
            } 
            } catch (Exception e) {
               String ms1="Sorry! Please Input numeric value";
               RequestDispatcher rd=request.getRequestDispatcher("Change_Contact.jsp");
               request.setAttribute("Me", ms1);
               rd.forward(request, response); 
            }
         
        }else if(button.equals("Save Address")){
             
             try {
               String address=request.getParameter("add").toUpperCase();
               String hidden=request.getParameter("hd");
               String sql="update UserDetails set Cust_Address='"+address+"' where Username='"+hidden+"' ";
               int result=UpdateData.updateAddress(sql);
               if(result>0){
               String ms1="Address Update Sucessfully!";
               RequestDispatcher rd=request.getRequestDispatcher("Address.jsp");
               request.setAttribute("Mes", ms1);
               rd.forward(request, response);  
               }
               
            } catch (Exception e) {
               String ms1="Sorry! Something went wrong!!";
               RequestDispatcher rd=request.getRequestDispatcher("Address.jsp");
               request.setAttribute("Mes", ms1);
               rd.forward(request, response); 
            }
        }
        
        
    }
}