<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<% 
    try {           
        //Guarda os dados do formulário.
        String id = request.getParameter("id");

        // Se algum campo estiver vazio, exibe uma mensagem de erro
        if (id.equals("")) {
            response.sendRedirect("gerir_categoria.jsp"); 
        } else {         
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");

            // Preparar a declaração SQL usando um PreparedStatement para evitar injeção de SQL
            String sql = "DELETE FROM t_categoria WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, id);

            // Executar a inserção
            int rowsAffected = stmt.executeUpdate();

            //Encerra o leitor e a conexão.
            stmt.close();
            conn.close();

            //Se mais de uma linha da tabela for afetada...
            if (rowsAffected > 0) {
                out.println("Removido");
                response.sendRedirect("gerir_categoria.jsp"); 
            }
        }
    } catch (Exception e) {
        out.println("Erro!");
    }
%> 
</body>
</html>
