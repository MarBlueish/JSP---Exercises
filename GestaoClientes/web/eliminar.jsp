<%-- 
    Document   : eliminar
    Created on : 18/03/2024, 16:41:17
    Author     : Marco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="CSS/listar.css">
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Utilizadores</title>
    </head>
    <body>
        <h1>Eliminar Utilizadores</h1>
        
        <% 
            
            if(request.getMethod().equals("POST")) {
            
                try {
            
                String idParam = request.getParameter("id");
                int Id = Integer.parseInt(idParam);
                
                Class.forName("com.mysql.jdbc.Driver");
            
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_01", "root", "");
                Statement stmt = conn.createStatement();      

                String sql = "DELETE FROM t_cliente WHERE Id=?";
                PreparedStatement stm = conn.prepareStatement(sql);

                stm.setInt(1,Id);

                int rowsDeleted = stm.executeUpdate();
                if (rowsDeleted > 0){
                    out.println("<h2>Registo Apagado com Sucesso</h2>");
                    response.sendRedirect("listar.jsp");
                } else {
                    out.println("Não existe nenhum registo com edde id:" + Id);
                }
                stm.close();
                conn.close();
                } catch (Exception e){
                out.println("Ocorreu um erro: " + e.getMessage());
            }
        
            
            } else {
            
            %>
            
            <form method="post" action="eliminar.jsp">
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
            <input type="submit" value="Apagar"> 
        </form>
            
            <%}

        %>
    </body>
</html>