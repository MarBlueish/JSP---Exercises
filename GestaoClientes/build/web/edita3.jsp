<%-- 
    Document   : edita3
    Created on : 18/03/2024, 18:19:25
    Author     : Marco
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <% 
        boolean msg = false;
        
        // Verifica se o formulário foi submetido
        if (request.getMethod().equals("POST")) {
        
            try {           
                //Guarda os dados do formulário.
                String idParam = request.getParameter("id");
                int id = Integer.parseInt(idParam);
                String Nome = request.getParameter("Nome");
                String Morada = request.getParameter("Morada");
                String Zona = request.getParameter("Zona");
                String Nif = request.getParameter("Nif");
                String Volfatur = request.getParameter("VolFatur");
                
                // Se algum campo estiver vazio, exibe uma mensagem de erro
                if (Nome.equals("") || Morada.equals("") || Zona.equals("") || Nif.equals("") || Volfatur.equals("")) {
                    msg = false;
                } else {         
                    // Registrar o driver JDBC e estabelecer a conexão com o banco de dados
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_01", "root", "");

                    // Preparar a declaração SQL usando um PreparedStatement para evitar injeção de SQL
                    String sql = "UPDATE t_cliente SET Nome=?, Morada=?, Zona=?, Nif=?, VolFatur=?)" + "WHERE Id=?";
                    PreparedStatement statement = conn.prepareStatement(sql);

                    statement.setString(1, Nome);
                    statement.setString(2, Morada);
                    statement.setString(3, Zona);
                    statement.setString(4, Nif);
                    statement.setString(5, Volfatur);
                    statement.setInt(6,id);
    

                    
                    int rowsInserted = statement.executeUpdate();
                    
                    if (rowsInserted > 0) {
                        msg = true;
                    } else {
                    
            }
                }
            } catch (Exception e) {
                e.printStackTrace();
                msg = false;
            }
        }
    %> 
    <script>
        <% if (msg) { %>
            alert("Registo Alterado com sucesso");
            window.location.href = "insere.html";
        <% } else {%>
            alert("Preencha os Campos Devidamente!");
            window.location.href = "insere.html";
        <% } %>
    </script>
    </body>
</html>