<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%><%@page import="java.util.*"%>
<% 
String id2=request.getParameter("id1");
//int data=Integer.parseInt(id2);
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/newdb", "root", "root");
Statement st=conn.createStatement();
//out.print("hello");
int i=st.executeUpdate("delete from sale where  Order_id="+id2);
//out.print("*"+i);
if(i>=0)
{//out.print("*");
	out.println("<script>alert(' Deleted Successfully!');window.open('report.jsp','_parent');</script>");
}
}
catch(Exception e)
{
	out.print(e);
	e.printStackTrace();
}
%>