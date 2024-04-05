<%-- 
    Document   : InserirDoc
    Created on : 01/04/2024, 14:55:42
    Author     : Marco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
         <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,700;1,200&family=Unbounded:wght@400;700&display=swap" rel="stylesheet">
        
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-icons.css" rel="stylesheet">

        <link href="css/tooplate-kool-form-pack.css" rel="stylesheet">
        <style>
    body {
        color: white !important;
            h1 {
        margin-top: 100px !Important;
    }
    h2{
        margin-top:100px !Important;
    }
    }
</style>
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
                 <div class="modal fade" id="subscribeModal" tabindex="-1" aria-labelledby="subscribeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <form action="#" method="get" class="custom-form mt-lg-4 mt-2" role="form">
                                <h2 class="modal-title" id="subscribeModalLabel">Stay up to date</h2>

                                <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="your@email.com" required="">

                                <button type="submit" class="form-control">Notify</button>
                            </form>
                        </div>

                        <div class="modal-footer justify-content-center">
                            <p>By signing up, you agree to our Privacy Notice</p>
                        </div>
                    </div>
                </div>
            </div>
            </main>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registo Documentos</title>
    </head>
    <body>
        <h1>Registo de Documentos</h1>
        <form action="InserirDoc2.jsp" method="post">
              <label>Nome : <input name="nome" type="text" size="50" placeholder="Nome do documento"></label>
            <br/><br/>
            <label>ISBN : <input name="isbn" type="text" size="20" placeholder="ISBN"></label>
            <br/><br/>
            <label>Descricao :<br/><textarea name="descricao" cols="80" rows="4"></textarea></label>
            <br/><br/>
            <label>Tamanho : <input name="tamanho" type="text" size="20" placeholder="999mb"></label>
            <br/><br/>
            <label>Foto : <input name="foto" type="file"></label>
            <br/><br/>
            <label>Ficheiro : <input name="ficheiro" type="file"></label>
            <br/><br/>
            <label>Categoria : <select name="categoria">
            
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM t_categoria");

                while (rs.next()) {
            %>
            
                <option value='<%= rs.getInt("id") %>'>
                <%= rs.getString("descricao") %></option>
                
                
            
            <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
            }
            %>
            </select>
            </label>
            <input type="submit" value="Inserir">
    </form>
        
    </body>
    <a href="index.html" target="_self">Voltar ao Menu</a>
</html>
