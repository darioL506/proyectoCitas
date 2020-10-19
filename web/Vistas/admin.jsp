<%-- 
    Document   : admin
    Created on : 14 oct. 2020, 19:11:40
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
        <link rel="stylesheet" type="text/css" href="../css/rejillas.css">
        <link rel="stylesheet" type="text/css" href="../css/header.css">
        <script src="https://kit.fontawesome.com/3cf8885432.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <jsp:include page="../Comun/header.jsp"/>
        </header>
        <main class="row">
            <div class="col-1"></div>
            <div class="col-10" style="text-align: center">
                <%
                ConexionEstatica.nueva();
                LinkedList<Usuario> usuarios = ConexionEstatica.obtenerUsuariosBasic();
                %>
                <div class="row">   
                    <div class="col-1"></div>
                    <div class="col-3">Email</div>
                    <div class="col-2">Nombre</div>
                    <div class="col-2">Apellido</div>
                    <div class="col-1"></div>  
                    <div class="col-1">Habilitar</div>
                    <div class="col-1">Admin</div>         
                </div>
                <%
                for(Usuario aux : usuarios) {
                %>
                <form name="formAdmin>" action="../controlador.jsp" method="POST">
                    <div class="row">   
                        <div class="col-1"></div>
                        <div class="col-3" name ="email" value="<%=aux.getEmail()%>"><%=aux.getEmail()%></div>
                        <input type="text" name ="emailAd" value="<%=aux.getEmail()%>" style="display: none">
                        <div class="col-2" name ="nombreAd"><%=aux.getName()%></div>
                        <div class="col-2" name ="apellidoAd"><%=aux.getApellido()%></div>  
                        <div class="col-1">
                            <input type="submit" name="borrarCrud" value="B">
                        </div>                        
                        <div class="col-1">
                            <%
                            if( !aux.isActivo()) {
                            %>
                            <input type="submit" name="activCRUD" value="Habilitar">
                            <%
                            } else {
                            %>
                            <input type="submit" name="desCRUD" value="Deshabilitar">
                            <%
                            }
                            %>                                                        
                        </div>
                        <div class="col-1">
                            <%
                            ConexionEstatica.nueva();
                            Boolean hasAdmin = ConexionEstatica.getRol(aux.getEmail(),0);
                            if( hasAdmin) {
                            %>
                            <input type="submit" name="revokeAdmin" value="Revocar">
                            <%
                            } else {
                            %>
                            <input type="submit" name="setAdmin" value="Otorgar">
                            <%
                            }
                            %>                                                        
                        </div>                        
                    </div>                                        
                </form>
                <%                      
                }
                %>
            </div>
            <div class="col-1"></div> 
        </main>
        <footer></footer>
    </body>
</html>
