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
        <title>JSP Page</title>
    </head>
    <body>
        <header></header>
        <main class="row">
            <div class="col-1"></div>
            <div class="col-10" style="text-align: center">
                <%
                ConexionEstatica.nueva();
                LinkedList<Usuario> usuarios = ConexionEstatica.obtenerUsuariosBasic();
                %>
                <label class="row">   
                    <label class="col-1"></label>
                    <label class="col-3">Email</label>
                    <label class="col-2">Nombre</label>
                    <label class="col-2">Apellido</label>
                    <label class="col-1"></label>  
                    <label class="col-1">Habilitar</label>
                    <label class="col-1">Admin</label>         
                </label>
                <%
                for(Usuario aux : usuarios) {
                %>
                <form name="formAdmin>" action="../controlador.jsp" method="POST">
                    <label class="row">   
                        <label class="col-1"></label>
                        <label class="col-3" name ="email" value="<%=aux.getEmail()%>"><%=aux.getEmail()%></label>
                        <input type="text" name ="emailAd" value="<%=aux.getEmail()%>" style="display: none">
                        <label class="col-2" name ="nombreAd"><%=aux.getName()%></label>
                        <label class="col-2" name ="apellidoAd"><%=aux.getApellido()%></label>  
                        <label class="col-1">
                            <input type="submit" name="borrarCrud" value="B">
                        </label>                        
                        <label class="col-1">
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
                        </label>
                        <label class="col-1">
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
                        </label>                        
                    </label>                                        
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
