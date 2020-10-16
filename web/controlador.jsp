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
                Usuario aux = ConexionEstatica.login(request.getParameter("emailLogin"),request.getParameter("passwordLogin"));
                
                if(aux!=null) {                   
                    
                    Boolean hasAdmin = ConexionEstatica.getRol(request.getParameter("emailLogin"));
                                        
                    ConexionEstatica.cerrarBD();
                    
                    if(hasAdmin) {
                        response.sendRedirect("Vistas/admin.jsp");
                    } else {                    
                        response.sendRedirect("Vistas/valido.jsp");
                    }
                }
            }
            
            if (request.getParameter("borrarCrud")!=null) {
                ConexionEstatica.nueva();
                String aux = request.getParameter("emailAd");
                System.out.println(aux);
                ConexionEstatica.Borrar_Usuario(request.getParameter("emailAd"));
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/admin.jsp");
            }
            
            if (request.getParameter("activCRUD")!=null) {
                ConexionEstatica.nueva();
                ConexionEstatica.Set_Active(request.getParameter("emailAd"), true);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/admin.jsp");
            }
            
            if (request.getParameter("desCRUD")!=null) {
                ConexionEstatica.nueva();
                ConexionEstatica.Set_Active(request.getParameter("emailAd"), false);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/admin.jsp");
            }
            
        %>
    </body>
</html>
