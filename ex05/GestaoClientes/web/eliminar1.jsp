<%-- 
    Document   : eliminar1
    Created on : 18/03/2024, 15:55:30
    Author     : Marco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <h1>Eliminação de Utilizadores</h1>
    <form method="post" action="eliminar2.jsp">
        <label> Cliente: 
            <select name="id">
                <% 
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_01", "root", "");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM t_cliente ORDER BY Nome ASC");
                    while (rs.next()) {
                %>
                <option value="<%= rs.getInt("Id") %>"><%= rs.getString("Nome") %></option>
                <% 
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("An error occurred: " + e.getMessage());
                }
                %>
            </select>
        </label>
        <input type="submit" value="Apagar">
    </form>
</body>
</html>

