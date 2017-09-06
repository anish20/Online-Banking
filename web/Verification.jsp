<%-- 
    Document   : index
    Created on : Jan 25, 2017, 1:10:15 PM
    Author     : ANISH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS\styles.css" type="text/css" rel="stylesheet" />
        <link href="CSS\layout.css" rel="stylesheet" type="text/css" />
       
        
        <script>
  
      </script>
      
    </head>
    <body background="image/bn.gif">
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
                    <MARQUEE BEHAVIOR="ALTERNATE"><font color="red">Welcome to Verification page</font></MARQUEE>
                </div>  
                   </td>
               </tr>
               <tr>
                   <td>
                        <div style="padding: 0px;width:auto;height: auto">
                    
                        <div style="padding: 60px;">
                   
                    <fieldset style="width: 50%;margin:auto;background: white; ">
                        <legend>Captcha Verification</legend>
                        <table cellpadding="7" style="">
                            <tr>
                                <td>Captcha Code</td>
                                <td><img id="captcha" src="<c:url value="simpleCaptcha.jpg"  />" width="150"></td>
                            </tr>
                            <form action="ServletController" method="get">
                            <tr>
                            <td>Enter Captcha</td>
                            <td><input type="text"name="answer" required="" placeholder="  Enter Captcha"  style="width: 85%;height: 25px" /></td>
                             
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><input type="submit"value="Verify" style="width: 100px;"></td>
                                 </form>
                            </tr>
                        </table>
                        </fieldset>                
                    
                <%
               
String ms=(String)request.getAttribute("CP");
if(ms!=null){
    %>
    <br>
    <div style="text-align: center;color: red;"><%=ms%></div>
    <%
}
%>
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
