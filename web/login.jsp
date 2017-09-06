<%-- 
    Document   : index
    Created on : Jan 25, 2017, 1:10:15 PM
    Author     : ANISH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                    <marquee><font color="red">Welcome to Login Page</font></marquee>
                </div>  
                   </td>
               </tr>
               <tr>
                   <td>
                        <div style="padding: 0px;width:auto;height: auto">
                    
                   <center> 
                                              <%
                      
                                              try{
String ms=(String)request.getAttribute("MSG");
if(ms!=null){
           
   %>
  

   <div  style="text-align: center;margin: 10px; background: cornsilk;width: 50%;padding-bottom: 10px;padding-top: 10px;color: red" >  <%=ms%></div>
   <%
     }
                                              }catch(Exception e){
                                                  
                                                                                                   }
   %>
                         </center>
                    <div id="ho"style="background: aliceblue;width: 50%;margin: auto;height: auto; border: solid 1px hotpink ; border-radius: 8px;">
                        
                    <form action="LoginController" method="post">
                        
                        <table cellpadding="7" style="margin-left: 15px;;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                            <tr>
                                <td align="center">
                                    <span class="" ><img src="img/login.png"  style="font-size:70px; border-radius: 90px;border: solid 1px white; width: 60px;height: 60px; "></span>
                                </td>  
                            </tr>  
                        <tr>
                            
                            <td><img src="icon/padlock.png" style="">&nbsp;&nbsp;&nbsp;<input type="text" name="un" placeholder=" Username" required="" style=" height: 20px;border-radius: 8px;width: 53%;" id="sm"></td>
                        </tr>
                        <tr>
                           
                            <td><img src="icon/password.png" style="">&nbsp;&nbsp;&nbsp;<input type="password" name="up" placeholder=" User Password" required="" style=" height: 20px;border-radius: 8px;width: 53%;" id="sm"></td>
                        </tr>
                        <tr>
                            
                            <td ><button id="bt"type="submit" name="btn" value="Login" style="border: none;background: none" ><img src="img/loginbt.png" style="width: 70px;height: 22px;"></button>
                           &nbsp; <a id="ln"href="forget_pass.jsp" style="text-decoration: none">Forget Password</a>
                           &nbsp;&nbsp;&nbsp;<a id="ln" href="Register.jsp" style="text-decoration: none"><span><img src="img/new_user.png" style="font-size:70px; border-radius: 90px; width: 25px;height: 25px; ">&nbsp;New User Account</span></a>
                            </td>
                        </tr>
                      
                    </table>
                        <br>
                    </form>
                      
                    </div>
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
