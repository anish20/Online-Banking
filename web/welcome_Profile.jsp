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
.du ul li a:hover{
   
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
                       <div style="padding: 30px;width:auto;height: auto;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                    <div id="ms"style="width: 80%;margin: auto;height: 280px; background: 0;border:solid 1px hotpink">
                        
                        <div style="width: 100%;height: 50px;background: mistyrose;border-bottom-style: solid;border-bottom-width: thin;border-bottom-color: hotpink;">
                            <div class="du" style="">
                            <ul>
                                 <li><a href="Dismiss.jsp">Dismiss</a></li>
                                <li><a href="" style="">Change Username</a></li>
                                <li><a href="change_Pass.jsp" >Change Password</a></li>
                                <li><a style="color: green;">
                                        <%
String ms=(String)session.getAttribute("FM") ;
if(ms!=null){
    %>
    <b>Welcome!</b><%="\t"+ "\t"+ms%>
    <%
}
%>
                                    </a></li>
                            </ul>
                               
                            </div>
                            &nbsp; <b>Account Opening Facilities &rArr;</b>
                            
                                    <div style="padding: 50px;text-align: left;">
                                        <a href="OpenAccount.jsp"><img title="Please Open your Account"id="im" src="icon/on.jpg" style="width: 150px;height: 115px;border: solid 1px hotpink;border-radius: 15px;"></a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="OpenAccount.jsp"><img id="im"title="If you want to your Wallet Account" src="icon/vo1.jpg" style="width: 150px;height: 115px;border: solid 1px hotpink;border-radius: 15px;"></a>
                                    </div>      
                        </div>
                        
                        
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
        </table>
    </body>
</html>
