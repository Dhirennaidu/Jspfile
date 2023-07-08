<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%><%@page import="java.util.*"%>

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
            <div class="head"><span>DASHBOARD</span></div>
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
                <h2>Return Product</h2><br>
                <table style="float: left;">
                  <tr>
                    <th style="width:40px;">Order Id</th>
                    <th style="width:40px;">Product Name</th>
                    <th style="width:40px;">Product price</th>
                    <th style="width:40px;">Quantity</th>
                    <th style="width:60px;">Action</th>
                    <th>Total</th>
                    <th style="width:40px;">Customar Name</th>
                    <th style="width:40px;">Contact Number</th>
                    <th style="width:80px;">Date</th>
                    <th style="width:60px;">Action</th>
                  </tr>
                  <%
                  String id=request.getParameter("id2");
                 //String idp=(String) session.getAttribute("id3");
                  int data=Integer.parseInt(id);
             //    int data1=Integer.parseInt(idp);
                  String email1= (String) session.getAttribute("email");
                  if(email1==null){
               	   response.sendRedirect("Login.jsp");
                  }else{
                  try{
                      Class.forName("com.mysql.jdbc.Driver");
                   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
                 //out.println("connect");
                  Statement smt=conn.createStatement();
                 ResultSet rs3=smt.executeQuery("select * from sale where Order_id="+data);
               // out.print("problam");
                  while(rs3.next()){
                 %>
                 <%
               
                 //  String name1=name2;
                   String name=request.getParameter("name");
                   String ppp=request.getParameter("ppp");
                   String quan=request.getParameter("quan");
                   String total=request.getParameter("total");
                   String cname=request.getParameter("cname");
                   String cmobile=request.getParameter("cmobile");
                   String date=request.getParameter("date");
                   if(name == null){
                   	
                   }
                   else
                   { 
                   	  try{int message=0;
                   		   Class.forName("com.mysql.jdbc.Driver");
                              Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
                             // out.println("connect");
                             int quanti=Integer.parseInt(quan);
                             if(quanti<=rs3.getInt(8)){
                             Statement smt2=conn2.createStatement();
                             PreparedStatement st=conn2.prepareStatement("update sale set  P_name=?, P_price=?, P_Quantity=?, P_total=? ,cus_name=?,cus_con=?,sale_Date=? where  Order_id="+data);
                   //         Update users set id=?,first_name=?,last_name=?,city_name=?,email=? where id="+id;
                              //st.setInt(1,data);
                              st.setString(1,name);
                              st.setString(2,ppp);
                              st.setString(3,quan);
                              st.setString(4,total);
                              st.setString(5,cname);
                              st.setString(6,cmobile);
                              st.setString(7,date);
                             
                            //  out.print("update");
                              int v=st.executeUpdate();
                         message++;
                   if(v>0)
                   {
                	 
                  }else{out.print("<script>alert('Out of Stock');</script>");}
                   if(message == 1)
                   {
                	   int n=rs3.getInt(8)-(Integer.parseInt(quan));
                	   //code      Class.forName("com.mysql.jdbc.Driver");
                       Connection conn23=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
                       // out.println("connect");
                       Statement smt23=conn23.createStatement();
                      ResultSet rs=smt23.executeQuery("select * from additem11 where P_id="+rs3.getInt(3));
                     int addq=0;
                     int update=0;
                       while(rs.next()){
                    	   addq=Integer.parseInt(rs.getString(4));
                    	   update++;
                       }
                       if(update==1){
                    	   int addi=n+addq;
                    	   String totoall=String.valueOf(addi);
                   	    Class.forName("com.mysql.jdbc.Driver");
          	    	   Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
          	    	   Statement smt3=conn3.createStatement();
          	    	
          	           int row=smt3.executeUpdate("update additem11 set P_quantoty='"+totoall+"' where P_id="+rs3.getInt(3));
                         if(row>0)
                         {
                        	 response.sendRedirect("report.jsp");
                         }
                       }
                   }
                   	out.print("<script>alert('Update Succsessfully!')</script>");
                   	response.sendRedirect("report.jsp");
                   
                         }else{out.print("<script>alert('you Enter More Quantity');</script>");}
                   	  }
                         catch(Exception e)
                         {
                         	 out.print(e);
                         }
                   } 
                   %>
                
                 <tr>
                 <form method="post">
                    <td><%= rs3.getInt(10)  %></td>
                    <td><input type="text" value="<%= rs3.getString(4) %>"  name="name"></td>
                    <td><input type="text" value="<%= rs3.getString(7)  %>" name="ppp" id="t11"></td>
                    <td><input type="text" value="<%=  rs3.getString(8)  %>" name="quan" id="t21"></td>
                    <td><button type="button" style="width:60px;height:40px;" onclick="totalp()">Total</button></td>
                    <td><input type="text"  style="width:60px;"value="<%=  rs3.getInt(5)   %>" name="total" id="t23"></td>
                    <td><input type="text" style="width:50px" value="<%= rs3.getString(1)  %>" name="cname"></td>
                    <td><input type="text" style="width:50px;" value="<%=rs3.getString(2) %>" name="cmobile"></td>
                    <td><input type="date" style="width:50px;" value="<%= rs3.getString(6)  %>" name="date"></td>
                    <td>
                      <input type="submit"  value="Update">
                    </td>
                    </form>
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
    <script>
    function totalp()
    {
    	  var val=document.getElementById('t11').value;
          var val2=document.getElementById('t21').value;

              document.getElementById('t23').value=val*val2;
    }
    </script>
</html>