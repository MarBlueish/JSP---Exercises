<%-- 
    Document   : insere
    Created on : 18/03/2024, 14:42:35
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
                    String sql = "INSERT INTO t_cliente (Nome, Morada, Zona, Nif, VolFatur) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement stmt = conn.prepareStatement(sql);

                    stmt.setString(1, Nome);
                    stmt.setString(2, Morada);
                    stmt.setString(3, Zona);
                    stmt.setString(4, Nif);
                    stmt.setString(5, Volfatur);
    
                    // Executar a inserção
                    int rowsAffected = stmt.executeUpdate();

                    //Encerra o leitor e a conexão.
                    stmt.close();
                    conn.close();
                    
                    //Se mais de uma linha da tabela for afetada...
                    if (rowsAffected > 0) {
                        msg = true;
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
            alert("Dados inseridos com sucesso!");
            window.location.href = "insere.html";
        <% } else {%>
            alert("Preencha os Campos Devidamente!");
            window.location.href = "insere.html";
        <% } %>
    </script>
    </body>
</html>
