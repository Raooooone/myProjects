<%-- 
    Document   : ajoute
    Created on : 11 déc. 2023, 13:49:10
    Author     : rawen
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
        String nommedicament=request.getParameter("nommedicament");
        String prixmedicament=request.getParameter("prixmedicament");
        String dl =request.getParameter("dl");
        String requete="insert into medicaments values (null,'"+nommedicament+"','"+prixmedicament+"','"+dl+"')";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacie?useSSL=false","root","admin");
            Statement st = connection.createStatement();
            st.executeUpdate(requete);
            out.print("medicaments ajouté avec succes");
        }
        catch(Exception E ){
            System.out.print(E.toString());
        
        }
        %>
    </body>
</html>
