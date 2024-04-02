<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,700;1,200&family=Unbounded:wght@400;700&display=swap" rel="stylesheet">
        
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-icons.css" rel="stylesheet">

        <link href="css/tooplate-kool-form-pack.css" rel="stylesheet">
        <title>Gerenciamento de Categorias</title>
        <style>
    body {
        color: white !important;
            h1 {
        margin-top: 100px !Important;
    }
    
    }.center{
          margin-left: auto;
          margin-right: auto;
          border-spacing: 10px;
    }
</style>
    </head>
    <body>
                    <main>

            <header class="site-header">
                <div class="container">
                    <div class="row justify-content-between">

                        <div class="col-lg-12 col-12 d-flex">
                            <a class="site-header-text d-flex justify-content-center align-items-center me-auto" href="index.html">
                                <i class="bi-box"></i>

                                <span>
                                    Gestão de Documentos
                                </span>
                            </a>

                            <ul class="social-icon d-flex justify-content-center align-items-center mx-auto">

                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link bi-instagram"></a>
                                </li>

                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link bi-twitter"></a>
                                </li>

                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link bi-whatsapp"></a>
                                </li>
                            </ul>

                          

                            

                        </div>

                    </div>
                </div>
            </header>
        <h1>Gerenciamento de Categorias</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Categoria</th>
                <th>Ação</th>
            </tr>
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM t_categoria");

                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("descricao") %></td>
                <td>
                   <form method="post" action="eliminar_categoria.jsp">
                       <input type="hidden" value="<%= rs.getInt("id") %>" name="id">
                       <input type="submit" value="Eliminar">
                   </form>
                </td>        
            </tr>   
            
            <%
                }
            %>
            
            <h3>Inserir Categorias</h3>
            <form method="post" action="inserir_categoria2.jsp">
                 <input type="text" name="nome">
                 <input type="submit" value="Adicionar">
            </form>
            <%
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
            }
            %>
        </table>
    </div>
    </body>
    
    <a href="index.html" target="_self">Voltar ao Menu</a>
</html>
