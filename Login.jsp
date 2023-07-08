<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="Login.css">
  <title>STOCK MANAGEMENT SYSTEM</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap');
*{
    margin: 0;
    padding: 0;
    font-family: 'poppins',sans-serif;
}
section{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    width: 100%;
    
    background: url("login1.JPEG")no-repeat;
    background-position: center;
    background-size: cover;
}
.form-box{
    position: relative;
    width: 400px;
    height: 450px;
    background: transparent;
    border: 2px solid rgba(255,255,255,0.5);
    border-radius: 20px;
    backdrop-filter: blur(15px);
    display: flex;
    justify-content: center;
    align-items: center;

}
h2{
    font-size: 2em;
    color: black;
    text-align: center;
}
.inputbox{
    position: relative;
    margin: 30px 0;
    width: 310px;
    border-bottom: 2px solid #fff;
}
.inputbox label{
    position: absolute;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    color:black;
    font-size: 1em;
    pointer-events: none;
    transition: .5s;
}
input:focus ~ label,
input:valid ~ label{
top: -5px;
}
.inputbox input {
    width: 100%;
    height: 50px;
    background: transparent;
    border: none;
    outline: none;
    font-size: 1em;
    padding:0 35px 0 5px;
    color: black;
}
.inputbox ion-icon{
    position: absolute;
    right: 8px;
    color: black;
    font-size: 1.2em;
    top: 20px;
}
.forget{
    margin: -15px 0 15px ;
    font-size: .9em;
    color: black;
    display: flex;
    justify-content: space-between;  
}

.forget label input{
    margin-right: 3px;
    
}
.forget label a{
    color: black;
    text-decoration: none;
}
.forget label a:hover{
    text-decoration: underline;
}
button{
    width: 100%;
    height: 40px;
    border-radius: 40px;
    background: #fff;
    border: none;
    outline: none;
    cursor: pointer;
    font-size: 1em;
    font-weight: 600;
}
.register{
    font-size: .9em;
    color: black;
    text-align: center;
    margin: 25px 0 10px;
}
.register p a{
    text-decoration: none;
    color: black;
    font-weight: 600;
}
.register p a:hover{
    text-decoration: underline;
}
.sub{
 width: 100%;
    height: 40px;
    border-radius: 40px;
    background: #fff;
    border: none;
    outline: none;
    cursor: pointer;
    font-size: 1em;
    font-weight: 600;
}
</style>
<body>
    <section>
        <div class="form-box">
            <div class="form-value">
            <%@page import="java.sql.*" %>
            <%
            int mass=0;
            String Email=request.getParameter("email");
            String Password=request.getParameter("pass");
            if(Email == null)
            {
            	
            }
            else{
            try{  //out.println("connect");
            	Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
           //out.println("connect");
           Statement smt=conn.createStatement();
          ResultSet rs=smt.executeQuery("select * from registation where Email='"+Email+"'and pass='"+Password+"'");
          int count=0; 
          while(rs.next())
           {
        	  count++;
           }
          if(count == 1){
        	  out.print("<script>alert('Login Succsessfully');</script>");
        	  session.setAttribute("email",Email);
        	  session.setAttribute("pass",Password);
        	  response.sendRedirect("storedata.jsp");
          }
           else{mass=1;
        	  
           }
            }
            catch(Exception e)
            {
            	out.println(e);
            }
            }
            %>
                <form method="post" autocomplete="off">
                    <h2 style="color:white;">Login</h2>
                    <%
                    if(mass == 1)
                    {
                    	 out.println("<div style=width:300px;height:40px;background-color:red;color:white;border-radius:20px;><center>Login Failed</center></div>");
                    }
                    %>
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="email"  name="email"  style="color:white;"required>
                        <label for="">Email</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password"  name="pass"  style="color:white;"required>
                        <label for="">Password</label>
                    </div>
                    <div class="forget"><label><a href="forget.jsp">
                        Forget Password</a></label>
                      
                    </div>
                    <input type=submit class="sub" value="Login"><br><br>
                    <button onclick="window.open('index.jsp','_parent')">Cancel</button>
                    <div class="register">
                        <p>Don't have a account <a href="singup.jsp">Register</a></p>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>