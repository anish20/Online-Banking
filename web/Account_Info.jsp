<%-- 
    Document   : index
    Created on : Jan 25, 2017, 1:10:15 PM
    Author     : ANISH
--%>

<%@page import="java.util.Date"%>
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
            #l:hover{
                background: white;
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
                           
                               <fieldset style="margin: 10px; padding: 20px;  max-width:  90%; height: auto;font-size: 14px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 35px;text-align: justify">
                                   <legend><b>Account Information</b></legend>
                                   <%
                        try{
                         Connection c=ConnectionProvider.DistributeConn();
                         String s="select Account_No from UserDetails join CustomerAccount Cust_Name on Name=Cust_Name where Username='"+m+"'";
                          Statement st=c.createStatement();
                         ResultSet rs=st.executeQuery(s);
                         while(rs.next()){
                                                         
                        %>
                        
                        <form method="post">
                        <table cellspacing="10">
                            <tr>
                                <td>Select Account</td>
                                <td><select name="sl"  required="" style="width: 102%; height: 25px;border-radius: 5px;">
                                        <option>--Select Account--</option>
                                        <option style="text-align: center" ><%=rs.getLong("Account_No")%></option>
                                    </select></td>
                                    <td><button><b>Get Info</b>&nbsp;<img src="icon/icon.png" style="width:15px; height: 15px;"></button></td>
                            </tr>  
                        </table> 
                        </form>
         <%
     HttpSession sn=request.getSession();    
long acn= Long.parseLong(request.getParameter("sl"));
sn.setAttribute("sen", acn);
Connection c1=ConnectionProvider.DistributeConn();
Connection c2=ConnectionProvider.DistributeConn();
String sql="select Account_No,Cust_Name,Account_Type from CustomerAccount where Account_No='"+acn+"'";
String sql1="select Balance from Account_Info where Account_No='"+acn+"' AND Event_Status='Yes'";
Statement s2=c2.createStatement();
Statement s1=c1.createStatement();
ResultSet rs1=s1.executeQuery(sql);
ResultSet rs2=s2.executeQuery(sql1);
while(rs1.next()){
while(rs2.next()){
    Connection con=null;
con=ConnectionProvider.DistributeConn();
String sq="select Account_No from CustomerAccount where Account_No='"+acn+"'";
Statement s3=con.createStatement();
ResultSet r=s3.executeQuery(sq);
con=ConnectionProvider.DistributeConn();
String bnk="select Branch_Code,MICR_No,IFSC_Code,Branch_Address from BankInfo where Branch_Code=11095 ";
Statement stm=con.createStatement();
ResultSet set=stm.executeQuery(bnk);

while(r.next()){
while(set.next()){
%>
<table cellspacing="0" cellpadding="0" border="0"  style="float: left;width: 100%;">
    <tr >
        <td colspan="4" style="background: darkcyan">
            <div>Account Info</div>
        </td>
    </tr>
    <tr id="l">
        <td>Balance :</td>
        <td><label style="color: green;font-size: small;"><%= rs2.getDouble("Balance")+"\t"+"INR" %></label></td>
    <td>Account No :</td>
        <td><label style="font-size: small;"><%= rs1.getLong("Account_No") %></label></td>
     
    </tr>
    
    <tr id="l">
        <td>Full Name :</td>
        <td><label style="font-size: small;"><%= rs1.getString("Cust_Name")  %></label></td>
    
        <td>Account Type :</td>
        <td><label style="font-size: small;"><%= rs1.getString("Account_Type")  %></label></td>
    </tr>
    <tr>
        <td colspan="4" style="background: darkcyan"><div>Bank Details</div></td>
    </tr>
   <tr id="l">
        <td>Branch Code :</td>
        <td><label style="font-size: small;"><%= set.getInt(1)  %></td>
         <td>MICR No :</td>
        <td><label style="font-size: small;"><%= set.getInt(2)  %></label></td>
    
    </tr>
    <tr id="l">
        <td>IFSC Code:</td>
        <td><label style="font-size: small;"><%= set.getString(3)  %></label></td>
        <td>Branch Address :</td>
        <td><label style="font-size: small;"><%= set.getString(4)  %></label></td>
    
    </tr>
</table>
    
  
<% 
}
}
}
}
%>                        
     <%
            }
               }catch(Exception e){
                  System.out.println(e);
                    }
%>
                               </fieldset>
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
