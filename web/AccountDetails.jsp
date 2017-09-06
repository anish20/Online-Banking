<%-- 
    Document   : index
    Created on : Jan 25, 2017, 1:10:15 PM
    Author     : ANISH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Connection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">
  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS\layout.css" rel="stylesheet" type="text/css" />
        <link href="CSS\menu.css" rel="stylesheet" type="text/css" />
         <link href="Image_Effect\img.css" rel="stylesheet" type="text/css" />
       
        
        
        <style>
            
            #hm:hover{
                color: green;
               
            }  
        </style>
      
    </head>
   <body  background="image/bn.gif">
        <div class="main">
            <div class="header">
                <img src="image/bn44.jpg" class="im">
            </div>  
            <div class="menu">
               
                <div style="">
                    
                     <label style="margin: auto; float: right;padding:5px; ">
                         <% String m=(String)session.getAttribute("User");if(m!=null){ %><label style="color:blue">Welcome! &nbsp;<%=m%></label> &nbsp;&nbsp;<a href="main.jsp" id="hm" style="text-decoration: none">Home </a>&nbsp;&nbsp;<a href="" id="hm"style="text-decoration: none">About Us</a>&nbsp;&nbsp;<a href="" id="hm"style="text-decoration: none">Contact Us </a></label>
                </div>  
            </div>
            
            <div class="content" id="cnt" >
                <div style=" background:  lightskyblue;width: 24.9%;height: 600px; float: left;border-right-style: inset; border-right-width: thin;border-right-color: hotpink; ">
                    <div>
                        <div style="background: brown ;padding-bottom: 10px;padding-top: 10px;"><b>Our Services</b></div>
                    <nav class="navigation">
  <ul class="mainmenu">
      <li><a href="">My Account</a>
      <ul class="submenu">
         <li><a href="Account_Info.jsp">Account Info</a></li>
        <li><a href="AccountDetails.jsp">Account Details</a></li>
        <li><a href="">Statements</a></li>
        <li><a href="">Apply Debit Card</a></li>
      </ul>
    </li>
    <li><a href="">Make Transaction</a>
      <ul class="submenu">
        <li><a href="">Deposit Amount</a></li>
        <li><a href="">Withdraw Amount</a></li>
       
        
      </ul>
    </li>
     <li><a href="">Fund Transfer</a></li>
    <li><a href="">Profile</a></li>
    
  </ul>
</nav>
                    </div> 
                    <div style="background: brown ;padding-bottom: 10px;padding-top: 10px;"><b>Informations</b></div>
                      <nav class="navigation">
  <ul class="mainmenu">
      <li><a href="">Saving Account</a>
      
    </li>
    <li><a href="">Salary Account</a>
      
    </li>
   
    <li><a href="">Loaning Account</a></li>
    <li><a href="">Interest</a></li>
  </ul>
                      </nav>  
          
                </div>        
                       
                   
   
                <div style="background: white; width: 75%; height: 600px; float: right;">
                  
                    <br><marquee direction="right" behaviour="alternate"  >Thanks To Visiting our Gateway.</marquee>
                    <br><br><div style="margin: 10px; padding: 20px; border: solid 1px hotpink;border-radius: 10px; width: auto; height: 300px;">
                        <%
                        try{
                         Connection c=ConnectionProvider.DistributeConn();
                         String s="select Account_No from UserDetails join CustomerAccount Cust_Name on Name=Cust_Name where Username='"+m+"'";
                          Statement st=c.createStatement();
                         ResultSet rs=st.executeQuery(s);
                         while(rs.next()){
                             
                        %>
                        <label style="font-size: large;">Account Details</label>
                        <form method="post">
                        <table cellspacing="10">
                            <tr>
                                <td>Select Account</td>
                                <td><select name="sl">
                                        <option>--Select Account--</option>
                                        <option style="text-align: center" ><%=rs.getLong("Account_No")%></option>
                                    </select></td>
                                    <td><input type="submit"  value="Get Details"></td>
                            </tr>  
                        </table> 
                        </form>
                                    <br>
                          <%
                          Connection con=null;
long acn= Long.parseLong(request.getParameter("sl"));
con=ConnectionProvider.DistributeConn();
String sql="select Account_No from CustomerAccount where Account_No='"+acn+"'";
Statement s1=con.createStatement();
ResultSet rs1=s1.executeQuery(sql);
con=ConnectionProvider.DistributeConn();
String bnk="select Branch_Code,MICR_No,IFSC_Code,Branch_Address from BankInfo where Branch_Code=11095 ";

Statement stm=con.createStatement();
ResultSet set=stm.executeQuery(bnk);

while(rs1.next()){
while(set.next()){
%>
<table cellspacing="5" cellpadding="5">
    
    <tr>
        <td>Account No :</td>
        <td><label style="font-size: small;"><%= rs1.getLong("Account_No") %></label></td>
    </tr>
    <tr>
        <td>Branch Code :</td>
        <td><label style="font-size: small;"><%= set.getInt(1)  %></td>
    </tr>
    <tr>
        <td>MICR No :</td>
        <td><label style="font-size: small;"><%= set.getInt(2)  %></label></td>
    
    </tr>
    <tr>
        <td>IFSC Code:</td>
        <td><label style="font-size: small;"><%= set.getString(3)  %></label></td>
    </tr>
    <tr>
        <td>Branch Address :</td>
        <td><label style="font-size: small;"><%= set.getString(4)  %></label></td>
    </tr>
</table>
         
                    </div>
    <%       } 
              }          }
                                                                                                                       
}catch(Exception e){
System.out.print(e);    
}
                                           }
%>
    </div>
    
            
      </div>
       
            <div class="footer"></div>
            
        </div>
    </body>
</html>
