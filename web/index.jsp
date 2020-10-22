<%-- 
    Document   : index
    Created on : 14 oct. 2020, 18:26:25
    Author     : dario
--%>

<%@page import="java.io.File"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Paths"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Comun/estilos.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        
        <header>
            <jsp:include page="Comun/header.jsp"/>            
        </header>               
        
        <main class="row">
            <div class="col-m-1 col-2"></div>
            <div class="col-m-10 col-8">
                <div class="row">
                    <div class="col-m-12 col-12">
                        <form name="form1" action="controlador.jsp">
                            <div class="row">                                
                                <div class="col-m-12 col-12"></div>
                                <div class="col-m-1 col-1"></div>
                                <div class="col-m-3 col-3">Usuario:</div>
                                <input class="col-m-7 col-7" type="email" name="emailLogin" placeholder="email@gmail.com" required>         
                                <div class ="col-m-1 col-1"></div>
                                <div class="col-m-12 col-12"></div>
                            </div>
                            <div class="row">
                                <div class="col-m-12 col-12"></div>
                                <div class="col-m-1 col-1"></div>
                                <div class="col-m-4 col-4">Contraseña </div>
                                <input class="col-m-6 col-6" type="password" name="passwordLogin" required>
                                <div class="col-m-1 col-1"></div>
                                <div class="col-m-12 col-12"></div>
                            </div>
                            <div class="row">
                                <div class="col-m-5 col-5"></div>
                                <div class="col-m-2 col-2">
                                    <input type="submit" name="submLog" value="Aceptar"> 
                                </div>
                                <div class="col-m-5 col-5"></div>
                            </div>                                                      
                        </form>
                    </div>                    
                    <div class="col-m-6 col-6 row">
                        <div class="col-m-12 col-12"><a href="Vistas/registro.jsp">¿No tienes cuenta?</a></div>                        
                    </div>
                    <div class="col-m-6 col-6 row">
                        <div class="col-m-12 col-12"><a href="">¿Te has olvidado de tu contraseña?</a></div>                        
                    </div>
                </div>                
            </div>
            <div class="col-m-1 col-2"></div>                                    
        </main>
        
        <footer>
            
        </footer>
    </body>
</html>
