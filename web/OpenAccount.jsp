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
                       
                <div style="padding: 10px;width:auto;height: auto;font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;">
                    <form action="AccountController" method="post">
                        <fieldset style="width:80%;margin:auto;background: azure; border: solid 1px;">
                        <legend><b>Account Creation Form</b></legend>
                        <table cellpadding="5" cellspacing="20" style="width:auto;height: auto">
                        <tr>
                            
                            <td>Adhar Card No. <font color="red">*</font>
                                <br><input type="text" maxlength="12" name="adh" placeholder="Adhar Card No." required="Please Enter Adhar No." style="width: 100%; height: 22px;border-radius: 5px;">
                            </td>
                            <td>Pan Card No <font color="red">*</font>
                                <br><input type="text" name="pn" maxlength="12" placeholder="Pan Card No." required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                            </td>
                            <td>Occupation <font color="red">*</font>
                                <br><input type="text" list="list" name="ocp" placeholder="Occupation"required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                            <datalist id="list">
                                <option>Student</option>
                                <option>Employee</option>
                                <option>Teacher</option>
                                <option>Doctor</option>
                                <option>Others</option></datalist>
                            </td>
                        <tr>
                            
                                
                        
                            <td>Industry<font color="red">*</font>
                                <br><input type="text" list="ind" name="ind" placeholder="Industry" required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                            <datalist id="ind">
                                <option>IT</option>
                                <option>BPO & Consultancy</option>
                                <option>Medical & Pharmacy</option>
                                <option>Professional</option>
                                <option>Others</option></datalist>
                            </td>
                            <td>Source Income<font color="red">*</font>
                               <br><input type="text" list="inc" name="inc"  placeholder="Source Income"required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                            <datalist id="inc">
                                <option>Salary</option>
                                <option>Business</option>
                                <option>LIC Maturity</option>
                                <option>Savings</option>
                                <option>Others</option></datalist>
                            </td>
                            <td>Income Annual Rang  <font color="red">*</font>
                               <br><input type="text" list="rng" name="ainc" placeholder="Annual Income Rang" required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                            <datalist id="rng">
                                <option>0 upto 1 Lakh</option>
                                <option>1 Lakh upto 5 Lakh</option>
                                <option>5 Lakh upto 10 Lakh</option>
                                <option>10 Lakh upto 50 Lakh</option>
                                <option>50 Lakh upto Above</option>
                                
                            </td> 
                        </tr>
                        <tr>
                            <td>Nominee's Details<font color="red">*</font>
                                <br><input type="text" name="nom" placeholder="Nominee Datails" required=""required="" style="width: 100%;height: 22px;border-radius: 5px;"></td> 
                              <td>Nominee Relation<font color="red">*</font>
                                  <br>
                                  <select name="rl"style="width: 100%;height: 22px;border-radius: 5px;">
                                      <option>--select your relation--</option>
                                      <option>Father</option>
                                      <option>Mother</option>
                                      <option>Wife</option>
                                      <option>brother</option>
                                      <option>others</option>
                                  </select>
                              </td> 
                              <td> Enter a Unique word<font color="red">*</font>
                                  <br><input type="text" list="rng1" name="ans" placeholder="Choose magical Value" required=""required="" style="width: 100%;height: 22px;border-radius: 5px;">
                            <datalist id="rng1">
                                <option>Water = H2O</option>
                                <option>Salt = NaCl</option>
                                <option>00+0 = 00</option>
                                <option>Digi = Bank</option>
                                
                              </td> 
                              
                        </tr>
                            <tr>
                            
                                <td colspan="3" align="right"><input id="bt"type="submit" name="btn" value="Continue" style="background: cadetblue;width: 100px">
                             
                            </td>
                        </tr> 
                    </table>
                        </fieldset>
                       
                       </form><br>
                
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
