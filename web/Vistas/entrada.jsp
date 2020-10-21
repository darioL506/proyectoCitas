<%-- 
    Document   : entrada
    Created on : 21-oct-2020, 12:49:18
    Author     : dario
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Mensaje"%>
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
            <div class="col-m-1 col-2"></div>
            <div class="col-m-10 col-8">
                <%
                    ConexionEstatica.nueva();
                    LinkedList <Mensaje> mensajes = ConexionEstatica.obtenerMensajesUsu(session.getAttribute("emailAct").toString());
                    
                    for(Mensaje aux: mensajes) {
                        %>
                        <div class="row" id="mensaje">
                            <div class="col-4"><a href="javascript:void(0);" onclick="verMensaje(this)"><%=aux.getAsunto()%></a></div>
                            <div class="col-4"><%=aux.getAsunto()%></div>
                            <div class="col-4"><%=aux.getFecha()%></div>
                            <input type="text" name="cuerpoMensaje" class="col-12" style="display: none" value="<%=aux.getCuerpo()%>">
                                
                            
                        </div>
                        <%
                    }
                    ConexionEstatica.cerrarBD();
                %>
            </div>
            <div class="col-m-1 col-2"></div>
        </main>
    </body>
</html>
