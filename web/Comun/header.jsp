<%-- 
    Document   : header
    Created on : 19 oct. 2020, 20:22:16
    Author     : dario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   
    <body>
        <div class="header">
            <a href="#default" class="logo">CompanyLogo</a>   
            <% if(request.getPathInfo().toString().equals("/index.jsp")){
            %><a class="active" href="index.jsp">Home</a><%
            } else {
                %><a href="../index.jsp">Home</a><%   
            }%>
            <div class="header-right">                              
                <div class="headerNav">
                    <div class="dropdown">    

                        <button class="dropbtn">
                            Darío León <i class="fa fa-caret-down" aria-hidden="true"></i>
                        </button>    

                        <div class="dropdown-content">
                            <a href="">Editar perfil</a>
                            <a href="/proyectoCitas/Vistas/preferencias.jsp">Editar preferencias</a>
                            <a href="">Ver amigos</a>                                
                            <a href="#">Cerrar sesion</a>
                        </div>
                    </div>
                </div>                
            </div>
        </div>
    </body>
</html>
