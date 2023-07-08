<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- custome css  -->
    <link rel="stylesheet" href="./Registration.css">
    <title>Registration</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Acme&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap');
*
{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body
{
    font-family: "Open Sans",
    -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif;
}
.main-parent
{
    width: 100%;
    height: 100vh;
    background-image: url(./forget.webp);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: top;
    display: flex;
    justify-content: center;
    align-items: center;
}
.main-parent .form-wrap
{
    width: 450px;
    background: rgb(255 255 255 / 75%);
    border-radius: 10px;
    padding: 35px 40px;
    backdrop-filter: blur(5px);
}
.form-wrap form h1
{
    font-family: 'Acme', sans-serif;
    font-variant: small-caps;
    font-size: 45px;
    text-align: center;
    margin-bottom: 15px;
}
.form-wrap form h1 span
{
    font-variant: small-caps;
    color: #f57224;
}
.form-wrap form .single-input input
{
    width: 100%;
    padding: 14px 10px;
    border: 1px solid rgba(0, 0, 0, 0.3521);
    outline: none;
    background: transparent;
    margin-bottom: 10px;
    font-size: 15px;
    font-family: 'Roboto', sans-serif;
}
.form-wrap form .submit-button
{
    text-align: center;
}
.form-wrap form .submit-button button.button
{
    padding: 13px 30px;
    background-color: #f57224;
    outline: none;
    border: none;
    color: #fff;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    cursor: pointer;
}
.form-wrap form .account-have
{
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 14px;
    margin-top: 10px;
}
.form-wrap form .account-have a
{
    color: rgb(34, 34, 34);
    text-decoration: none;
}
</style>
<body>
    <div class="main-parent">
        <div class="form-wrap">
        <%@page import="java.sql.*" %>
        <%@page import="java.util.*" %>
        <%
        String email=request.getParameter("email");
        String cpass=request.getParameter("pass");
        String rpass=request.getParameter("cpass");
        //out.println(cpass);out.println(rpass);
        if(email == null){
        	
        }else{
        if(cpass.equals(rpass)){
        
        try{
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
        	Statement st=conn.createStatement();
        	  int row=st.executeUpdate("update registation set pass='"+cpass+"' where Email='"+email+"'");
        		
        		if(row==1)
        		{
        			out.print("<script>alert('Reset Password Succsessfully');window.open('Login.jsp','_parent')</script>");
        		}else{
        		out.print("<script>alert('Invalid email')</script>");
        	}
        }catch(Exception e)
        {
        	out.print("<script>alert('Enter a New Password')</script>");
        }
        }else{out.print("<script>alert('Password don't Matched')</script>");}
        }
        %>
            <form  method="post">
                <h1><span>Forget</span>Password</h1>
               <div id="error" style="width:370px;height:40px;background-color:red;color:white;display:none;">
               </div>
                <div class="single-input">
                    <input id="email" type="email" placeholder="Email Address"  name="email"required>
                </div>
                <div class="single-input">
                    <input id="pass" type="password" placeholder="Create Password"  name="pass" id="pass2"required>
                </div>
                <div class="single-input">
                    <input id="cpass" type="password" placeholder="Confirm Password" name="cpass" id="pass1"required>
                </div>
                <div class="submit-button">
                    <input type="submit" class="button" onclick="fun()" value="Submit" style="width:370px;height:40px;color:white;background-color:orange;">
                </div>
                <div class="account-have">
                
                    <a href="Login.jsp">Have an account please Login</a>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
    function fun(){
    var a=document.getElementById("pass2").value;
    var b=document.getElementById("pass1").value;
	 var sty=document.getElementById("error");

    if(a!=b)
    	{
        	 alert("Password don't Matched");
    	}
    }
    </script>
</body>
</html>