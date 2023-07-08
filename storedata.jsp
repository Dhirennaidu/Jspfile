<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"  %>
<%@page import="java.sql.*"%>
   
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
</style>
    <body>
    
        <div class="container">
            <div class="head"><span><a href="Dashbord.jsp"style="color:white;text-decoration: none;">DASHBOARD</a></span></div>
            <section>
            <div class="sidebar">
                <ul>
                    <li><a href="storedata.jsp"><button style="background-color:green;width:200px;height:40px;color:white">Profile</button></a></li>
                    <li><span><a href="additem.jsp" style="color:white;text-decoration: none;">Add item</a></span></li>
                    <li><span><a href="Stock.jsp" style="color:white;text-decoration: none;">Stock</a></span></li>
                    <li><span><a href="Addemp.jsp" style="color:white;text-decoration: none;">Add Employee</a></span></li>
                    <li><span><a href="manage.jsp" style="color:white;text-decoration: none;">Manage employee</a></span></li>
                    <li><span><a href="sale.jsp" style="color:white;text-decoration: none;">Sale product</a></span></li>
                    <li><span><a href="report.jsp" style="color:white;text-decoration: none;">Reports</a></span></li>
                    <li>
                    <form method="post" action="Logout.jsp" style="float:left;">
    <input type="submit" value="Logout"/>
</form><br><br></li>
                </ul>
                
                </div>
                <%
            
                String email1= (String) session.getAttribute("email");
                if(email1 ==null){
                	out.print("<script>alert('You Log out')</script>");
             	   response.sendRedirect("Logout.jsp");
                }else{
                //out.print(session.getAttribute("email"));
             //   out.print(session.getAttribute("pass"));
           //  Class.forName("com.mysql.jdbc.Driver");
                
         String fname="";
         String lname="";
         String Email="";
         String mobile="NAN";
         if(mobile == "NAN"){
        	 
         }
    try{
    	Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
    //out.println("connect");
    Statement smt=conn.createStatement();
    ResultSet rs=smt.executeQuery("select * from registation where Email='"+session.getAttribute("email")+"'and pass='"+session.getAttribute("pass")+"'");
    int count=0; 
    while(rs.next())
    {
    
    Email=rs.getString(3);
   %>
      <div class="mainarea">
                <div style="width:800px;height:450px;background-color:white">
                    <center><font style="color:rgb(253, 10, 10);font-size: 30px;"><strong>Your Profile</strong></font></center>  
                  <hr>
                    <div class="row">
                          <div class="col-25">
                            <label for="fname">Full Name:</label>
                          </div>
                          <div class="col-75">
                           <font style="color:blue;font-size: 30px;"><strong><%=  rs.getString(1)+" "+rs.getString(2) %></strong></font> 
                          </div>
                        </div><br>
                        <div class="row">
                          <div class="col-25">
                            <label for="fname">Email:</label>
                          </div>
                          <div class="col-75">
                            <font style="color:blue;font-size: 30px;"><strong><% out.print(Email); %></strong></font>
                          </div>
                        </div>
        <br>
                        <div class="row">
                          <div class="col-25">
                            <label for="subject">Mobile Number</label>
                          </div>
                          <div class="col-75">
                            <font style="color:blue;font-size: 30px;"><strong><%= rs.getString(7) %></strong></font>
                          </div>
                        </div>
   <% 
    }
    }catch(Exception e)
    {
    	out.println(e);
    }
         
    %>
         <br><br>
                <center><font style="color:rgb(253, 10, 10);font-size: 30px;"><strong>Update Your Profile</strong></font></center>
                <br>
                <hr>
                <div class="row">
                    <div class="col-25">
                      <label for="fname">First Name:</label>
                    </div>
                    <div class="col-75">
                       <%/*String email1= (String) session.getAttribute("email");
                       if(email1==null){
                    	   response.sendRedirect("Login.jsp");
                       }
                       */
                       String fname1=request.getParameter("Name");
                                   if(fname1 == null){
                    	   
                       }else{
                       try{
                     
                  
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
                       Statement smt1=conn1.createStatement();
                       int rs=smt1.executeUpdate("update registation  set firstname='"+fname1+"'where Email='"+session.getAttribute("email")+"'");
                       if(rs>0)
                       {
                     	  out.print("<script>alert('Update Sucsessfully')</script>");
                       }
                       }
                       catch(Exception e)
                       {
                    	   out.print(e);
                       }
                       }
                       
                
                        %>
                        <form method="post">
           
                            <input type="" placeholder="Change your name"  name="Name"style="height:30px;" required>
                            <input type="submit" value="update" style="height:40px;">
                            </form>
                    </div>
                  </div><br>
                  <div class="row">
                    <div class="col-25">
                      <label for="fname">Last Name</label>
                    </div>
                    <div class="col-75">
                       <%
                       String lname1=request.getParameter("lnam");
                       if(lname1 == null){
                    	   
                       }
                       else{
                       try{
                         
                           
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
                           Statement smt2=conn2.createStatement();
                           int rs1=smt2.executeUpdate("update registation  set lastname='"+lname1+"'where Email='"+session.getAttribute("email")+"'");
                          if(rs1>0)
                          {
                        	  out.print("<script>alert('Update Sucsessfully')</script>");
                          }
                           }
                           catch(Exception e1)
                           {
                        	   out.print(e1);
                           }
                       }                  
                  %>
                        <form method="post">
                     
                            <input type="" placeholder="Change Last Name" name="lnam" style="height:30px;" required>
                            <input type="submit" value="update" style="height:40px;">
                            </form>
                    </div>
                  </div>
  <br>
                  <div class="row">
                    <div class="col-25">
                      <label for="subject">Mobile Number</label>
                    </div>
                    <div class="col-75">
                     <% 
                     String mobi=request.getParameter("mobile");
                    		  if(mobi == null)
                    		  {
                    			  
                    		  }
                    		  else{
                        try{
                         
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
                           Statement smt2=conn2.createStatement();
                           int rs1=smt2.executeUpdate("update registation  set contact='"+mobi+"'where Email='"+session.getAttribute("email")+"'");
                           if(rs1>0)
                           {
                         	  out.print("<script>alert('Update Sucsessfully')</script>");
                           }
                           }
                           catch(Exception e1)
                           {
                        	   out.print(e1);
                           }
                    		  }	  
                }
                  %>
                        <form method="post">
                      <input type="" placeholder="Enter a Mobile Number" name="mobile" style="height:30px;" required>
                      <input type="submit" value="update" style="height:40px;">
                      </form>
                    </div>
                  </div>
            </div>
            </section>
            <div class="buttombar">
                <span style="color:orange;">&copy:2023 Roland Institute Of Computer And Management Studies</span>
            </div>
        
        </div>
    </body>
</html>

</body>
</html>