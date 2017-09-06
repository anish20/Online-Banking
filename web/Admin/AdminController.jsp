<%-- 
    Document   : AdminController
    Created on : Jun 17, 2017, 11:15:09 PM
    Author     : ANISH
--%>

<%@page import="Connection.ConnectionProvider"%>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%!
       String button;
       String ID="";
       String Pass="";
       String Status="YES";
       Connection con=null;
       Statement st=null;
       String Queery;
       %>
       <%
       button=request.getParameter("btn");
       %>
       <%
       if(button.equals("Admin Login")){
         ID=request.getParameter("id");
          Pass=request.getParameter("pass");
          if(ID.equals("") || ID==null || Pass.equals("") || Pass==null ){
             String msg="Sorry! Please ID and Password must be Fill Up";
             request.setAttribute("M", msg);
             request.getRequestDispatcher("Admin_Login.jsp").forward(request, response);
             
          }else{
              try{
                 con=ConnectionProvider.DistributeConn();
                 Queery="select * from AdminUser where Admin_ID='"+ID+"' and Admin_Pass='"+Pass+"' ";
                 st=con.createStatement();
                 ResultSet rs=st.executeQuery(Queery);
                 if(rs.next()){
                    session.setAttribute("AID", ID);
                    response.sendRedirect("Admin_Home.jsp");
                 }else{
                    String msg="Sorry! Admin ID and Password is Incorrect";
             request.setAttribute("M", msg);
             request.getRequestDispatcher("Admin_Login.jsp").forward(request, response); 
                 }
              }catch(Exception e){
                 out.print("Sorry!"+e);  
              }
          }
       }
       %>
       <%
       if(button.equals("New Admin")){
           response.sendRedirect("New_Admin.jsp");
       }
       %>
       <%
       if(button.equals("Save Data")){
          ID=request.getParameter("id");
          Pass=request.getParameter("pass");
          if(ID.equals("") || ID==null || Pass.equals("") || Pass==null ){
             String msg="Sorry! Please ID and Password must be Fill Up";
             request.setAttribute("M", msg);
             request.getRequestDispatcher("New_Admin.jsp").forward(request, response);
          }else{
              try{
                  con=ConnectionProvider.DistributeConn();
                  Queery="insert into AdminUser values('"+ID+"','"+Pass+"','"+Status+"')";
                  st=con.createStatement();
                  int result=st.executeUpdate(Queery);
                  if(result>0){
                      response.sendRedirect("Admin_Login.jsp");
                  }else{
                    out.print("Not Inserted..");  
                  }
              }catch(Exception e){
                 out.print("Sorry!"+e); 
              }finally{
                  con.close();
              }
          }
       }
       %>
       
       
    </body>
</html>
