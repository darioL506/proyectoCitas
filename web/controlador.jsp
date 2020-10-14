<%-- 
    Document   : controlador
    Created on : 14-oct-2020, 12:29:24
    Author     : dario
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("submLog")!=null) {
                ConexionEstatica.nueva();
                Usuario aux = ConexionEstatica.existeUsuario(request.getParameter("email"));
                
                if(aux!=null) {
                    session.sendRedirect("/correcto.jsp");
                }
            }
        %>
    </body>
</html>
