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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS\layouts.css" rel="stylesheet" type="text/css" />
       
        
        
        
            
 <script>
function matchpass(){
var firstpassword=document.f1.ps.value;
var secondpassword=document.f1.cps.value;

if(firstpassword==secondpassword){
return true;
}
else{
    document.getElementById("check").innerHTML="Both Password must be same.*";
return false;
}
}
 </script>
      
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
                    <marquee><font color="red">Welcome to Changing your Password Page</font></marquee>
                </div>  
                   </td>
               </tr>
               <tr>
                   <td>
                        <div style="padding: 0px;width:auto;height: auto;">
                    
                    
                      
                    <form action="ChangePassController" method="post" name="f1" onsubmit="return matchpass()">
                        
                        <table cellpadding="8" style="border-collapse: collapse;background: azure;margin: auto;padding: 8px;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 30px;width: 45%">
                            <tr>
                                <td colspan="2"style="background: antiquewhite;"><b>Changing the Password</b></td>
                                
                            </tr>
                        <tr>
                            <td>Username</td>
                            <td> <input type="text" name="un" placeholder=" Username" required="" style=" height: 20px;border-radius: 8px;" id="sm"></td>
                        </tr>
                        <tr>
                            <td>New Password</td>
                            <td> <input type="password" name="ps" placeholder=" New Password" required="" style=" height: 20px;border-radius: 8px;" id="sm">
                            
                            </td>
                        
                        </tr>
                        <tr>
                            <td>Re-Password</td>
                            <td> <input type="password"  name="cps" placeholder=" Re-Password" required="" style=" height: 20px;border-radius: 8px;" id="sm">
                                <br>
                                <span id="check" style="color: red"></span>
                            </td>
                        </tr>
                        <tr>
                            
                            <td colspan="2" align="left"><input id="bt"type="submit" name="btn" value="Change Password" style="background: cadetblue;width: 130px;">
                           
                             &nbsp;&nbsp;<a id="ln" href="login.jsp" style="text-decoration: none">Back to Login</a>
                            </td>
                        </tr>
                      
                    </table>
                      <br>
                        
                        <%
String s=(String)request.getAttribute("CHNG");
if(s!=null){

 
  %>
                           <center> <div style="color: white;text-align: left;background: hotpink;width: 43%;padding: 10px;font-size: 13px; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                                <%=s%>
                               </div></center>
                               
                           <%
}
%>
<%
String m=(String)request.getAttribute("MSG");
if(m!=null){
    %>
    <center> <div style="color: white;text-align: left;background: hotpink;width: 43%;padding: 10px;font-size: 13px; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
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
                           </div>
                   </td>
               </tr>
           </tbody>
        </table>
    </body>
</html>
