<%-- 
    Document   : valido
    Created on : 14 oct. 2020, 18:37:05
    Author     : dario
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Preferencias"%>
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
                <div class="row">
                    <div class="col-m-6 col-6">
                        <%
                        ConexionEstatica.nueva();
                        Preferencias pref = (Preferencias) session.getAttribute("prefAct");
                        Usuario usu = ConexionEstatica.Get_Usuario(session.getAttribute("emailAct").toString());
                        %>
                        <div class="row">
                            <div class="col-m-12 col-6">
                                <div class="row">
                                    <div class="col-m-12 col-12">Tus datos</div>
                                    <div class="col-m-12 col-12">Nombre:</div>
                                    <div class="col-m-12 col-12"><%=usu.getName()%> <%=usu.getApellido()%></div>
                                    <div class="col-m-12 col-12">Edad: <%=usu.getEdad()%></div>
                                    <div class="col-m-12 col-12">Género: 
                                        <% if(usu.getGenero().equals("m")){
                                            %>Hombre<%
                                        } else {
                                            %>Mujer<%
                                        }%>                            
                                    </div>
                                </div>
                            </div>
                            <div class="col-m-12 col-6">
                                <div class="row">
                                    <div class="col-m-12 col-12">Tu perfil</div>
                                    <div class="col-m-12 col-12">Relacion seria: 
                                        <% if(pref.getRelacion()){
                                            %>Sí<%
                                        } else {
                                            %>No<%
                                        }%>                            
                                    </div>
                                    <div class="col-m-12 col-12">Deportes: <%=pref.getDeportes()%></div>
                                    <div class="col-m-12 col-12">Arte <%=pref.getArte()%></div>
                                    <div class="col-m-12 col-12">Política: <%=pref.getPolitica()%></div>
                                    <div class="col-m-12 col-12">Quieres hijos: 
                                        <% if(pref.getHijos()){
                                            %>Sí<%
                                        } else {
                                            %>No<%
                                        }%>                            
                                    </div>
                                    <div class="col-m-12 col-12">Interés: 
                                        <% if(pref.getInteres().equals("m")){
                                            %>Hombres<%
                                        } else if(pref.getInteres().equals("f")) {
                                            %>Mujeres<%
                                        } else  {
                                            %>Hombres y mujeres<%
                                        }%>                            
                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="col-m-6 col-6">                        
                        <div class="row vertical-menu">
                            <div class="col-m-12 col-12"><a href="preferencias.jsp">Editar preferencias</a></div>
                            <div class="col-m-12 col-12"><a href="editarUsuario.jsp">Editar perfil</a></div>
                            <div class="col-m-12 col-12"><a href="entrada.jsp">Ver mensajes</a></div>
                            <div class="col-m-12 col-12"><a href="mensaje.jsp">Nuevo mensaje</a></div>
                            <div class="col-m-12 col-12"><a href="amigos.jsp">Ver amigos</a></div>
                            <div class="col-m-12 col-12"><a href="busqueda.jsp">Busqueda</a></div>
                        </div>                        
                    </div>
                </div>
            </div>
            <div class="col-m-1 col-1"></div>
        </main>
        
        <footer>
            <jsp:include page="../Comun/footer.jsp"/>    
        </footer>
    </body>
</html>
