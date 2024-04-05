<%-- 
    Document   : listar
    Created on : 15/03/2024, 18:23:48
    Author     : Marco
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listagem</title>
</head>
<body>

<h1>Listagem de dados</h1>

<table border="1">
  <tr>
    <th>Id</th>
    <th>Nome</th>
    <th>Morada</th>
    <th>Zona</th><!-- comment -->
    <th>Nif</th><!-- comment -->
    <th>Volume Faturamento</th>
    <th>Média</th>
    
  </tr>

<%
int num = 0;
float media = 0;
try {
    Class.forName("com.mysql.jdbc.Driver");
    //nome do server, user e pass
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_01", "root", "");
    Statement stmt = conn.createStatement();
    //executa a instrução na bd à qual criei a ligação
    ResultSet rs = stmt.executeQuery("SELECT * FROM t_cliente ");

    while (rs.next()) {
        %>
       
        <tr>
          <td><%= rs.getInt("id") %></td>
          <td><%= rs.getString("nome") %></td>
          <td><%= rs.getString("Morada") %></td>
          <td><%= rs.getString("Zona") %></td>
          <td><%= rs.getInt("Nif") %></td>
          <td><%= rs.getFloat("VolFatur") %></td>
          <% num ++;
          media = media + rs.getFloat("VolFatur"); %>    
        </tr>
        <%
    }
        %>
<tr>
    <td colspan="6">Número de registo na BD </td>
    <td><%= num %></td>
</tr>
<tr>
    <td colspan="6">Média de Faturações </td>
    <td><%= media/num %></td>
</tr>

<%;
    rs.close();

    stmt.close();
    conn.close();
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
}
%>

</table>

</body>
</html>
