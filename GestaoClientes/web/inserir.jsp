<%-- 
    Document   : inserir
    Created on : 18/03/2024, 15:54:14
    Author     : Marco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Inserir</title>

    </head>

    <body>

        <h1>Inserir Registos</h1>

    <%

        if (request.getMethod().equals("POST")) 

        {

        String nome = request.getParameter("nome");

        String morada = request.getParameter("morada");

        String zona = request.getParameter("zona");

        String nif = request.getParameter("nif");

        String volFatur = request.getParameter("volFatur");

        String url= "jdbc:mysql://localhost:3306/bd_01_323";

        String username = "root";

        String password ="";

    try {

        Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection(url, username , password);

                String sql = "INSERT INTO t_cliente ( nome, morada, zona, nif, volFatur)" + 

                "VALUES (?,?,?,?,?)";

                PreparedStatement statement = conn.prepareStatement (sql);

                statement.setString(1, nome);

                statement.setString(2, morada);

                statement.setString(3, zona);

                statement.setString(4, nif);

                statement.setString(5, volFatur);

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

    }else{

        %>

        <form method="post" action="insere.jsp">

            <label>Nome: <input type="text" name="nome" size="60" placeholder="Coloque o seu nome"> </label> <br><br>

            <label>Morada: <input type="text" name="morada" size="60" placeholder="Coloque a sua morada"> </label> <br><br>

            <label>Zona: <input type="text" name="zona" size="60" placeholder="Coloque a zona"> </label> <br><br>

            <label>Nif: <input type="text" name="nif" size="9" placeholder="Coloque o seu NIF"> </label> <br><br>

            <label>Volume Fatura: <input type="text" name="volFatur" size="9" placeholder="Valor"> </label> <br><br>

            <input type="submit" value="Inserir">

            </form>

        <%

            }

            %>

            <a href="listar.jsp" target="_self">Voltar ao Menu</a>

    </body>

</html>