<%-- 
    Document   : controlador
    Created on : 14-oct-2020, 12:29:24
    Author     : dario
--%>

<%@page import="java.util.LinkedList"%>
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
                Usuario aux = ConexionEstatica.login(request.getParameter("email"),request.getParameter("password"));
                
                if(aux!=null) {                   
                    
                    Boolean hasAdmin = ConexionEstatica.getRol(request.getParameter("email"));
                                        
                    ConexionEstatica.cerrarBD();
                    
                    if(hasAdmin) {
                        response.sendRedirect("Vistas/admin.jsp");
                    } else {                    
                        response.sendRedirect("Vistas/valido.jsp");
                    }
                }
            }
        %>
    </body>
</html>
