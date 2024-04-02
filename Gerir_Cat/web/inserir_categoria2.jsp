<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
            <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Index</title>
</head>
<body>
<% 
    try {           
        //Guarda os dados do formulário.
        String categoria = request.getParameter("nome");

        // Se algum campo estiver vazio, exibe uma mensagem de erro
        if (categoria.equals("")) {
            response.sendRedirect("gerir_categoria.jsp"); 
        } else {         
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");

            // Preparar a declaração SQL usando um PreparedStatement para evitar injeção de SQL
            String sql = "INSERT INTO t_categoria (descricao) VALUES (?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, categoria);

            // Executar a inserção
            int rowsAffected = stmt.executeUpdate();

            //Encerra o leitor e a conexão.
            stmt.close();
            conn.close();

            //Se mais de uma linha da tabela for afetada...
            if (rowsAffected > 0) {
                out.println("Inserido");
                response.sendRedirect("gerir_categoria.jsp"); 
            }
        }
    } catch (Exception e) {
        out.println("Erro!");
    }
%> 
</body>
</html>
