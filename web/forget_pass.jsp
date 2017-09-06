<%-- 
    Document   : index
    Created on : Jan 25, 2017, 1:10:15 PM
    Author     : ANISH
--%>

<%@page import="java.sql.*"%>
<%@page import="Connection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS\layouts.css" rel="stylesheet" type="text/css" />
       
        
        
        <style>
            
            #ms{
            background-image: url("image/lbg.jpg");
                background-repeat: no-repeat;
               background-size: cover;
            }
            #sm:hover{
                background: azure;
            }
           
             #ln:hover{
               color: red;
               
            }
            #bt:hover{
               color: red;
               
            }
            
                

            #ho:hover{
               background: aliceblue; 
            }
        </style>
      
    </head>
    <body background="image/bn.gif">
        <table style="width: 70%;height: auto ;overflow: hidden;margin: auto;" >
           <tbody>
               <tr>
                   <td colspan="2" style="">
                       <table style="width: 100%">
                           <tr>
                               <td style="background: beige">
                                   <div style="margin: 10px;">
                                    <img src="img/an.PNG" height="100" width="200" alt="E-Banking System" title="E-Banking System">
                                       
                                   </div>
                               </td>
                              
                           </tr>
                          
                       </table>
                   </td>
               </tr>
               <tr>
                   <td>
                     <div style="margin: 10px;">
                    <marquee><font color="red">Welcome to Password Retrieving page</font></marquee>
                </div>  
                   </td>
               </tr>
               <tr>
                   <td>
                        <div style="padding: 0px;width:auto;height: auto;">
                    
                    
                      
                    <form action="ForgetPasController" method="post">
                        
                        <table cellpadding="18" style="border-collapse: collapse;background: azure;margin: auto;padding: 8px;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 30px;">
                            <tr>
                                <td colspan="2"style="background: antiquewhite;"><b>Retrieve Forget Password</b></td>
                                
                            </tr>
                        <tr>
                            <td>
                                <img src="icon/user-shape.png" style="width: 18px;">&nbsp;&nbsp;<input type="text" name="un" placeholder=" Username" required="" style=" height: 20px;border-radius: 8px;" id="sm"></td>
                        </tr>
                        
                        <tr>
                            
                            <td colspan="2"><input id="bt"type="submit" name="btn" value="Get Password" style="background: cadetblue;width: 100px;">
                           &nbsp; <a id="ln"href="change_Pass.jsp" style="text-decoration: none">Change the Password</a>
                             &nbsp;&nbsp;<a id="ln" href="login.jsp" style="text-decoration: none">Back to Login</a>
                            </td>
                        </tr>
                      
                    </table>
                        <br>
                        
                        <%
String s=(String)request.getAttribute("Pass");
if(s!=null){

 
  %>
                           <center> <div style="color: white;text-align: left;background: hotpink;width: 40%;padding: 10px;font-size: 13px; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                                    Your Password is : <%=s%>
                               </div></center>
                               
                           <%
}
%>
<%
String m=(String)request.getAttribute("MSG");
if(m!=null){
    %>
    <center> <div style="color: white;text-align: left;background: hotpink;width: 40%;padding: 10px;font-size: 13px; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                                     <%=m%>
                               </div></center>
    <%
}
%>

                        
                    </form>
                      
                   
                </div>
                   </td>
               </tr>
           
               <tr>
                   <td><br><br><br>
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
