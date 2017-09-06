<%-- 
    Document   : index
    Created on : Jan 25, 2017, 1:10:15 PM
    Author     : ANISH
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="CSS/sub_contant.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS\layout.css" rel="stylesheet" type="text/css" />
        <link href="CSS\menu.css" rel="stylesheet" type="text/css" />
         <link href="Image_Effect\img.css" rel="stylesheet" type="text/css" />
       
        <style>
            
            #hm:hover{
                color: red;
               
            }  
            #i:hover{
                color: red;
            }
        </style>
      
    </head>
   <body  background="image/bn.gif">
       <table style="width: 90%;height: auto ;overflow: hidden;margin: auto;" >
           <tbody>
               <tr>
                   <td colspan="2" style="">
                        <table style="width: 100%">
                           <tr>
                               <td><div style="margin: 10px;">
                                       <a href="main.jsp" ><img src="img/an.PNG" height="100" width="200" alt="E-Banking System" title="E-Banking System"></a>
                                       
                                   </div>
                               </td>
                               <td><div style="font-size: 16px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;float: right;padding-top: 20px;padding-bottom: 60px;padding-left: 20px;padding-right: 50px;">
                                       <% String m=(String)session.getAttribute("User");if(m!=null){ %><span style="color: green">Welcome! </span><img src="icon/user (2).png"style="width: 18px;height: 18px;">&nbsp;<%=m%></span> &nbsp;<%}
                           else{
                              RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                              rd.forward(request, response);
                           }
                           
                                       %>&nbsp;<a href="Logout.jsp" id="hm" style="text-decoration: none"><img src="icon/power-button-off.png" style="width: 16px;height: 16px;" >Logout</a>
                       </div>
<div style="float: right;padding-top: 20px;padding-bottom: 60px;padding-left: 20px;padding-right: 50px;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">Last Accessed Time:<%=new Date(session.getLastAccessedTime()) %></div>      
                               </td>
                           </tr>
                       </table>
                       
                   </td>
               </tr>
               <tr>
                   
                   <td style="height: auto;background: lightgray;border: inset 1px antiquewhite;"><div style=" width: 100%;border-radius: 3px;">
                           
                           <div style="float: left;width: 20%;margin: 10px;">
                               <%@include file="Ac_Services.jsp" %> 
                             <br>
                             <%@include file="Ac_Information.jsp" %>
                           </div>
                           
                           <div style="float: right;width: 75%; height: auto">
                               <br>
                               <%@include file="Current_Doc.jsp" %>
                     </div> 
                   </td>
               </tr>
               <tr>
                   <td>
                       <div style="background: lightgray;height: 50px;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                           <div style="float: left;padding: 10px;">Copyright&COPY;2017</div> 
                           <div style="float: left;padding: 10px;"><a href="">Home</a>&nbsp;|&nbsp;<a href="">About Us</a>&nbsp;|&nbsp;<a href="">Contact Us</a></div>
                       </div>
                   </td>
               </tr>
           </tbody>
       </table> 
            
    </body>
</html>
