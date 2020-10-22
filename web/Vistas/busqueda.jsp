<%-- 
    Document   : busqueda
    Created on : 22-oct-2020, 12:40:38
    Author     : dario
--%>

<%@page import="Modelo.Preferencias"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../Comun/estilos.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <jsp:include page="../Comun/header.jsp"/>
        </header>
        <main class="row">
            
            <div class="col-m-1 col-1"></div>
            <div class="col-m-10 col-10">
                <%  
                ConexionEstatica.nueva();                    
                LinkedList <Usuario> usu = ConexionEstatica.Busqueda((Preferencias) session.getAttribute("prefAct"));
                for (Usuario aux:usu) {
                    if(!aux.getEmail().equals(session.getAttribute("emailAct"))) {
                    %>
                        <div class="col-3"><%=aux.getName()%> <%=aux.getApellido()%></div>
                        <div class="col-3"><%=aux.getEdad()%></div>
                        <div class="col-3">
                            <%
                            if(aux.getGenero().equals("m")) {
                              %>Hombre<%  
                            } else {
                              %>Mujer<%  
                            }
                            %>                        
                        </div>
                        <div class="col-3">Botón</div>
                    <%
                    }
                }
                ConexionEstatica.cerrarBD();
                %>
            </div>
            <div class="col-m-1 col-1"></div>
            
        </main>
    </body>
</html>
