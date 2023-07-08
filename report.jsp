<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>STOCK MANAGEMENT SYSTEM</title>
</head>
<style>
    *{
    margin:0;
    padding:0;
}
.head{
    padding:1em;
    background-color: #021553;
}
span{
    width:300px;
    height:40px;
    font-family: sans-serif;
    font-size: 1.2em;
    font-style: italic;
    font-weight: 200;
    color:white;
}
section{
    display: flex;
    min-height: 85vh;
}
.sidebar{
    width:20vw;
    background-color: #021553;
    align-items: center;
    justify-content: center;
    align-content: center;
    justify-items: center;
    margin:0 auto;
}
.mainarea{
    padding:2em;
    display: grid;
    grid-template-columns: repeat(3,minmax(100px,1fr));
   
    background-color:#f8f8ff;
}
.buttombar{
    padding:1em;
    background-color: #021553;

}
ul{
    padding:0.5em;
   
}
li{
    padding:1em;
    border-bottom: 1px solid white;
     
}

.buttombar span{
    color:purple;
}
.mainarea div{
    background-color: white;
    box-shadow: 10px 10px #f5f5f5;
}
input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ffffff;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {height: 42px;
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
/* Full-width input fields */


/* Set a style for the submit button */

</style>
    <body>
        <div class="container">
            <div class="head"><span><a href="Dashbord.jsp"style="color:white;text-decoration: none;">DASHBOARD</a></span></div>
            <section>
            <div class="sidebar">
                <ul>
                    <li><span><a href="storedata.jsp" style="color:white;text-decoration: none;">Profile</a></span></li>
                    <li><span><a href="additem.jsp" style="color:white;text-decoration: none;">Add item</a></span></li>
                    <li><span><a href="Stock.jsp" style="color:white;text-decoration: none;">Stock</a></span></li>
                    <li><span><a href="Addemp.jsp" style="color:white;text-decoration: none;">Add Employee</a></span></li>
                    <li><span><a href="manage.jsp" style="color:white;text-decoration: none;">Manage Employe</a></li>
                    <li><span><a href="sale.jsp" style="color:white;text-decoration: none;">Sale product</a></span></li>
                    <li><span><a href="report.jsp"><button style="background-color:green;width:200px;height:40px;color:white">Sale Report</button></a></span></li>
                  
                </ul>
                
                </div>
            <div class="mainarea">
                <div style="width:1020px;">
                <h2>Sale Report</h2><br>
                
                <table style="float: left;">
                  <tr>
                    <th style="width:40px;">Order Id</th>
                    <th style="width:40px;">Product Name</th>
                    <th style="width:40px;">Product price</th>
                    <th style="width:40px;">Quantity</th>
                    <th>Total</th>
                    <th style="width:40px;">Employe Id</th>
                    <th>Customer Name</th>
                    <th style="width:40px;">Contact Number</th>
                    <th style="width:80px;">Date</th>
                    <th style="width:60px;">Action</th>
                  </tr>
                  <%@page import="java.sql.*" %>
                  <%
                  String email1= (String) session.getAttribute("email");
                  if(email1==null){
               	   response.sendRedirect("Login.jsp");
                  }else{
                  try{
                      Class.forName("com.mysql.jdbc.Driver");
                   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
                 //out.println("connect");
                  Statement smt=conn.createStatement();
                 ResultSet rs3=smt.executeQuery("select * from sale where email='"+session.getAttribute("email").toString()+"'");
               // out.print("problam");
                  while(rs3.next()){
                 %>
                 
                 <tr>
                    <td><%= rs3.getInt(10) %></td>
                    <td><%= rs3.getString(4) %></td>
                    <td><%= rs3.getString(7)  %></td>
                    <td><%=  rs3.getString(8)  %></td>
                    <td><%= rs3.getString(9)  %></td>
                    <td><%= rs3.getInt(5)   %></td>
                    <td><%= rs3.getString(1)  %></td>
                    <td><%=rs3.getString(2) %>
                    <td><%= rs3.getString(6)  %></td>
                    <td>
                       <a href="deletr.jsp?id1=<%= rs3.getInt(10) %>" > <button style="background-color: red;color:white;height: 30px;width:60px;border-radius:10px;">Delete</button></a><br><br>
                        <a href="return.jsp?id2=<%= rs3.getInt(10) %>"><button style="height: 30px;width:60px;float: right;border-radius:10px;background-color: rgb(56, 145, 70);color:white;"><strong>update</strong></button></a><br><br>
                      <a href="returnn.jsp?id=<%=rs3.getInt(10) %>"><button type="submit" style="width:60px;height:30px;border-radius:10px;color:white;background-color:blue;">Return</button></a><br>
                    </td>
                 </tr>
                 <%
                  }
                  }catch(Exception e)
                  {
                	  out.print(e);
                  }
                  }
                 %>
                </table>
            </div>
            </div>
            </section>
            <div class="buttombar">
                <span style="color:orange;">&copy:2023 Roland Institute Of Computer And Management Studies</span>
            </div>
        
        </div>
    </body>
</html>