<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    //session.invalidate();
    session.removeAttribute("email");
    session.removeAttribute("pass");
    session.invalidate();
    out.println("<script>alert('You Logout');</script>");
    response.sendRedirect("Login.jsp");
    %>