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
            <div class="hidden col-2"></div>
            <div class="col-m-12 col-8">
                <div class="row" style="text-align: center">
                    <div class="col-m-4 col-4">Asunto</div>
                    <div class="col-m-6 col-4">Emisor</div>
                    <div class="col-m-2 col-4">Fecha</div>
                </div>
                <%
                ConexionEstatica.nueva();
                LinkedList <Mensaje> mensajes = ConexionEstatica.obtenerMensajesUsu(session.getAttribute("emailAct").toString());

                for(Mensaje aux: mensajes) {
                %>
                <div class="row" id="mensaje" style="text-align: center">
                    <div class="dropdown">
                        <div class="col-m-4 col-4"><%=aux.getAsunto()%></div>
                        <div class="col-m-6 col-4"><%=aux.getEmisor()%></div>
                        <div class="col-m-2 col-4"><%=aux.getFecha()%></div>

                        <textarea class="col-12 dropdown-content" name="cuerpoMensaje" readonly><%=aux.getCuerpo()%></textarea>

                    </div>
                </div>
                <%
                }
                ConexionEstatica.cerrarBD();
                %>
            </div>
            <div class="hidden col-2"></div>
            <footer>
                <jsp:include page="../Comun/footer.jsp"/>
            </footer>
        </main>
    </body>
</html>
