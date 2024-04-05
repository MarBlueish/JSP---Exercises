<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">
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

        <title>Gerir Documentos</title>

        <!-- CSS FILES -->                
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,700;1,200&family=Unbounded:wght@400;700&display=swap" rel="stylesheet">
        
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-icons.css" rel="stylesheet">

        <link href="css/tooplate-kool-form-pack.css" rel="stylesheet">

<%
    if (request.getMethod().equals("POST")) 
        {
        String acao = request.getParameter("acao");
        //JDBC parametros de conexão
        String url= "jdbc:mysql://localhost:3306/bd_02";
        String username = "root";
        String password ="";
        try {
            //Load the MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                //Establish the connection
                    Connection conn = DriverManager.getConnection(url, username , password);
                    if(acao.equals("inserir")){
                        String Nome = request.getParameter("nome"); 
                        String ISBN = request.getParameter("isbn");
                        String Descricao = request.getParameter("descricao");
                        String Tamanho = request.getParameter("tamanho");
                        String Foto = "teste";
                        String Ficheiro = "teste2";     
                        String Categoria = request.getParameter("categoria");
                     try {

                           String sql = "INSERT INTO t_documento (Nome, ISBN, Descricao, Tamanho, Foto, Ficheiro, Id_subcat)" + 
                            "VALUES (?,?,?,?,?,?,?)";
 
                            PreparedStatement statement = conn.prepareStatement (sql);
                            statement.setString(1, Nome);
                            statement.setString(2, ISBN);
                            statement.setString(3, Descricao);
                            statement.setString(4, Tamanho);
                            statement.setString(5, Foto);
                            statement.setString(6, Ficheiro);
                            statement.setString(7, Categoria);
                        //executar a instrução SQL      
                            int rowsInserted = statement.executeUpdate();
                            if (rowsInserted >0) {
                                out.println("<h2>Registo inserido com sucesso </h2>");
                            } else{
                                out.println("Erro na inserção");
                            }
                            statement.close();
                            conn.close();
                            }
                            catch (Exception e){
                                out.println("Ocorreu um erro:" + e.getMessage());
                        }
                    } else 
                    {
                        String idParam = request.getParameter("id");
                        int id = Integer.parseInt(idParam);
                        Statement stmt = conn.createStatement();
                        String sql = "DELETE FROM t_documento WHERE Id=?";
                        PreparedStatement stm = conn.prepareStatement(sql);
                        stm.setInt(1,id);
                            int rowsDeleted = stm.executeUpdate();
                            if (rowsDeleted > 0) {
                              out.println("<h2>Registo Apagado com sucesso</h2>");
                              }else{
                              out.println("Não existe nenhum registo com esse id " + id);
                              }
                        stm.close();
                    } //fecha o apagar
                    conn.close();
                    }
                    catch (Exception e){
                        out.println("Ocorreu um erro:" + e.getMessage());
                }
        }
    %>
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
                
                
<h1>Gerir Documentos</h1>
 
    <table border="10" class="center" cellpadding="10">
<tr>
<th>Nome</th>
<th>ISBN</th>
<th>Descrição</th>
<th>Tamanho</th>
<th>Categoria</th>
<th>Ação</th>
</tr>
<%
    int num = 0;
    try {
    Class.forName("com.mysql.jdbc.Driver");
    //nome do server, user e pass
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");
    Statement stmt = conn.createStatement();
    //executa a instrução na bd à qual criei a ligação
    ResultSet rs = stmt.executeQuery("SELECT * FROM t_documento, t_categoria where t_documento.id_subcat=t_categoria.Id");
 
    
    while (rs.next()) {
        %>
<tr>
<td><%= rs.getString("nome") %></td>
<td><%= rs.getString("isbn") %></td>
<td><%= rs.getString("descricao") %></td>
<td><%= rs.getString("tamanho") %></td>
<td><%= rs.getString("id_subcat") %></td>
<td>
<form method="post" action="GerirDocumentos.jsp">
<input type="hidden" name="acao" value="apagar">
<input type="hidden" name="id" value ="<%= rs.getInt("id") %>">
<input type="submit" value="apagar">
</form>
</td>
<%num ++; %> 
</tr>
<%   
             }
       %> 
<tr><th colspan="5">Número de registo na BD</th>
<td><%= num %></td></tr>
<%
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
    }
%>
</table>
<h3>Inserir Documentos</h3>
<form method="post" action="GerirDocumentos.jsp">
<input type="hidden" name="acao" value="inserir">
<label>Nome: <input name="nome" type="text" size="50" placeholder="Nome do documento"></label><br><br>
<label>ISBN: <input name="isbn" type="text" size="20" placeholder="ISBN"></label><br><br>
<label>Descrição:<br> <textarea name="descricao" cols="80" rows="a"></textarea></label><br><br>
<label>Tamanho: <input name="tamanho" type="text" size="20" placeholder="999 Mb"></label><br><br>
<label>Foto: <input name="foto" type="file"></label><br><br>
<label>Ficheiro: <input name="ficheiro" type="file"></label><br><br>
<label>Categoria <select name="categoria">
<%
            try {
            Class.forName("com.mysql.jdbc.Driver");
            //nome do server, user e pass
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");
            Statement stmt = conn.createStatement();
            //executa a instrução na bd à qual criei a ligação
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
</select></label>
<input type="submit" value="Submit">
<br><br>
</form>

            </main>
</body>
<a href="index.html" target="_self">Voltar ao Menu</a>
</html>