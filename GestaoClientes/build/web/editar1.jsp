<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href ="style.css" rel="stylesheet" type="text/css">
        <title>Editar</title>
    </head>
    <body>
        <h1>.:Editar Cliente:.</h1>
        <form method="post" action="editar2.jsp">
    <label>Cliente: 
        <select name="id">
            <% try {
                Class.forName("com.mysql.jdbc.Driver");
                //nome do server, user e pass
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_01", "root", "");
                Statement stmt = conn.createStatement();
                //executa a instrução na bd à qual criei a ligação
                ResultSet rs = stmt.executeQuery("SELECT * FROM t_cliente");

                while(rs.next()) {
            %>
                <option value="<%= rs.getInt("Id") %>"><%= rs.getString("Nome") %></option>
            <% } 
                rs.close();
                stmt.close();
                conn.close();
               } catch (Exception e) {
                   out.println("An error ocurred: " + e.getMessage());
               } %> 
        </select>
    </label>
    <input type="submit" value="Editar"> 
</form>
</body>
</html>