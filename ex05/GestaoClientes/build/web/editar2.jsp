<%-- 
    Document   : edita2
    Created on : 18/03/2024, 17:15:33
    Author     : Marco
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="CSS/listar.css">
    <title>Editar Cliente</title>
</head>
<body>
<%
    String idParam = request.getParameter("id");
    int id = Integer.parseInt(idParam);

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_01", "root", "");
        pstmt = conn.prepareStatement("SELECT * FROM t_cliente WHERE id = ?");
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
        
            String nome = rs.getString("Nome");
            String morada = rs.getString("Morada");
            String zona = rs.getString("Zona");
            String nif = rs.getString("Nif");
            String volFatur = rs.getString("VolFatur");
        
        %>     
            <h1>Alteração de Utilizadores</h1>
            <form action="editar3.jsp" method="post">
                <label for="lbl_id">Id: </label>
                <input type="text" id="text_id" name="id" size="60" readonly="true" value="<%= id %>">
                <br><br>
                <label for="lbl_nome">Nome: </label>
                <input type="text" id="text_nome" name="Nome" size="60" value="<%= nome %>">
                <br><br>
                <label for="lbl_morada">Morada: </label>
                <input type="text" id="text_morada" name="Morada" size="60" value="<%= morada %>">
                <br><br>
                <label for="lbl_zona">Zona: </label>
                <input type="text" id="text_zona" name="Zona" size="60" value="<%= zona %>">
                <br><br>
                <label for="lbl_nif">Nif: </label>
                <input type="text" id="text_nif" name="Nif" size="60" value="<%= nif %>">
                <br><br>
                <label for="lbl_volFatur">Volume de Fatura: </label>
                <input type="text" id="text_volFatur" name="VolFatur" size="60" value="<%= volFatur %>">
                <br><br>
                <input type="submit" value="Inserir">
            </form>
            <%
                    }
                } catch (Exception e) {
                    out.println("An error occurred: " + e.getMessage());
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException ex) {
                        out.println("An error occurred while closing connection: " + ex.getMessage());
                    }
                }
            %>
            <br><br>
            <a href="listar.jsp" target="_self">Voltar ao Menu</a>
</body>
</html>