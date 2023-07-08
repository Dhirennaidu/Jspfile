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

.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
   
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* Style the counter cards */
.card {height:200px;
width:300px;
 margin-top:15%;
    margin-left:40%;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.6);
  padding: 10px;
  text-align: center;
  background-color: #f1f1f1;
}
</style>
    <body>
        <div class="container">
            <div class="head"><span><a href="Dashbord.jsp"style="color:white;text-decoration: none;">DASHBOARD</a></span></div>
            <div style="width:100%;height:600px;background-color:white;">
            <div class="row">
            
  <div class="column">
    <div class="card" >
      <h3>Total Product</h3>
      <br><br>
      <p><font color="blue" size="8"  ><strong>
      <%@page import="java.sql.*" %>
    
      <% 
      String email1= (String) session.getAttribute("email");
      if(email1==null){
    	out.println("Login Now");
   	   response.sendRedirect("Logout.jsp");
      }else{
      try{
    	   Class.forName("com.mysql.jdbc.Driver");
           Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
         //out.println("connect");
          Statement smt=conn.createStatement();
         ResultSet rs3=smt.executeQuery("select * from additem11 where email='"+session.getAttribute("email").toString()+"'");
       // out.print("problam");
       int count1=0;
          while(rs3.next()){count1++;}
          out.print(count1);
      }
      catch(Exception e){
    	  
      }
      }
      %>
      </strong></font></p>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <h3>Total Product Stock</h3><br><br>
     
      <p><font color="blue" size="8"><strong>
      <%
           try{
    	   Class.forName("com.mysql.jdbc.Driver");
           Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
         //out.println("connect");
          Statement smt1=conn1.createStatement();
         ResultSet rs2=smt1.executeQuery("select * from additem11 where email='"+session.getAttribute("email").toString()+"'");
       // out.print("problam");
       int count=0;
          while(rs2.next()){ count+=rs2.getInt(4);}
          out.print(count);
      }
      
      catch(Exception e){
    	  
      }
        
      %>
      </strong></font></p>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <h3>Total Product Sale</h3><br><br>
      <p><font color="blue" size="8"><strong>
      <% 
   
      try{
    	   Class.forName("com.mysql.jdbc.Driver");
           Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
         //out.println("connect");
          Statement smt3=conn3.createStatement();
         ResultSet rs3=smt3.executeQuery("select * from sale where email='"+session.getAttribute("email").toString()+"'");
       // out.print("problam");
       int sum=0;
          while(rs3.next()){
        	 sum+=Integer.parseInt(rs3.getString(8));
        	  }
          out.print(sum);
      }
      catch(Exception e){
    	  
      }%>
       </strong></font></p>
    </div>
  </div>
</div>
      <div class="column">
    <div class="card" >
      <h3>Total Product Purches Price</h3><br><br>
     <p><font color="blue" size="8"><strong>
     <%
    
     try{
  	   Class.forName("com.mysql.jdbc.Driver");
         Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
       //out.println("connect");
        Statement smt1=conn1.createStatement();
       ResultSet rs2=smt1.executeQuery("select * from additem11 where email='"+session.getAttribute("email").toString()+"'");
     // out.print("problam");
     int sum2=0;
        while(rs2.next()){ sum2+=rs2.getInt(5);}
        out.print(sum2);
    }
    
    catch(Exception e){
  	  
    }
     %>
     </strong></font></p>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <h3>Total Product Sale Price</h3><br><br>
      <p><font color="blue" size="8"><strong>
      <% 
      
      try{
    	   Class.forName("com.mysql.jdbc.Driver");
           Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
         //out.println("connect");
          Statement smt3=conn3.createStatement();
         ResultSet rs3=smt3.executeQuery("select * from sale where email='"+session.getAttribute("email").toString()+"'");
       // out.print("problam");
       int sum2=0;
          while(rs3.next()){
        	 sum2+=Integer.parseInt(rs3.getString(9));
        	  }
          out.print(sum2);
      }
      catch(Exception e){
    	  
      }%>
      </strong></font></p>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <h3>Total Employee Work</h3><br><br>
     <p><font color="blue" size="8"><strong>
     <% 
    
      try{
    	   Class.forName("com.mysql.jdbc.Driver");
           Connection conn5=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
         //out.println("connect");
          Statement smt5=conn5.createStatement();
         ResultSet rs5=smt5.executeQuery("select * from emp where A_email='"+session.getAttribute("email").toString()+"'");
       // out.print("problam");
       int sum3=0;
          while(rs5.next()){
        	 sum3++;
        	  }
          out.print(sum3);
      }
      catch(Exception e){
    	  out.print(e);
      }%>
     
     </strong></font></p>
    </div>
  </div>
</div>      
            </div>
            <div class="buttombar">
                <span style="color:orange;">&copy:2023 Roland Institute Of Computer And Management Studies</span>
            </div>
        
        </div>
    </body>
    <script>
   
    </script>
</html>