<%-- 
    Document   : amigos
    Created on : 23-oct-2020, 12:35:46
    Author     : dario
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Preferencias"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../Comun/estilos.jsp"/>
    </head>
    <body>
        <header>
            <jsp:include page="../Comun/header.jsp"/>
        </header>
        <main class="row">
            
            <div class="col-m-1 col-1"></div>
            <div class="col-m-10 col-10">
                <div class="row" style="text-align: center">
                    <div class="col-m-4 col-3 hidden">Nombre</div>
                    <div class="col-m-3 col-3 hidden">Edad</div>
                    <div class="col-m-3 col-3 hidden">Género</div>
                    <div class="col-m-2 col-3 hidden"></div>
                    <div class="col-m-12 hiddenMov"></div>
                    <div class="col-12"></div>
                    <%                                          
                    ConexionEstatica.nueva();                    
                    LinkedList <String> emails = ConexionEstatica.Get_Amigos(session.getAttribute("emailAct").toString());
                    for (String aux:emails) {                        
                        Usuario usu = ConexionEstatica.Get_Usuario(aux);                        
                    %>                        
                    <form name="form1" action="../controlador.jsp">
                        <input type="email" name="emailF" value="<%=usu.getEmail()%>" style="display: none">
                        <div class="col-m-4 col-3"><%=usu.getName()%> <%=usu.getApellido()%></div>
                        <div class="col-m-3 col-3"><%=usu.getEdad()%></div>
                        <div class="col-m-3 col-3">                        
                        <%
                        if(usu.getGenero().equals("m")) {
                          %>Hombre<%  
                        } else {
                          %>Mujer<%  
                        }%>
                        </div>
                        <div class="col-m-1 col-1">
                            <button type="submit" name="rechazarF"><i class="fas fa-trash"></i></i></button>
                        </div> 
                        <%
                        if(!ConexionEstatica.Is_Amigo(usu.getEmail(), session.getAttribute("emailAct").toString()) 
                                && !ConexionEstatica.Envia_Peticion(usu.getEmail(), session.getAttribute("emailAct").toString())) {
                        %>
                        <div class="col-m-1 col-1">
                            <button type="submit" name="aceptarF"><i class="far fa-heart"></i></button>
                        </div>
                        <div class="col-m-1 col-1"></div>                                               
                        <%
                        } else {
                        %>                        
                    </form>
                    <%
                        }
                    }                    
                    ConexionEstatica.cerrarBD();
                    %>
                </div>
            </div>
            <div class="col-m-1 col-1"></div>
        </main>
        <footer>

        </footer>
    </body>
</html>
