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
                <div class="row" style="text-align: center">
                    <div class="col-m-4 col-3 hidden">Nombre</div>
                    <div class="col-m-3 col-3 hidden">Edad</div>
                    <div class="col-m-3 col-3 hidden">Género</div>
                    <div class="col-m-2 col-3 hidden"></div>
                    <div class="col-m-12 hiddenMov"></div>
                    <div class="col-12"></div>
                    <%                                        
                    ConexionEstatica.nueva();                    
                    LinkedList <String> emails = ConexionEstatica.Busqueda((Preferencias) session.getAttribute("prefAct"));                    
                    for (String aux:emails) {                        
                        Usuario usu = ConexionEstatica.Get_Usuario(aux);
                        if(!usu.getEmail().equals(session.getAttribute("emailAct")) && 
                                !ConexionEstatica.Is_Amigo(session.getAttribute("emailAct").toString(), usu.getEmail())) {
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
                                }
                                %>                        
                            </div>
                            <div class="col-m-3 col-3">
                                <button type="submit" name="sendRequest">
                                    <i class="far fa-heart"></i>
                                </button>
                            </div>
                        </form>
                        <%
                        }
                    }
                    ConexionEstatica.cerrarBD();
                    %>
                </div>
            </div>
            <div class="col-m-1 col-1"></div>
            <footer>
                <jsp:include page="../Comun/footer.jsp"/>
            </footer>
        </main>
    </body>
</html>
