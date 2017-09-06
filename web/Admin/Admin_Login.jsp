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
            <div id="header">
                <img src="image/Login header1.png" style="width: 100%;height: 150px;">
            </div> 
            <div id="content" style="padding: 10px;background-image: url(image/lbg3.jpg);background-repeat: no-repeat;">
                <span><marquee>Welcome to Admin Login</marquee></span>
                <%
                    String ms=(String)request.getAttribute("M");
                    if(ms!=null){
                        %>
                        <div style="text-align: center;color: red"><%=ms %></div>
                    <%
                    }
                    
                    %>
                <form action="AdminController.jsp" method="post">
                <table cellpadding="7" style="margin: auto;font-size: 14px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 25px;">
                    <tr>
                        <td>
                         Admin ID </td>
                        <td><input type="text" name="id" placeholder="Admin ID">
                            </td>
                    </tr>
                     <tr>
                        <td>
                        Password
                        </td>
                        <td> <input type="password" name="pass" placeholder="Admin Password">
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button name="btn" value="Admin Login">Admin Login</button> <button name="btn" value="New Admin">New Admin</button>
                        </td>
                    </tr>
                </table>
                </form>
            </div> 
            <div id="footer" style="padding: 5px;">
                
                    Copyright&COPY;2017  Admin User
               
            </div> 
        </div>
        
    </body>
</html>
