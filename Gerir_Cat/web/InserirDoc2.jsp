<%-- 
    Document   : InserirDoc2
    Created on : 01/04/2024, 16:37:51
    Author     : Marco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <%
        String nome = request.getParameter("nome");
        String isbn = request.getParameter("isbn");
        String descricao = request.getParameter("descricao");
        String tamanho = request.getParameter("tamanho");
        String foto = request.getParameter("foto");
        String ficheiro = request.getParameter("ficheiro");
        String id_subcat = request.getParameter("id_subcat");
        
        
           
    %>
<% 
    try {           
    
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");
       

            // Preparar a declaração SQL usando um PreparedStatement para evitar injeção de SQL
            String sql = "INSERT INTO t_documento (nome, isbn, descricao, tamanho, foto, ficheiro, id_subcat) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, nome);
            stmt.setString(2, isbn);
            stmt.setString(3, descricao);
            stmt.setString(4, tamanho);
            stmt.setString(5, foto);
            stmt.setString(6, ficheiro);
            stmt.setString(7, id_subcat);

            // Executar a inserção
            int rowsAffected = stmt.executeUpdate();
            
                if (rowsAffected > 0) {
                out.println("<h2>Registo Inserido com sucesso</h2>");
                }else{
                    out.println("Erro na inserção");
                }

            //Encerra o leitor e a conexão.
            stmt.close();
            conn.close();

            

        }
         catch (Exception e) {
            out.println("Erro: " + e.getMessage());
    }
%> 
</body>
</html>
