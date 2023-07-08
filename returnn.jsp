<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%><%@page import="java.util.*"%>    
                  <%
                  String id=request.getParameter("id");
                  int n=0;
                  int p=0;
                  int t=0;
                  try{
                	    Class.forName("com.mysql.jdbc.Driver");
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
                      //out.println("connect");
                       Statement smt=conn.createStatement();
                      ResultSet rs3=smt.executeQuery("select * from sale where Order_id="+id);
                    // out.print("problam");
                       while(rs3.next()){
                        n=rs3.getInt(8);
                        p=rs3.getInt(3);
                       }
                       Statement smt2=conn.createStatement();
                       ResultSet rs4=smt2.executeQuery("select * from additem11 where P_id="+p);
                       while(rs4.next())
                       {
                    	   t=rs4.getInt(4);
                       }
                       int addq=t+n;
                       if(n>0)
                       {
                    	   String qu=String.valueOf(addq);
                   	    Class.forName("com.mysql.jdbc.Driver");
          	    	   Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
          	    	   Statement smt3=conn3.createStatement();
          	    	   //String totoall=String.valueOf(countt);
          	           int row=smt3.executeUpdate("update additem11 set P_quantoty='"+qu+"' where P_id="+p);
     	     //  out.print("<script>alert('Product Sale Succsessfully');</script>");
     	       if(row>=0){
     	    	   Class.forName("com.mysql.jdbc.Driver");
      	    	   Connection conn4=DriverManager.getConnection("jdbc:mysql://localhost/newdb","root","root");
      	    	   Statement smt4=conn4.createStatement();
     	    //	   int drow=smt4.excuteQuery("delete from sale where Order_id="+id+"'");
     	    	  int i=smt4.executeUpdate("delete from sale where  Order_id="+id);
     	    	  if(i>=0){
                    out.println("<script>alert('Return Product Succsessfully');window.open('report.jsp','_parent')</script>");
                 
     	    	  }
     	       }
                       }
                  }catch(Exception e)
                  {
                     
                  }
                 %>
