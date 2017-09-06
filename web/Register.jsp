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
        <link href="Look\Image_Effect\img.css" rel="stylesheet" type="text/css" />
        
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
                    <marquee><font color="red">Welcome to Registration Page</font></marquee>
                </div>  
                   </td>
               </tr>
               <tr>
                   <td>
                        <div style="width:auto;height: auto">
                     <%
           String m=(String)request.getAttribute("MS");
          if(m!=null){
          %>
          <div style="text-align: center;color: red;padding: 15px;background: antiquewhite;width: 50%;margin: auto;font-size: large;"> <%=m%> <a id="cn"style="text-decoration: none"href="Register.jsp" >Cancel</a></div>
          <%
}            
%>       
                <div style="padding:0px;width:auto;height: auto">
                    <form action="ServletController" method="post" name="f1" onsubmit="return matchpass()">
                        <fieldset style="width:70%;margin:auto;background:azure ; border: solid 1px">
                        <legend><b>Registration Information</b></legend>
                        <table cellpadding="6" cellspacing="20" style="width:auto;height: auto;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                        <tr>
                            <td>Salutation <font color="red">*</font>
                                <br><input  type="radio" name="salute" required="" value="Mr" >Mr.
                                &nbsp;&nbsp;&nbsp;&nbsp;<input  type="radio" required="" name="salute" value="Ms">Ms.
                            </td>
                            <td>Full Name <font color="red">*</font>
                                <br><input type="text" name="fnm" placeholder="Full Name"  required="" style="width: 100%; height: 22px;border-radius: 5px;">
                            </td>
                            <td>Date of Birth <font color="red">*</font>
                                <br><input type="date" name="dob"  required=""required="" placeholder="YYYY-MM-DD" style="width: 100%;height: 22px;border-radius: 5px;">
                            </td>
                        <tr>
                            <td>Email ID <font color="red">*</font>
                                <br><input type="email" name="em"  placeholder="Email ID" required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                            </td>
                            <td>Username <font color="red">*</font>
                                <br><input type="text" name="un" placeholder="Username" required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                            </td>
                            <td>Mobile No <font color="red">*</font>
                                <br><input type="text" name="mn" placeholder="Mobile No" pattern="[0-9]{10}" maxlength="10"  required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Create Password <font color="red">*</font>
                                <br><input type="password" name="ps" placeholder="Password" required=""required="" style="width: 100%;height: 22px;border-radius: 5px;"></td> 
                             <td>Confirm Password <font color="red">*</font>
                                 <br><input type="password" name="cps" placeholder="Confirm Password" required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                             <br>
                                <span id="check" style="color: red"></span>
                             </td> 
                              <td>Country Name <font color="red">*</font>
                                  <br><input type="text" name="con" placeholder="Country Name" required=""required="" style="width: 100%;height: 22px;border-radius: 5px;"></td> 
                        </tr>
                            <tr>
                            
                                <td colspan="3" align="right"><input id="bt"type="submit" name="btn2" value="Continue" style="background: cadetblue;width: 100px">
                             
                            </td>
                        </tr>
                    </table>
                        </fieldset>
                       </form><br>
                    <%
              String ms=(String)request.getAttribute("MSG");
              
              if(ms!=null){
    
    %>
    <div style="text-align: center;color: red;padding: 15px;background: antiquewhite;width: 70%;margin: auto;font-size: large;" ><%=ms%><a id="cn"style="text-decoration: none"href="Register.jsp" >Cancel</a></div>
    <%
}
%>
                   
                </div>
                   </td>
               </tr>
           
               <tr>
                   <td>
                       <div style="background: lightgray;height: 50px;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                           <div style="float: left;padding: 10px;">Copyright&COPY;2017</div> 
                            </div>
                   </td>
               </tr>
           </tbody>
        </table>
    </body>
</html>
