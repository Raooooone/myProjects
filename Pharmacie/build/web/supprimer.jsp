<%-- 
    Document   : supprimer
    Created on : 11 déc. 2023, 13:58:18
    Author     : rawen
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        
        String id = request.getParameter("id");
        String requete ="delete from medicaments where id="+id;
        try{
           
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/pharmacie?useSSL=false","root","admin");
           Statement st=conn.createStatement();
           st.executeUpdate(requete);
          
          
          
           }catch(Exception e){
           System.out.print(e.toString());
        }
        %>
    </body>
</html>
