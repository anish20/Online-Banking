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
                <img src="image/Login header.jpg" style="width: 100%;height: 150px;">
            </div> 
            <div id="content" style="padding: 10px;background-image: url(image/lbg3.jpg);background-repeat: no-repeat;">
                <span><marquee>Welcome to Admin New User</marquee></span>
               
                    <%
                    String ms=(String)request.getAttribute("M");
                    if(ms!=null){
                        %>
                        <div style="text-align: center;color: red"><%=ms %></div>
                    <%
                    }
                    
                    %>
                    <%
                    Long msd=(Long)Math.round(Math.random()*100000);
                   
                    %>
              
                <form action="AdminController.jsp" method="post">
                    
                <table cellpadding="7" style="margin: auto;font-size: 14px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 25px;">
                    <tr>
                        <td>
                         Admin New ID </td>
                        <td><input type="text" name="id" placeholder="Admin New ID" value="<%=msd%>" title="Please Enter Two Character before digit and generate Admin ID">
                            </td>
                    </tr>
                     <tr>
                        <td>
                        New Password
                        </td>
                        <td> <input type="password" name="pass" placeholder="Admin New Password">
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button name="btn" value="Save Data">Save Data</button>
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
