<%-- 
    Document   : index
    Created on : Jan 25, 2017, 1:10:15 PM
    Author     : ANISH
--%>

<%@page import="java.util.Date"%>
<%@page import="Bean.Account_User"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
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
            #j:hover{
                background: white;
            }
            #full {
                overflow-y: scroll;
                height: 230px;
                
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
                               <fieldset style="font-size: 13px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 23px;margin: 10px; padding: 20px; max-width: 90%; height:auto">
                                   <legend><b>Transaction History of Account</b></legend>
                                   <%
                        try{
                         Connection c=ConnectionProvider.DistributeConn();
                         String s="select Account_No,Cust_Name from UserDetails join CustomerAccount Cust_Name on Name=Cust_Name where Username='"+m+"'";
                          Statement st=c.createStatement();
                         ResultSet rs=st.executeQuery(s);
                         while(rs.next()){
                             
                        %>
                        <form action="" method="post">
                        <table style="" cellpadding="" cellspacing="15">
                                   <tbody>
                                       <tr>
                                          <td>Account No <font color="red">*</font>
                                <br><select name="st1" style="width: 130px;height: 25px">
                                                   <option value="UNKNOWN">--select account--</option>
                                                   <option><%=rs.getLong("Account_No")%></option>
                                               </select>
                            </td>
                            <td>Choice History <font color="red">*</font>
                                <br><select name="st" style="width: 130px;height: 25px">
                                               <option value="Unknown">--select choice--</option>
                                               <option value="Top 5">Top 5 Statement</option>
                                               <option value="Full Statement">Full Statement</option>
                                               </select>
                            </td>
                            <td>
                                <br><input type="submit" name="btn" value="Get Statement" style="background: orange"></td>
                                       
                                       </tr>
                                       
                                   </tbody>
                               </table> 
                        </form>
                                                                   
                      <%}%>  
                    <div style="text-align: left;font-size: 12px;color: #000; font-family: verdana, helvetica, arial, sans-serif;line-height: 20px;">
    <%
   try{
      String button=request.getParameter("btn");
if(button.equals("Get Statement")){
            String str=request.getParameter("st1");
            long acc_no=Long.parseLong(str);
            
            String tx=request.getParameter("st");
            if(tx.equals("Unknown")){
                out.print("Sorry Unknown");
            }
            if(tx.equals("Top 5") || tx.equals("Full Statement")){
            Connection con=null;
             ResultSet r=null;
                if(tx.equals("Top 5")){
               con=ConnectionProvider.DistributeConn();
                   String Query1="select TOP 5 Account_No,Amount,Balance,Operated_By,Txn_Date,Reference_No from Account_Info  "
                           + "where Account_No='"+acc_no+"'ORDER BY Txn_Date DESC";
                   Statement st1=con.createStatement(); 
                   r=st1.executeQuery(Query1);
                   %>
                    <table cellspacing="0" cellpadding="5" border="0"  style="width: 90%;">
                           <tbody> 
                               <tr style="background: antiquewhite">
                                   <th style="">Account No</th>
                                   <th style="" >Amount</th>
                                   <th style="">Balance</th>
                                   <th style="">Operated By</th>
                                   <th style="">Transaction ID</th>
                                   <th style="">Reference No</th>
                               </tr>
                   <%
                   while(r.next()){
                      %>
                      <tr id="j">
                          <td style=""><%=r.getLong("Account_No")%></td>
                          <td style=""><%=r.getDouble("Amount")%></td>
                          <td style=""><%=r.getDouble("Balance")%></td>
                          <td style=""><%=r.getString("Operated_By")%></td>
                          <td style=""><%=r.getString("Txn_Date")%></td>
                          <td style=""><%=r.getString("Reference_No")%></td>
                      </tr>
                      <%
                   }
                     %>      </tbody>
                   </table>
                <%      
                           }if(tx.equals("Full Statement")){
                con=ConnectionProvider.DistributeConn();
                   String Query1="select Account_No,Amount,Balance,Operated_By,Txn_Date,Reference_No from Account_Info  "
                           + "where Account_No='"+acc_no+"'ORDER BY Txn_Date DESC";
                   Statement st1=con.createStatement(); 
                   r=st1.executeQuery(Query1);
                   %>
                  <div id="full"> <table cellspacing="0" cellpadding="4" border="0"  style="width: 90%;">
                           <tbody> 
                               <tr style="background: antiquewhite">
                                   <th style="">Account No</th>
                                   <th style="" >Amount</th>
                                   <th style="">Balance</th>
                                   <th style="">Operated By</th>
                                   <th style="">Transaction ID</th>
                                   <th style="">Reference No</th>
                               </tr>
                               
                   <%
                   while(r.next()){
                      %>
                      <tr id="j" >
                          <td style=""><%=r.getLong("Account_No")%></td>
                          <td style=""><%=r.getDouble("Amount")%></td>
                          <td style=""><%=r.getDouble("Balance")%></td>
                          <td style=""><%=r.getString("Operated_By")%></td>
                          <td style=""><%=r.getString("Txn_Date")%></td>
                          <td style=""><%=r.getString("Reference_No")%></td>
                      </tr>
                      <%
                   }
                     %>      </tbody>
                      </table></div>
          <%  }
                
                      }
                       }
  
}catch(Exception e){
    System.out.print(e);
}
%>
                      </div>
                      
                               </fieldset>
                                <%       
                                                                                                                          
}catch(Exception e){
    out.print(e);
}
%>



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
