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
            <div class="col-2"></div>
            <div class="col-8">
                <%
                ConexionEstatica.nueva();
                LinkedList<Usuario> usuarios = ConexionEstatica.obtenerUsuarios();
                %>
                <label class="row">   
                    <label class="col-1"></label>
                    <label class="col-2" name ="dni">Email</label>
                    <label class="col-2" name ="dni">Nombre</label>
                    <label class="col-2" name ="dni">Apellido</label>
                    <label class="col-1" name ="dni">Edad</label>
                    <label class="col-1" name ="dni">Genero</label>
                    <label class="col-1"></label>
                </label>
                <%
                for(Usuario aux : usuarios) {
                %>
                <form name="formAdmin>" action="../controlador.jsp" method="POST">
                    <label class="row">   
                        <label class="col-1"></label>
                        <label class="col-2" name ="dni"><%=aux.getEmail()%></label>
                        <label class="col-2" name ="dni"><%=aux.getName()%></label>
                        <label class="col-2" name ="dni"><%=aux.getApellido()%></label>
                        <label class="col-1" name ="dni"><%=aux.getEdad()%></label>
                        <label class="col-1" name ="dni"><%=aux.getGenero()%></label>
                        <label class="col-1"></label>
                    </label>
                    <label class="row">
                        <label class="col-12">
                         
                        <input class="col-1"type="submit" name="borrarCrud" value="Borrar">
                        <input class="col-1"type="submit" name="activCRUD" value="Activar">
                        <input class="col-1"type="submit" name="desactCrud" value="Desactivar"> 
                    </label>
                    
                </form>
                <%                      
                }
                %>
            </div>
            <div class="col-2"></div> 
        </main>
        <footer></footer>
    </body>
</html>
