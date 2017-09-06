<%-- 
    Document   : Logout
    Created on : Jun 9, 2016, 5:43:28 PM
    Author     : ANISH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
session.invalidate(); 
response.sendRedirect("login.jsp");
%>
    </body>
</html>
