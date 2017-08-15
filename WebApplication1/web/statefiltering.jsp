<%-- 
    Document   : statefiltering
    Created on : Aug 14, 2017, 12:45:54 PM
    Author     : imhn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%String state=request.getParameter("state");
       try{
           Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           Connection con=DriverManager.getConnection("jdbc:odbc:mus","scott","tiger");
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select img,title,short_desc from mus where state='"+state+"'");
           while(rs.next()){
               %> <form action="" method="post">
                   <input type="radio" name="title" value="<%=rs.getString("title")%>">
                   <%out.println(rs.getString("title"));%>
                   <img scr="<%rs.getString("img");%>" alt="<%=rs.getString("title")%>">   
                   <%out.println(rs.getString("short_desc"));%><br> 
                   <input type="submit" value="search">
               </form>
           <%}  }       catch(Exception e){out.println(e);}%>
    </body>
</html>
