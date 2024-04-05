<%-- 
    Document   : eliminar2
    Created on : 18/03/2024, 16:01:19
    Author     : Marco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elimina 2</title>
    </head>
    <body>
        <%
            String idParam = request.getParameter("id");
            int id = Integer.parseInt(idParam);
            try{
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_01", "root", "");
            Statement stmt = conn.createStatement();      
            
            String sql = "DELETE FROM t_cliente WHERE Id=?";
            PreparedStatement stm = conn.prepareStatement(sql);
            
            stm.setInt(1,id);
            
            int rowsDeleted = stm.executeUpdate();
            if (rowsDeleted > 0){
                out.println("<h2>Registo Apagado com Sucesso</h2>");
            } else {
                out.println("Não existe nenhum registo com este id:" + id);
            }
            stm.close();
            conn.close();
            } catch (Exception e){
            out.println("Ocorreu um erro: " + e.getMessage());
            }
            %>
    </body>
</html>
