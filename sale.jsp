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
input[type=text], input[type=password],input[type=date] {
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
                    <li><span><a href="additem.jsp"style="color:white;text-decoration: none;">Add item</a></span></li>
                    <li><span><a href="Stock.jsp"style="color:white;text-decoration: none;">Stock</a></span></li>
                    <li><span><a href="Addemp.jsp"style="color:white;text-decoration: none;">Add Employee</a></span></li>
                    <li><span><a href="manage.jsp"style="color:white;text-decoration: none;">Manage employee</a></span></li>
                    <li><a href="sale.jsp"><button style="background-color:green;width:200px;height:40px;color:white">Sale Product</button></a></li>
                    <li><span><a href="report.jsp"style="color:white;text-decoration: none;">Reports</a></span></li>
        
                </ul>
                
                </div>
            <div class="mainarea">
            
            <%@page  import="java.util.*"  %>
            <%@page import="java.sql.*" %>
    <%
    String email1= (String) session.getAttribute("email");
    if(email1==null){
 	   response.sendRedirect("Logout.jsp");
    }
    else{
    String cname=request.getParameter("Name");
    String ccn=request.getParameter("ccn");
    String pid=request.getParameter("PID");
    String pname=request.getParameter("PName");
   String empid=request.getParameter("empid");
   String  saleid=request.getParameter("saled");
   String pp=request.getParameter("pp");
   String quan=request.getParameter("Quantity");
   String total=request.getParameter("total");
   int pp_id =new Random().nextInt(900000) + 100000;
  
   //String Aemail=request.getParameter(session.getAttribute("email").toString());
   if(cname == null){
	   
   }
   else{
	   try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
   //out.println("connect");
   Statement smt=conn.createStatement();
   ResultSet rs=smt.executeQuery("select * from additem11 where P_id="+pid);
   int count=0;
   while(rs.next())
   {
	   count++;
   }
   if(count == 0){out.print("<script>alert('Worng Product id')</script>");}
   Statement smt1=conn.createStatement();
   ResultSet rs1=smt1.executeQuery("select * from emp where P_id="+empid);
   int count1=0;
   while(rs1.next()){
	  count1++;  
   }
   if(count1 == 0){out.print("<script>alert('Wrong Employee id');</script>");}
   if(count == 1 && count1 == 1)
   {
	   PreparedStatement st=conn.prepareStatement("insert into sale values(?,?,?,?,?,?,?,?,?,?,?)"); 
	    st.setString(1, cname);
	    st.setString(2, ccn);
	    st.setString(3,pid);
	    st.setString(4,pname);
	    st.setString(5,empid);
	    st.setString(6,saleid);
	    st.setString(7, pp);
	    st.setString(8,quan);
	    st.setString(9,total);
	    st.setInt(10,pp_id);
	    st.setString(11,session.getAttribute("email").toString());
	    int i=st.executeUpdate();
	    int qunt=Integer.parseInt(quan);
	    int n=0;
	    if(i>=0)
	    {int data=Integer.parseInt(pid);
	 //   out.print(data);
	    Class.forName("com.mysql.jdbc.Driver");
	    	   Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
	    	   Statement smt2=conn2.createStatement();
	    	   ResultSet rs4=smt2.executeQuery("select * from additem11 where P_id="+data);
	              
               while(rs4.next()){ n=Integer.parseInt(rs4.getString(4));}
	    	//   Statement smt1=conn2.createStatement();
	    //	 out.println(qunt);
           //   out.print(n);
              int countt=n-qunt;
              //out.print(countt);
              if(countt >-1){
            	    Class.forName("com.mysql.jdbc.Driver");
     	    	   Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
     	    	   Statement smt3=conn3.createStatement();
     	    	   String totoall=String.valueOf(countt);
     	           int row=smt3.executeUpdate("update additem11 set P_quantoty='"+totoall+"' where P_id="+data);
	       out.print("<script>alert('Product Sale Succsessfully');</script>");	
              }else{out.print("<script>alert('Out of Stock');</script>");}
	    }
   }
    }
   catch(Exception e)
   {
	 out.print("<script>alert('somethiing Worng')</script>");  
	 out.print(e);
   }
    }
    }
    %>
          <!-- String cname=request.getParameter("Name");
           String ccn=request.getParameter("ccn");
           String pid=request.getParameter("PID");
           String pname=request.getParameter("PName");
          String empid=request.getParameter("empid");
          String  saleid=request.getParameter("saled");
          String pp=request.getParameter("PP");
          String quan=request.getParameter("Quantity");
          String total=request.getParameter("total");
          int pp_id =new Random().nextInt(900000) + 100000;*/
       
        /*   Class.forName("com.mysql.jdbc.Driver");
           Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
           out.println("connect");
           Statement smt=conn.createStatement();
           ResultSet rs=smt.executeQuery("select * from additem11 where P_id="+pid);
           out.println(rs);
    //  PreparedStatement st=conn.prepareStatement("insert into sale values(?,?,?,?,?,?)"); 
       }
       catch(Exception e)
       {
       	out.print(e);
       
       }*/--->
      
                <form action="sale.jsp" method="post">
                    <div class="container" style="width:600px ;">
                      <h1>Sale Product</h1>
                      <hr>
                      <label for="email"><b>Customer Name</b></label><br>
                      <input type="text" placeholder="Enter a Customer Name" name="Name" id="email" style="width:400px;" required><br>
                      <label for="email"><b>Customer Contact Number</b></label><br>
                      <input type="text" placeholder="Enter a contact Number" name="ccn" id="email" style="width:400px;" required><br>
                  
                      <label for="email"><b>Product ID</b></label><br>
                      <input type="text" placeholder="Enter a Product Id" name="PID" id="email" style="width:400px;" required><br>
                      <label for="email"><b>Product Name</b></label><br>
                      <input type="text" placeholder="Enter a Product Name" name="PName" id="pname" style="width:400px;" required><br>
                  
                      <label for="email"><b>Employe ID</b></label><br>
                      <input type="text" placeholder="Enter a Product Id" name="empid" id="email" style="width:400px;" required><br>
                      <label for="email"><b>Sale Date</b></label><br>
                      <input type="date" placeholder="Enter a Product Id" name="saled" id="email" style="width:400px;" required><br>
                      <label for="psw"><b>Product Price</b></label><br>
                      <input type="text" placeholder="Enter a Employe Id" name="pp" id="price"style="width:400px;" required><br>
                  
                      <label for="psw-repeat"><b>Quantity</b></label><br>
                      <input type="text" placeholder="Quantity" name="Quantity" id="quantity" style="width:400px;" required>
                      <button type="button" onclick="totalpr()" style="width:200px;height:40px;background-color:blueviolet;color:white;">Total</button><br><br><br>
                      
                     <label for="psw-repeat" style="float:center;"><b>Total price</b></label><br><br>
                     <input type="text" placeholder="Total Price" name="total" id="total1" style="width:400px;float: left;" required>
                     
    
                     <hr>
                  
                      <button type="submit" class="registerbtn">Sale</button>
                    </div>
                  </form>
            </div>
            </section>
            <div class="buttombar">
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