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
        <link href="CSS\layout.css" rel="stylesheet" type="text/css" />
       
        
        
        <style>
   .du ul{
   padding: 0;
   margin: 0;
   list-style-type: none;
   overflow: hidden;
}
 .du ul li{

 float: right;
}     
.du ul li a{
    display: block;
    color: blue;
    text-align: center;
    padding: 16px 10px;
    text-decoration: none;
} 

#ms a:hover{
    color: red;
    
}

#ln a:hover{
    color: green;
}
        </style>
      
    </head>
     <body  background="image/bn.gif">
        <table style="width: 70%;height: auto ;overflow: hidden;margin: auto;" >
           <tbody>
               <tr>
                   <td colspan="2" style="">
                       <table style="width: 100%;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
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
                    <MARQUEE BEHAVIOR="ALTERNATE"><font color="red">Thanks To Visiting Us!!</font></MARQUEE>
                </div>  
                   </td>
               </tr>
               <tr>
                   <td>
                     <div style="padding:40px; font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                <div style="background: white;width: 80%;height: auto;border: solid 1px;margin: auto;">
                    <div id="ms"style="background: burlywood;height: auto;font-size: large;text-align: center;padding: 20px;border-bottom-style: solid;border-bottom-width: thin;"><a>Message against Successfully Account creation </a></div> 
                    <br> <div style="background:lemonchiffon; height: 80px; width: 60%; border-radius:8px;margin: 10px;text-align: center;margin: auto;padding-top: 10px;color: green;font-weight: bold">
                        <br> Your Account has been opened .&nbsp;Thank You!!!
                    </div>
                    <p id="ln"style="text-align: center">Now You need Login to Manage your Account&nbsp;&rArr;&nbsp;&nbsp;<a href="login.jsp" style="text-decoration: none">Click to Login here</a></p>
                </div> 
                </div> 
                   </td>
               </tr>
               <tr>
                   <td><br><br>
                       <div style="background: lightgray;height: 50px;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                           <div style="float: left;padding: 10px;">Copyright&COPY;2017</div> 
                           </div>
                   </td>
               </tr>
           </tbody>
    </body>
</html>
