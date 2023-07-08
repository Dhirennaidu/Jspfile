<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
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
    width:78vw;
    padding:2em;
    display: grid;
    grid-template-columns: repeat(3,minmax(100px,1fr));
    grid-gap: 2em;
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
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
    <body>
    
        <div class="container">
            <div class="head"><span><a href="Dashbord.jsp"style="color:white;text-decoration: none;">DASHBOARD</a></span></div>
            <section>
            <div class="sidebar">
                <ul>
                    <li><span><a href="storedata.jsp" style="color:white;text-decoration: none;">Profile</a></span></li>
                    <li><a href="additem.jsp"><button style="background-color:green;width:200px;height:40px;color:white">Add item</button></a></li>
                    <li><span><a href="Stock.jsp"style="color:white;text-decoration: none;">Stock</a></span></li>
                    <li><span><a href="Addemp.jsp"style="color:white;text-decoration: none;">Add Employee</a></span></li>
                    <li><span><a href="manage.jsp"style="color:white;text-decoration: none;">Manage employee</a></span></li>
                    <li><span><a href="sale.jsp"style="color:white;text-decoration: none;">Sale product</a></span></li>
                    <li><span><a href="report.jsp"style="color:white;text-decoration: none;">Reports</a></span></li>
                   
                </ul>
                
                </div>
            <div class="mainarea">
                    <div class="container" style="width:600px;">
                      <h1>Add items</h1>
                      <p>Add New Mobile Product</p>
                      <hr>
                      <%
                      String email1= (String) session.getAttribute("email");
                      if(email1==null){
                   	   response.sendRedirect("Login.jsp");
                      }
                      else{
    //out.print(p_id);
        String pname=request.getParameter("Name");
        String pp=request.getParameter("price");
        String pq=request.getParameter("Quanta");
        String total=request.getParameter("Total");
       int pp_id =new Random().nextInt(90000) + 10000;
       String name=new String(session.getAttribute("email").toString());
     // out.print(name);
    if(pname == null){

    }
    else{
    try{
       Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
   // out.println("connect");
   
    //PreparedStatement psmt=conn.prepareStatement("insert into additem11 values(?,?,?,?,?,?)");
   // insert into additem11 values(12345,'Sam',12,2,'24','dhirennaidu17@gmail.com');
   
   PreparedStatement st=conn.prepareStatement("insert into additem11 values(?,?,?,?,?,?)"); 
    st.setInt(1, pp_id);
    st.setString(2, pname);
    st.setString(3,pp);
    st.setString(4,pq);
    st.setString(5,total);
    st.setString(6,name);
   int i=st.executeUpdate();
   
   if(i==1){
 out.println("<script>alert('add item succsessfully');</script>");
   }
    }
    catch(Exception e)
    {
    	out.print(e);
    	e.printStackTrace();
    }
    }
                      }
    %>
                  <form action="additem.jsp"  method="post" >
                      <label for="email"><b>Product Name</b></label><br>
                      <input type="text" placeholder="Enter a Product Name" name="Name" id="email" style="width:400px;" required><br>
                  
                      <label for="psw"><b>Product prize</b></label><br>
                      <input type="text" placeholder="Enter a Product Price" name="price" id="price"style="width:400px;" required><br>
                  
                      <label for="psw-repeat"><b>Quantity</b></label><br>
                      <input type="text" placeholder="Quantity" name="Quanta" id="quantity" style="width:400px;" required>
                      <button type="button" onclick="totalpr()" style="width:200px;height:40px;background-color:blueviolet;color:white;">Total</button><br><br><br>
                      
                     <label for="psw-repeat" style="float:center;"><b>Total prize</b></label><br><br>
                     <input type="text" placeholder="Total Price" name="Total" id="total1" style="width:400px;float: left;" required>
                      <hr>
                  
                      <input type="submit" class="registerbtn" name="Add" value="ADD">
                      </form>
                    </div>
            </div>
            </section>
            <div class="buttombar" >
                <span style="color:orange;">&copy:2023 Roland Institute Of Computer And Management Studies</span>
            </div>
        
        </div>
    </body>
    <script>
        function totalpr(){
            var val=document.getElementById('price').value;
        var val2=document.getElementById('quantity').value;

            document.getElementById('total1').value=val*val2;
        }
    </script>
</html>