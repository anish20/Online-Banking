<%-- 
    Document   : Dismiss
    Created on : Feb 19, 2017, 4:32:11 PM
    Author     : ANISH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Connection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        try{
             
       Connection c =ConnectionProvider.DistributeConn();
       String sql="delete from UserDetails where isNew='Yes'" ;
       Statement stm=c.createStatement();
       stm.execute(sql);
       response.sendRedirect("Register.jsp");
      
}catch(Exception e){
   System.out.print("Sorry Something wrong!!!!"+e); 
}
%>
    </body>
</html>
