/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import nl.captcha.Captcha;
import Connection.ConnectionProvider;
import Model.UserData;
//import com.sun.xml.rpc.tools.wscompile.UsageIf;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
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
public class ServletController extends HttpServlet {

    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        response.setContentType("text/html");
        PrintWriter pw=response.getWriter();
        HttpSession session=request.getSession();
        
        String s1=request.getParameter("salute");
        String fn=request.getParameter("fnm");
        String db=request.getParameter("dob");
        String e=request.getParameter("em");
        String un=request.getParameter("un");
        long mn=Long.parseLong(request.getParameter("mn"));
        String ps=request.getParameter("ps");
        String cp=request.getParameter("cps");
        if(ps.equals(cp)){}
        String cn=request.getParameter("con");
        session.setAttribute("S",s1);
        session.setAttribute("FM",fn);
        session.setAttribute("DB",db);
        session.setAttribute("EM",e);
        session.setAttribute("UN",un);
        session.setAttribute("MN",mn);
        session.setAttribute("PW",cp);
        session.setAttribute("CN",cn);
        RequestDispatcher rd=request.getRequestDispatcher("Verification.jsp");
        rd.forward(request, response);
    }


    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        response.setContentType("text/html");
        try {
            
        
        PrintWriter pw=response.getWriter();
        HttpSession session=request.getSession();  
	Captcha captcha = (Captcha)session.getAttribute(Captcha.NAME);
	request.setCharacterEncoding("UTF-8");
	String answer = request.getParameter("answer");
	if (captcha.isCorrect(answer)) {
          
          String s=(String)session.getAttribute("S");
          String fn=(String)session.getAttribute("FM");
          String db=(String)session.getAttribute("DB");
          String em=(String)session.getAttribute("EM");
          String un=(String)session.getAttribute("UN");
          long mn=(Long)session.getAttribute("MN");
          String ps=(String)session.getAttribute("PW");
          String cn=(String)session.getAttribute("CN");
          String isNew="No";
          
          try {
                
                Connection con=ConnectionProvider.DistributeConn();
                String sql="insert into UserDetails(Salutation,Name,DOB,Email_ID,Username,Mobile_No,Password,Country,isNew) values('"+s+"','"+fn+"','"+db+"','"+em+"','"+un+"','"+mn+"','"+ps+"','"+cn+"','"+isNew+"')";
                Statement st=con.createStatement();
                int i=st.executeUpdate(sql);
                con.close();
                if(i>=1){
                RequestDispatcher rd=request.getRequestDispatcher("welcome_Profile.jsp");
                rd.forward(request, response);
                con.close();
               }
                Connection con2=ConnectionProvider.DistributeConn();
                String sql2="update UserDetails set isNew='NO'";
                Statement st1=con2.createStatement(); 
                int j=st1.executeUpdate(sql2);
                if(j>0){
                System.out.print("Update Successfully...");
                }
                
                else{
                   pw.print("Sorry Something went wrong"); 
                }
                
                Connection con1=ConnectionProvider.DistributeConn();
                String sql4="update UserDetails set isNew='Yes' where Name='"+fn+"'";
                Statement st2=con1.createStatement();
                int j1=st2.executeUpdate(sql4);
                if(j1>0){
                System.out.print("Update Successfully...");
                }
                
            
            } catch (Exception e) {
              RequestDispatcher rd=request.getRequestDispatcher("Register.jsp");
               String ms="Sorry this Credential Already Exist so Need Diffence";
               request.setAttribute("MS", ms);
              rd.forward(request, response);
              System.err.println("sooo"+e);
            }
        }else{
         
            RequestDispatcher rd=request.getRequestDispatcher("Verification.jsp");
           String msg="Sorry Incorect Captcha";
           request.setAttribute("CP", msg);
           rd.forward(request, response); 
        }
        
           
        
    } catch (Exception e) {
        System.out.print("khuch galat ho raha hai.."+e);
        }    
    }     
        
}