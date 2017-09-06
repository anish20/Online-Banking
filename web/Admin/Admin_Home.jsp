<%-- 
    Document   : Admin_Login
    Created on : Jun 17, 2017, 11:16:09 PM
    Author     : ANISH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../CSS/Admin_Structure.css" />
    </head>
    <body>
        <div id="main">
            <div id="header" >
                <img src="image/Loginheader.jpg" style="width: 100%;height: 150px;">
            </div> 
            <div id="menu" style="background-image: url(image/lbg3.jpg);background-repeat: no-repeat;" >
                <div style="float: right">
                    <%
                    String s=(String)session.getAttribute("AID");
                    if(s!=null){
                        %>
                        <div style="padding: 10px;">Welcome! Admin&nbsp;&nbsp;<%=s %>&nbsp;<a href="Admin_Logout.jsp" style="text-decoration: none">Logout</a></div>
                    <%
                    }else{
                        response.sendRedirect("Admin_Login.jsp");
                    }
                    %>
                </div>
            </div>
            <div id="content" style="padding: 10px;">
                Dashboard &rAarr;<a href="">User List</a> | <a href="">New Request</a>
            </div> 
            <div id="footer" style="padding: 5px;">
                
                    Copyright&COPY;2017  Admin User
               
            </div> 
        </div>
        
    </body>
</html>
