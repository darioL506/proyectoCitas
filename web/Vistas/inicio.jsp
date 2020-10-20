<%-- 
    Document   : valido
    Created on : 14 oct. 2020, 18:37:05
    Author     : dario
--%>

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
                <div class="row">
                    <div class="col-m-6 col-6">
                        
                    </div>
                    <div class="col-m-6 col-6">
                        <form name="form1" action="../controlador.jsp">
                            <div class="row">
                                <div class="col-12"><input type="submit" name="userPref" value="Editar preferencias"></div>
                                <div class="col-12"><input type="submit" name="userMail" value="Ver mensajes"></div>
                                <div class="col-12"><input type="submit" name="userNewM" value="Nuevo mensaje"></div>
                                <div class="col-12"><input type="submit" name="userFriends" value="Ver amigos"></div>
                                <div class="col-12"><input type="submit" name="userSearch" value="Buscar></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-m-1 col-2"></div>
        </main>
        
        <footer>
            
        </footer>
    </body>
</html>
