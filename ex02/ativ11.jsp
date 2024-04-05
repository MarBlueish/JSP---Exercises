<%@page contentType="text/html" import="java.util.*, java.text.*" pageEncoding="utf8"%>
<html>
    <head>
    <title>Exemplo Jsp</title>
    <meta charset="utf-8">
    </head>
<body>
    <%
        int n1= Integer.parseInt(request.getParameter("n1"));
        int n2= Integer.parseInt(request.getParameter("n2"));
        int resultado = n1+n2;
        out.print("<h1>Calculadora</h1>");
        out.print("<h3>A soma de "+ n1 +"com " + n2 + " = " + resultado + "</h3>");
        %>
</body>
</html>
