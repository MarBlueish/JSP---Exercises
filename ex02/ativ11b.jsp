<%@page contentType="text/html" import="java.util.*, java.text.*" pageEncoding="utf8"%>
<html>
    <head>
    <title>Exemplo Jsp - 2</title>
    <meta charset="utf-8">
    </head>
<body>
    <%
        int n1= Integer.parseInt(request.getParameter("n1"));
        int n2= Integer.parseInt(request.getParameter("n2"));
        String op = request.getParameter("op");
        int resultado = 0;
        out.print("<h1>Calculadora 2</h1>");

        if(op.equals("som")){
            resultado = n1 + n2;
            out.print("<br/> O resultado da operação é " +resultado);
        } else if (op.equals("dif")){
            resultado = n1 - n2;
            out.print("<br/> O resultado da operação é " +resultado);
        } else if (op.equals("mult")){
            resultado = n1 * n2;
            out.print("<br/> O resultado da operação é " +resultado);
        }else if(op.equals("div")){
            if (n2 != 0){
                float resultado = Float.parseFloat(request.getParameter("n1")) / Float.parseFloat(request.getParameter("n2"));
                out.print("<br/> O resultado da operação é " +resultado);
            } else{
                out.print("Operação impossivel");
            }    
        } 
        %>
</body>
</html>