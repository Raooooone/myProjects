<%-- 
    Document   : liste
    Created on : 11 déc. 2023, 13:59:51
    Author     : rawen
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Médicaments</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #0e2559;
            color: #fff;
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dee2e6;
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #0e2559;
            color: #fff;
        }

        a {
            background-color: #343a40;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease-in-out;
        }

        a:hover {
            background-color: #007bff;
        }

        footer {
            margin-top: 20px;
            background-color: #0e2559;
            color: #fff;
            text-align: center;
            padding: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Liste des Médicaments</h1>
    </header>

    <table>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prix</th>
            
        </tr>
        <%
            String requete = "select * from medicaments";
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/pharmacie?useSSL=false", "root", "admin");
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(requete);

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        
                    </tr>
        <%
                }
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        %>
    </table>

    <footer>
        <p>&copy; 2023 Pharmacie XYZ</p>
    </footer>
</body>
</html>



