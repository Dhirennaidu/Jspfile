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
.button{
   width:300px;
   height:40px;
   background-color:orange;
   color:white;
}
</style>
<body>
    <div class="main-parent">
        <div class="form-wrap">
                <h1><span>Registration</span>Form</h1><br>
                <%@page import="java.sql.*" %>
                <%@page import="java.util.*" %>
                       <%
    //out.print(p_id);
        String pname=request.getParameter("First_name");
        String lname=request.getParameter("Last_name");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
       String cpass=request.getParameter("cpass");
       int pp_id =new Random().nextInt(90000) + 10000;
       String number=request.getParameter("8658135266");
    if(pname == null){
        
    }
    else{
    try{
       Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
    out.println("connect");
   
    //PreparedStatement psmt=conn.prepareStatement("insert into additem11 values(?,?,?,?,?,?)");
   // insert into additem11 values(12345,'Sam',12,2,'24','dhirennaidu17@gmail.com');
   /* Statement smt1=conn.createStatement();
    ResultSet rs2=smt1.executeQuery("select * from registation where Email="+email);
    int count=0;
    while(rs2.next()){count++;}
if(count == 1)
{
	out.print("<script>alert('Exisist you Account');</script>");
}
*/
   PreparedStatement st=conn.prepareStatement("insert into registation values(?,?,?,?,?,?,?)"); 
    st.setString(1, pname);
    st.setString(2, lname);
    st.setString(3,email);
    st.setString(4,pass);
    st.setString(5,cpass);
    st.setInt(6,pp_id);
    st.setString(7,number);
   int i=st.executeUpdate();
   if(i==1){
 out.println("<script>alert('Registation succsessfully');window.open('index.jsp','_parent');</script>");
   }
  
    }
    catch(Exception e)
    {
    	out.print("<script>alert('Your Acount Allready Exisist Enater new Email or Password');</script>");
    	response.sendRedirect("singup.jsp");
    	e.printStackTrace();
    	out.print(e);
    }
    }
    %>
       <form action="singup.jsp" method="post">
                <div class="single-input">
                    <input id="fname" type="text" placeholder="First name"  name="First_name"required>
                </div>
                <div class="single-input">
                    <input id="lname" type="text" placeholder="Last name"  name="Last_name" required>
                </div>
                <div class="single-input">
                    <input id="email" type="email" placeholder="Email Address" name="email" required>
                </div>
                <div class="single-input">
                    <input id="pass" type="password" placeholder="Password" name="pass"  required>
                </div>
                <div class="single-input">
                    <input id="cpass" type="password" placeholder="Confirm Password"  name="cpass" required>
                </div><br>
                <div class="submit-button">
                    <input type="submit" class="button" value="submit" name="sub">
                </div><br>
                
                <div class="account-have">
                    <a href="forget.jsp">Forget Password</a>
                    <a href="index.jsp">Have an account please Login</a>
                </div>
            </form>
        </div>
    </div>
    <script src="./sweetalert.js"></script>
    <script src="./app.js"></script>
</body>
</html>