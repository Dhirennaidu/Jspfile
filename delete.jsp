<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/newdb", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("delete from emp where P_id="+id);

if(i==1)
{
	out.println("<script>alert(' Deleted Successfully!');window.open('manage.jsp','_parent');</script>");
}
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}
%>